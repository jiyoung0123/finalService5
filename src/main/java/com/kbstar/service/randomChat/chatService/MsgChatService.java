package com.kbstar.service.randomChat.chatService;

import com.kbstar.dto.RandomChatRoom;
import com.kbstar.mapper.RandomChatMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;


@Slf4j
@RequiredArgsConstructor
@Service
public class MsgChatService {

    @Autowired
    RandomChatMapper mapper;


    // 채팅방 삭제에 따른 채팅방의 사진 삭제를 위한 fileService 선언
//    private final FileService fileService;

    public RandomChatRoom createChatRoom(String createUserId, String roomName, String roomPwd, boolean secretChk, int maxUserCnt,String roomLoc) {
        // roomName 와 roomPwd 로 chatRoom 빌드 후 return
        RandomChatRoom room = RandomChatRoom.builder()
                .createUserId(createUserId)
                .roomId(UUID.randomUUID().toString())
                .roomName(roomName)
                .roomLoc(roomLoc)
                .roomPwd(roomPwd) // 채팅방 패스워드
                .secretChk(secretChk) // 채팅방 잠금 여부
                .userCount(0) // 채팅방 참여 인원수
                .maxUserCnt(maxUserCnt) // 최대 인원수 제한
                .build();

//                        .chatType(chatType)

           room.setUserList(new ConcurrentHashMap<String, String>());
           log.info("==============================setUserList출력");
           log.info(String.valueOf(room.getUserList()));

//        // map 에 채팅룸 아이디와 만들어진 채팅룸을 저장
        return room;
    }


    // 채팅방 유저 리스트에 유저 추가
    public String addUser(String roomId, String userName) throws Exception {
        log.info("-------------------------------------------addUser도착=[{}, {}]",roomId,userName);

        String userUUID = UUID.randomUUID().toString();
        RandomChatRoom room = mapper.select(roomId);

        Map<String, String> userList = room.getUserList();
        room.getUserList().put(userUUID,userName);
        log.info("room에 userList 넣어본거!={}",room);
        log.info(userUUID);
        return userUUID;
    }

    // 채팅방 유저 이름 중복 확인
    public String isDuplicateName(Map<String, RandomChatRoom> chatRoomMap, String roomId, String username) throws Exception {
        RandomChatRoom room = mapper.select(roomId);
        String tmp = username;

        // 만약 userName 이 중복이라면 랜덤한 숫자를 붙임
        // 이때 랜덤한 숫자를 붙였을 때 getUserlist 안에 있는 닉네임이라면 다시 랜덤한 숫자 붙이기!
        while(room.getUserList().containsValue(tmp)){
            int ranNum = (int) (Math.random()*100)+1;
            tmp = username+ranNum;
        }
        return tmp;
    }

//     채팅방 userName 조회
    public String findUserNameByRoomIdAndUserUUID(Map<String, RandomChatRoom> chatRoomMap, String roomId, String userUUID){
        RandomChatRoom room = chatRoomMap.get(roomId);
        return (String) room.getUserList().get(userUUID);
    }

    // 채팅방 전체 userlist 조회
    public ArrayList<String> getUserList(Map<String, RandomChatRoom> chatRoomMap, String roomId) throws Exception {
        log.info("getUserList도착!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        ArrayList<String> list = new ArrayList<>();
        RandomChatRoom room = mapper.select(roomId);

//        RandomChatRoom room = chatRoomMap.get(roomId);
        log.info("room받아오기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        log.info("room 받아온거임={}", room);

        // hashmap 을 for 문을 돌린 후
        // value 값만 뽑아내서 list 에 저장 후 reutrn
        room.getUserList().forEach((key, value) -> list.add((String) value));
        return list;
    }

    // 채팅방 특정 유저 삭제
   public void delUser(Map<String, RandomChatRoom> chatRoomMap, String roomId, String userUUID){
       RandomChatRoom room = chatRoomMap.get(roomId);
       room.getUserList().remove(userUUID);
   }
}
