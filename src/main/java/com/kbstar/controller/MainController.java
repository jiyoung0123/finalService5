package com.kbstar.controller;

import com.kbstar.dto.BoardList;
import com.kbstar.service.forum.forumService.BoardService;
import com.kbstar.service.randomChat.RandomChatServiceMain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@Slf4j

@Controller
public class MainController {
    @Autowired
    private BoardService boardService; // BoardService 인터페이스를 주입 받음

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        //board 분기처리(최준혁 2023 1125)
        List<BoardList> list = boardService.get(); // boardService 객체를 통해 get() 메서드 호출
        model.addAttribute("boardlist", list);
        model.addAttribute("center", "board");
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

    @RequestMapping("/stock")
    public String main(Model model, HttpSession session) throws Exception {
        model.addAttribute("center",   "stock/overlook");
        return "index";
    }



    @RequestMapping("/boardWrite")
    public String boardWrtie(Model model) throws Exception {
        model.addAttribute("center", "boardWrite");
        return "index";
    }
    @RequestMapping("/boardWriteImpl")
    public String boardWriteImpl(Model model, BoardList boardList) {
        try {
            boardService.register(boardList);
            log.error("boardList : " + boardList);
            model.addAttribute("center", "board");
            return "redirect:/board";
        } catch (Exception e) {
            // Handle exceptions or errors
            model.addAttribute("error", "An error occurred: " + e.getMessage());
            return "error"; // Return the name of the error view
        }
    }

    @RequestMapping("/dailyCheck")
    public String dailyCheck(Model model) throws Exception {
        model.addAttribute("center", "dailyCheck");
        return "index";
    }


}
