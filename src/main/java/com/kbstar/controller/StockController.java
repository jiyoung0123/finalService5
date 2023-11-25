package com.kbstar.controller;


import com.kbstar.util.NewStockPriceAPI;
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
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/stock/v1")
@Slf4j
public class StockController {

    @Autowired
    StockPriceAPI stockPriceAPI;
    @Autowired
    StockSearchAPI stockSearchAPI;

    @Autowired
    NewStockPriceAPI newStockPriceAPI;

    @Autowired
    WebCrawler webCrawler;




    @GetMapping("/price")
    public HashMap<String, Object> stockPriceApi(@RequestParam("stockCodes") String stockCodes) throws Exception {

        return  newStockPriceAPI.generateCode(stockCodes);
    }

    @RequestMapping("/codes")
    @ResponseBody
    public ResponseEntity<List<?>> stockSearchApi(@RequestParam("keywords") String keywords) throws Exception {

        JSONArray result = new JSONArray();
        JSONObject stockCodes = stockSearchAPI.generateCode(keywords);
        result.add(stockCodes);

        return ResponseEntity.ok(result);
    }

    @RequestMapping("/crawl")
    @ResponseBody
    public Object crwalStock() throws Exception {

        JSONArray result = new JSONArray();
        Object crawledResult = webCrawler.generateCode();

        return crawledResult;
    }


}


