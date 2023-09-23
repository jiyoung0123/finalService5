package com.kbstar.controller;


import com.kbstar.util.StockPriceAPI;
import com.kbstar.util.StockSearchAPI;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/stock")
@Slf4j
public class StockController {

    @Autowired
    StockPriceAPI stockPriceAPI;
    @Autowired
    StockSearchAPI stockSearchAPI;


    String dir ="stock/";



    @RequestMapping("")
    public String main(Model model, HttpSession session) throws Exception {
        model.addAttribute("center", dir + "overlook");
        return "index";
    }
    @GetMapping("/price")
    @ResponseBody
    public String stockPriceApi(@RequestParam("function") String function, @RequestParam("stockCodes") String stockCodes) throws Exception {
        JSONObject result = new JSONObject();
        result.put("stockPrice", stockPriceAPI.generateCode(function, stockCodes));

        return result.toJSONString();
    }

    @RequestMapping("/codes")
    @ResponseBody
    public ResponseEntity<List<?>> stockSearchApi(@RequestParam("keywords") String keywords) throws Exception {

        JSONArray result = new JSONArray();
        String stockCodes = stockSearchAPI.generateCode(keywords);
        result.add(stockCodes);

        return ResponseEntity.ok(result);
    }


}