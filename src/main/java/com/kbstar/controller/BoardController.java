package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class BoardController {
    String dir = "board/";
    @RequestMapping("/boardDetail")
    public String boardDetail(Model model) throws Exception {
        model.addAttribute("center",   dir + "boardDetail");
        return "index";
    }

    @RequestMapping("/boardDetail2")
    public String boardDetail2(Model model) throws Exception {
        model.addAttribute("center", dir+ "boardDetail2");
        return "index";
    }

    //댓글기준
    @RequestMapping("/boardLiked")
    public String boardLiked(Model model) throws Exception {
        model.addAttribute("center", dir +"boardLiked");
        return "index";
    }
    //최신글
    @RequestMapping("/boardNew")
    public String boardNew(Model model) throws Exception {
        model.addAttribute("center",  dir +"boardNew");
        return "index";
    }
}