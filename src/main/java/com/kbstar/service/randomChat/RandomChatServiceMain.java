package com.kbstar.service.randomChat;

import com.kbstar.dto.RandomChatRoom;
import com.kbstar.mapper.RandomChatMapper;
import com.kbstar.service.randomChat.chatService.MsgChatService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
@Getter
@Setter
@RequiredArgsConstructor
@Slf4j
public class RandomChatServiceMain {

    @Autowired
    RandomChatMapper mapper;



    private final MsgChatService msgChatService;
//    private final RtcChatService rtcChatService;

    // 채팅방 삭제에 따른 채팅방의 사진 삭제를 위한 fileService 선언
//    private final FileService fileService;

    public void register(RandomChatRoom randomChatRoom) throws Exception {
        mapper.insert(randomChatRoom);

    }

    public void modify(RandomChatRoom randomChatRoom) throws Exception {
        mapper.update(randomChatRoom);

    }


    // 전체 채팅방 조회
    public List<RandomChatRoom> findAllRoom() throws Exception {
        // 채팅방 생성 순서를 최근순으로 반환
//        List<RandomChatRoom> chatRooms = new ArrayList<>(ChatRoomMap.getInstance().getChatRooms().values());
//        Collections.reverse(chatRooms);
        return mapper.selectall();

    }



    // roomID 기준으로 채팅방 찾기
    public RandomChatRoom findRoomById(String roomId) throws Exception {
       return mapper.select(roomId);
//        return ChatRoomMap.getInstance().getChatRooms().get(roomId);
    }

    // roomName 로 채팅방 만들기
    public RandomChatRoom createChatRoom(String createuserID, String roomName, String roomPwd, boolean secretChk, int maxUserCnt, String roomLoc){

        RandomChatRoom room;
        room = msgChatService.createChatRoom(createuserID, roomName, roomPwd, secretChk, maxUserCnt, roomLoc);

        // 채팅방 타입에 따라서 사용되는 Service 구분
//        if(chatType.equals("msgChat")){
//            room = msgChatService.createChatRoom(roomName, roomPwd, secretChk, maxUserCnt);
//        }else{
//            room = rtcChatService.createChatRoom(roomName, roomPwd, secretChk, maxUserCnt);
//        }
        return room;
    }

    // 채팅방 비밀번호 조회
    public boolean confirmPwd(String roomId, String roomPwd) throws Exception {
        String pwd = mapper.select(roomId).getRoomPwd();
//        String pwd = chatRoomMap.get(roomId).getRoomPwd();
        return roomPwd.equals(pwd);

    }

    // 채팅방 인원+1
    public void plusUserCnt(String roomId) throws Exception {
        log.info("------------------------------plusUserCnt도착");
        log.info(roomId);
//        log.info("cnt {}",ChatRoomMap.getInstance().getChatRooms().get(roomId).getUserCount());
        RandomChatRoom room = mapper.select(roomId);
        log.info(String.valueOf(room));
//        RandomChatRoom room = ChatRoomMap.getInstance().getChatRooms().get(roomId);
        long cnt =room.getUserCount();
        log.info("userCnt 가져오기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        log.info(String.valueOf(cnt));
        long cnt2 =cnt+1;
        log.info(String.valueOf(cnt2));
        log.info("------------------------------plusUserCnt끝");
        room.setUserCount(cnt2);
        log.info("plusUserCnt확인하기!!!={}", room);
        mapper.update(room);

    }

    // 채팅방 인원-1
    public void minusUserCnt(String roomId) throws Exception {
        RandomChatRoom room = mapper.select(roomId);
        room.setUserCount(room.getUserCount()-1);
        mapper.update(room);
        log.info(String.valueOf(room));
    }

    // maxUserCnt 에 따른 채팅방 입장 여부
    public boolean chkRoomUserCnt(String roomId) throws Exception {
        RandomChatRoom room = mapper.select(roomId);
        if (room.getUserCount() + 1 > room.getMaxUserCnt()) {
            return false;
        }
        return true;
    }

    // 채팅방 삭제
    public void delChatRoom(String roomId) throws Exception {
        mapper.delete(roomId);
    }
}