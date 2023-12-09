package com.kbstar.controller;

import com.kbstar.dto.CollyFarm;
import com.kbstar.dto.Quiz;
import com.kbstar.service.CollyService;
import com.kbstar.service.QuizService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@Slf4j
public class CollyFarmController {

    String dir ="collyFarm/";

    @Autowired
    CollyService collyService;
    @Autowired
    QuizService quizService;

    @GetMapping("/collyFarm")
    public String collyFarm(Model model, @RequestParam("userId") String userId) throws Exception {
        CollyFarm colly = null;
        colly = collyService.get(userId);
        log.info("=================");
        if(colly == null){
            return "redirect:/collyInsert";
        }

        int a = colly.getCollyLevel();
        if (a>3){
            log.info("축하합니다!!!!!!!!!!!!!!!!!!!!!!!");
            model.addAttribute("center","collySuccess");
        }
        if (a<=3){
            model.addAttribute("rcolly", colly);
            model.addAttribute("center", "collyMain");
        }
        log.info("퀴즈풀어보세요~~~~~~~~~~~~~~~~~~~~~~~~~~");

        Quiz quiz1 = null;
        quiz1 = quizService.get("1");

        Quiz quiz2 = null;
        quiz2 = quizService.get("2");

        model.addAttribute("quiz1", quiz1);
        model.addAttribute("quiz2", quiz2);
        return "index";
    }

    @GetMapping("/collyInsert")
    public String collyInsert(Model model, HttpSession session) throws Exception {
   /*     if(session.getAttribute("loginGuest")==null){
            return "redirect:/login";
        }
        model.addAttribute("user","loginGuest");*/
        model.addAttribute("center","collyStart");
        return "index";
    }

    @GetMapping("/collyStart")
    public String collyStart(Model model, HttpSession session) throws Exception {
   /*     if(session.getAttribute("loginGuest")==null){
            return "redirect:/login";
        }
        model.addAttribute("user","loginGuest");*/
        model.addAttribute("center","collyStart");
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
        String userId = colly.getUserId();
        model.addAttribute("center", "collyMain");
        return "redirect:/collyFarm?userId=userId";
    }

    @RequestMapping("/collyWater")
    public String collyWater(Model model, String userId) throws Exception {
        CollyFarm colly = null;
        colly = collyService.get(userId);
        collyService.modify(colly);
        log.info(String.valueOf(colly));
        CollyFarm ncolly = collyService.get(userId);
        int a = colly.getCollyLevel();
        if (a>3){
            log.info("축하합니다!!!!!!!!!!!!!!!!!!!!!!!");
            return "redirect:/feed";
        }
        if (a<=3){
            model.addAttribute("rcolly", ncolly);
            model.addAttribute("center", "collyMain");
        }
        return "index";
    }

    @RequestMapping("/collyQuiz")
    public String collyQuiz(Model model, String quizId, String answer) throws Exception {
        Quiz quiz = null;
        quiz = quizService.get(quizId);
        log.info(String.valueOf(quiz));
        log.info("##########################");
        log.info(quiz.getAnswer());
        log.info("사용자정답"+answer);
        model.addAttribute("center", "collyMain");
        return "index";
    }
}
