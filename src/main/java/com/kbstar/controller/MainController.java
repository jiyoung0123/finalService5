package com.kbstar.controller;

import com.kbstar.dto.BoardList;
import com.kbstar.service.forum.forumService.BoardService;
import com.kbstar.service.randomChat.RandomChatServiceMain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Slf4j

@Controller
public class MainController {
    @Autowired
    private BoardService boardService; // BoardService 인터페이스를 주입 받음

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
    @RequestMapping("/board")
    public String forum(Model model) throws Exception {

        List<BoardList> list = boardService.get(); // boardService 객체를 통해 get() 메서드 호출
        model.addAttribute("boardlist", list);
        model.addAttribute("center", "board");
        return "index";
    }
}
