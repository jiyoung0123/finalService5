package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
    private String replyId; //답글아이디
    private String replyUser; //답글작성자명
    private String boardID; //게시판아이디
    private String replyPassword; //답글비밀번호
    private String replyDate;//작성일자
}
