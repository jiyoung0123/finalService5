package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @desc 는 문자 채팅 방을 위한 dto 클래
 * */
// Stomp 를 통해 pub/sub 를 사용하면 구독자 관리가 알아서 된다!!
// 따라서 따로 세션 관리를 하는 코드를 작성할 필도 없고,
// 메시지를 다른 세션의 클라이언트에게 발송하는 것도 구현 필요가 없다!

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RandomChatRoom {
    private String createUserId;
    private String roomId; // 채팅방 아이디
    private String roomName; // 채팅방 이름
    private String roomLoc; // 채팅방 지역
    private Date createDate; //채팅방 개설일
    private long userCount; // 채팅방 인원수
    private int maxUserCnt; // 채팅방 최대 인원 제한

    private String roomPwd; // 채팅방 삭제시 필요한 pwd
    private boolean secretChk; // 채팅방 잠금 여부

    public enum ChatType{  // 화상 채팅, 문자 채팅
        MSG, RTC
    }
    private ChatType chatType; //  채팅 타입 여부

    private Map<String, String> userList = new HashMap<>();  //userList

}