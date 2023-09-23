package com.kbstar.dto;


import lombok.Getter;
import lombok.Setter;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
/**
 * @desc Room 을 담기위한 클래스 => 싱글톤
 *
 *
 * */

/**
 * @desc Room 을 담기위한 클래스 => 싱글톤
 * */
// 싱글톤으로 생성
// 모든 ChatService 에서 ChatRooms가 공통된 필요함으로
@Getter
@Setter
public class ChatRoomMap {
    private static ChatRoomMap chatRoomMap = new ChatRoomMap();
    private ConcurrentMap<String, RandomChatRoom> chatRooms = new ConcurrentHashMap<>();
//    public ConcurrentMap<String, RandomChatRoom> getChatRooms() {
//        return chatRooms;
//    }


    public ChatRoomMap(){}

    public static ChatRoomMap getInstance(){
        return chatRoomMap;
    }


}
// 싱글톤으로 생성
// 모든 ChatService 에서 ChatRooms가 공통된 필요함으로
//@Getter
//@Setter
//public class ChatRoomMap {
//    private static ChatRoomMap chatRoomMap = new ChatRoomMap();
//    private ConcurrentMap<String, RandomChatRoom> chatRooms = new ConcurrentHashMap<>();
//
//    private ChatRoomMap(){
//        System.out.println("ChatRoomMap  생성자호출");
//    }
//
//    public static ChatRoomMap getInstance(){
//        return chatRoomMap;
//    }
//    public void addChatRoom(RandomChatRoom room) {
//        chatRooms.put(room.getRoomId(), room);
//    }
//
//    public void removeChatRoom(String roomId) {
//        chatRooms.remove(roomId);
//    }
//
//    public RandomChatRoom getChatRoom(String roomId) {
//        return chatRooms.get(roomId);
//    }
//
//    public List<RandomChatRoom> getAllChatRooms() {
//        List<RandomChatRoom> roomList = new ArrayList<>(chatRooms.values());
//        Collections.reverse(roomList);
//        return roomList;
//    }
//}