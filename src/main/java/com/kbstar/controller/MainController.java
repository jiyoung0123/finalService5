package com.kbstar.controller;

import com.kbstar.service.randomChat.RandomChatServiceMain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


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

    @Autowired
    private RandomChatServiceMain chatServiceMain;

    @RequestMapping("/groups")
    public String groups(Model model) throws Exception {
            model.addAttribute("user","loginGuest");
            model.addAttribute("list", chatServiceMain.findAllRoom());

            log.info("----------------------------------------------------------");
            log.info(String.valueOf(chatServiceMain.findAllRoom()));
            log.debug("SHOW ALL ChatList {}", chatServiceMain.findAllRoom());
            model.addAttribute("center","groups");
            return "index";
    }

    @RequestMapping("/pages")
    public String pages(Model model){
        model.addAttribute("center","pages");
        return "index";
    }

}
