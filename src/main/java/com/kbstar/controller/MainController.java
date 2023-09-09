package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Slf4j

@Controller
public class MainController {


    @RequestMapping("/")
    public String main(Model model){
        return "index";
    }


    @RequestMapping("/feed")
    public String feed(Model model){
        model.addAttribute("center","feed");
        return "index";
    }

    @RequestMapping("/groups")
    public String groups(Model model){
        model.addAttribute("center","groups");
        return "index";
    }

    @RequestMapping("/pages")
    public String pages(Model model){
        model.addAttribute("center","pages");
        return "index";
    }

}
