package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyCust {
	private Long custId; // 고객아이디
	private String custName; // 고객명
	private String custBirth; // 생년월일
	private String custAge; // 나이
	private String category; // 상품 카테고리
	private Long contractDate; // 가입일자
	private Long contractAmount; // 가입금액
	private Long term; // 가입기간(개월)
	private Long terminationDate; // 해지일자
	private Long terminationAmount; // 해지금액
	private Long rate; // 수익률
	private String custMemo; // 메모
	
	
}
