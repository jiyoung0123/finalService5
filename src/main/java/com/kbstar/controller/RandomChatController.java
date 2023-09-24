package com.kbstar.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kbstar.dto.ChatRoomMap;
import com.kbstar.dto.RandomChat;
import com.kbstar.dto.RandomChatRoom;
import com.kbstar.mapper.RandomChatMapper;
import com.kbstar.service.randomChat.RandomChatServiceMain;
import com.kbstar.service.randomChat.chatService.MsgChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Controller
public class RandomChatController {
    @Autowired
    RandomChatMapper mapper;

    @Autowired
    SimpMessagingTemplate template;

    @Autowired
    MsgChatService msgChatService;

    @Autowired
    RandomChatServiceMain randomChatServiceMain;
    
    @MessageMapping("/randomReceiveall") // 모두에게 전송
    public void randomReceiveall(RandomChat msg, SimpMessageHeaderAccessor headerAccessor) {
//        send(target)라는 outbound로 msg를 보냄
        template.convertAndSend("/randomSend",msg);
    }
    @MessageMapping("/randomReceiveto") // 특정 Id에게 전송
    public void randomReceiveto(RandomChat msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        template.convertAndSend("/randomSend/to/"+target,msg);
    }

    @RequestMapping("/randomChatRoom1")
    public String randomChatRoom1(Model model){
        model.addAttribute("center", "randomChatRoom1");
        return "index";
    }

    // MessageMapping 을 통해 webSocket 로 들어오는 메시지를 발신 처리한다.
    // 이때 클라이언트에서는 /pub/chat/message 로 요청하게 되고 이것을 controller 가 받아서 처리한다.
    // 처리가 완료되면 /sub/chat/room/roomId 로 메시지가 전송된다.

    @MessageMapping("/pub/chat/enterUser")
    public void enterUser(@Payload RandomChat chat, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        log.info("======================================================/pub/chat/enterUser도착={}",chat);

        // 채팅방 유저+1
        randomChatServiceMain.plusUserCnt(chat.getRoomId());
        String roomId = chat.getRoomId();
        RandomChatRoom room = mapper.select(roomId);

//         채팅방에 유저 추가 및 UserUUID 반환
        String userUUID = msgChatService.addUser(chat.getRoomId(), chat.getSendid());
        log.info("userUUID확인해보기!!!!!!={}",userUUID);
        log.info("headerAccessor알아보기!!!!={}",headerAccessor);


        Map<String, String> userList = room.getUserList();
        room.getUserList().put(userUUID,chat.getSendid());
//
//        // 반환 결과를 socket session 에 userUUID 로 저장
        headerAccessor.getSessionAttributes().put("userUUID", userUUID);
        headerAccessor.getSessionAttributes().put("roomId", chat.getRoomId());
        headerAccessor.getSessionAttributes().put("userName", chat.getSendid());

        chat.setContent1(chat.getSendid() + " 님 입장!!");
        log.info("chat 메세지 확인용!!!!!!!!!!!!!!!");
        log.info(chat.getContent1());
        log.info("/sub/chat/room/"+chat.getRoomId());

        template.convertAndSend("/sub/chat/room/" + chat.getRoomId(), chat);

        log.info((String) headerAccessor.getSessionAttributes().get("userUUID")+"이거다!!!!!!!!!!!!!!!!!!!!");
        log.info("room에 userList 확인하기!!!!!!!={}",room);
        log.info("======================================================/pub/chat/enterUser끝");
    }

