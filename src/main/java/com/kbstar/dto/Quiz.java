package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Quiz {
    private String quizId;
    private String quizContent;
    private String one;
    private String two;
    private String three;
    private String answer;
}