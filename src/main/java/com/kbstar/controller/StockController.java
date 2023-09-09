package com.kbstar.controller;

import com.kbstar.dto.RandomChatRoom;
import com.kbstar.service.randomChat.RandomChatServiceMain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/stock")
@Slf4j
public class StockController {

    String dir ="stock/";



    // 스프링 시큐리티의 로그인 유저 정보는 Security 세션의 PrincipalDetails 안에 담긴다
    // 정확히는 PrincipalDetails 안에 ChatUser 객체가 담기고, 이것을 가져오면 된다.



    @RequestMapping("")
    public String main(Model model, HttpSession session) throws Exception {
        model.addAttribute("center", dir + "overlook");
        return "index";
    }



}