    // 해당 유저
    @MessageMapping("/pub/chat/sendMessage")
    public void sendMessage(@Payload RandomChat chat) throws Exception {
        log.info("/pub/chat/sendMessage도착!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        log.info("CHAT {}", chat);
        chat.setContent1(chat.getContent1());
        String roomId = chat.getRoomId();
        RandomChatRoom room = mapper.select(roomId);
        log.info("roomID알아보기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+chat.getRoomId());
        log.info("sendMessage에서 room 에 user확인!={}",room);
        template.convertAndSend("/sub/chat/room/" + chat.getRoomId(), chat);
        log.info("/pub/chat/sendMessage끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }

//    // 유저 퇴장 시에는 EventListener 을 통해서 유저 퇴장을 확인
    @EventListener
    public void webSocketDisconnectListener(SessionDisconnectEvent event) throws Exception {
        log.info("webSocketDisconnectListener도착!!");
        log.info("DisConnEvent {}", event);

        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());

        // stomp 세션에 있던 uuid 와 roomId 를 확인해서 채팅방 유저 리스트와 room 에서 해당 유저를 삭제
        String userUUID = (String) headerAccessor.getSessionAttributes().get("userUUID");
        String roomId = (String) headerAccessor.getSessionAttributes().get("roomId");

        log.info("headAccessor {}", headerAccessor);

        MessageHeaders messageHeaders = headerAccessor.getMessageHeaders();
        log.info("headerAccessor.getMessageHeaders()확인!={}",messageHeaders);

        Object o = messageHeaders.get(2);   //null 나옴
        log.info("messageHeaders.get(2)로추출하기!={}",o);


        Object sessionAttributes = messageHeaders.get(SimpMessageHeaderAccessor.SESSION_ATTRIBUTES);
        log.info("messageHeaders.get(SimpMessageHeaderAccessor.SESSION_ATTRIBUTES)로 추출!={}",sessionAttributes);

        // ObjectMapper 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON 문자열로 변환된 sessionAttributes 값을 추출
        String sessionAttributesJson = objectMapper.writeValueAsString(sessionAttributes);

        // JSON 파싱하여 필요한 값을 추출
        JsonNode jsonNode = objectMapper.readTree(sessionAttributesJson);
        log.info("jsonNode로변경함={}",jsonNode);
        String userName = jsonNode.get("userName").asText();
        log.info("json으로 파싱해봄={}",userName);

        // 채팅방 유저 -1
        randomChatServiceMain.minusUserCnt(roomId);
        log.info("ChatRoomMap.getInstance().getChatRooms()확인={}",ChatRoomMap.getInstance().getChatRooms());

//        // 채팅방 유저 리스트에서 UUID 유저 닉네임 조회 및 리스트에서 유저 삭제

//        String username = msgChatService.findUserNameByRoomIdAndUserUUID(ChatRoomMap.getInstance().getChatRooms(), roomId, userUUID);
//        msgChatService.delUser(ChatRoomMap.getInstance().getChatRooms(), roomId, userUUID);

        if (userUUID != null) {
            log.info("User Disconnected : " + userUUID);
            // builder 어노테이션 활용
            RandomChat chat = RandomChat.builder()
                    .type(RandomChat.MessageType.LEAVE)
                    .sendid(userName)
                    .content1(userName + " 님 퇴장!!")
                    .build();
            template.convertAndSend("/sub/chat/room/" + roomId, chat);
        }
    }

//     채팅에 참여한 유저 리스트 반환
    //RandomChatImplController에서구현
//    @GetMapping("/pub/chat/userlist")
//    @ResponseBody
//    public ArrayList<String> userList(String roomId, SimpMessageHeaderAccessor headerAccessor) throws Exception {
//        log.info("/pub/chat/userlist도착---------------------------------------");
//        log.info("/pub/chat/userlist도착--roomId 확인하기={}",roomId);
//
//        String userUUID = (String) headerAccessor.getSessionAttributes().get("userUUID");
//        log.info("userUUID: " + userUUID);
//
//        // roomId 가져오기
//         roomId = (String) headerAccessor.getSessionAttributes().get("roomId");
//        log.info("roomId: " + roomId);
//
//        RandomChatRoom room = mapper.select(roomId);
//
//        log.info("/pub/chat/userlist여기서 ,room 확인해보쟈!={}",room);
//        log.info("ChatRoomMap.getInstance().getChatRooms()확인하기!={}",ChatRoomMap.getInstance().getChatRooms());
//        return msgChatService.getUserList(ChatRoomMap.getInstance().getChatRooms(), roomId);
//    }

    // 채팅에 참여한 유저 닉네임 중복 확인
    @GetMapping("/pub/chat/duplicateName")
    @ResponseBody
    public String isDuplicateName(@RequestParam("roomId") String roomId, @RequestParam("username") String username) throws Exception {

        // 유저 이름 확인
        String userName = msgChatService.isDuplicateName(ChatRoomMap.getInstance().getChatRooms(),roomId, username);
        log.info("동작확인 {}", userName);

        return userName;
    }

}

