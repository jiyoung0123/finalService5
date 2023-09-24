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
public class CollyFarm {
    private String userId;
    private String userName;
    private String collyNickname;
    private int collyLevel;
    private double levelPercent;
    private String collyImg;
    private String groupName;
    private String branchName;
    private Double water;
    private int userLevel;
    private String yearOfEmp;
    private String collyAcc1;
    private String collyAcc2;
    private String typeOfCrops;

}