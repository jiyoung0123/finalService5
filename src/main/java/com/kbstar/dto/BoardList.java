package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardList {
    private Integer boardID; //게시판아이디
    private String boardWriterId;//작성자아이디
    private String boardPw;//게시판비밀번호
    private String boardTitle;//게시판제목
    private String boardCategory;//상품카테고리
    private String boardContents;//내용
    private String hashtag;//해시태그(검색용)
    private String boardImg;//게시판이미지
    private String boardImgName;//게시판이미지명
    private String boardImagePath;//게시판이미지경로
    private int boardLikes;//추천수
    private int boardHates;//비추천수
    private String boardDate;//작성일자
}
