package com.kbstar.controller;


import com.kbstar.util.StockPriceAPI;
import com.kbstar.util.StockSearchAPI;
import com.kbstar.util.WebCrawler;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/balance")
@Slf4j
public class BalanceController {

    String dir ="balance/";

    @RequestMapping("")
    public String main(Model model, HttpSession session) throws Exception {
        model.addAttribute("center", dir + "center");
        return "index";
    }



}
