package com.kbstar.controller;

import com.kbstar.dto.CollyFarm;
import com.kbstar.service.CollyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@Slf4j
public class CollyFarmController {

    String dir ="collyFarm/";

    @Autowired
    CollyService collyService;

    @GetMapping("/collyFarm")
    public String collyFarm(Model model, HttpSession session) throws Exception {
        if(session.getAttribute("loginGuest")==null){
            return "redirect:/collyInsert";
        }
        /*model.addAttribute("rcolly", colly);*/
        model.addAttribute("center", "collyMain");
        return "index";
    }

    @GetMapping("/collyInsert")
    public String collyInsert(Model model, HttpSession session) throws Exception {
   /*     if(session.getAttribute("loginGuest")==null){
            return "redirect:/login";
        }
        model.addAttribute("user","loginGuest");*/
        model.addAttribute("center","collyInsert");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, CollyFarm colly, HttpSession session) throws Exception {
        log.info("콜리정보!!!!!!!!!!!!!!!!!!!!!!!!");
        log.info(String.valueOf(colly));
        try {
            collyService.register(colly);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }
        model.addAttribute("rcolly", colly);
        model.addAttribute("center", "collyMain");
        return "index";
    }


}
