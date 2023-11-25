package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/myprofile")
public class MyProfileController {

    String dir ="myprofile/";

    // [정인보] 나의고객 전체조회 페이지 이동
    @RequestMapping("")
    public String myprofile(Model model){
        model.addAttribute("center" ,dir + "center");
        return "index";
    }
    // [정인보] 고객 대시보드 조회 페이지 이동
    @RequestMapping("/detail")
    public String detail(Model model){
        model.addAttribute("center" ,dir + "detail");
        return "index";
    }

}