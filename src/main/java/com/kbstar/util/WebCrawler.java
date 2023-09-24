package com.kbstar.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component("WebCrawler")
public class WebCrawler {
    private String url;

    public WebCrawler() {
        this.url = "https://finance.yahoo.com/";
    }

    public Object generateCode() {
        try {
            // 웹 페이지를 가져옵니다.
            Document doc = Jsoup.connect(url).get();
            // 원하는 데이터를 추출합니다.

            String snp500 = doc.select("#marketsummary-itm-0 > h3 > fin-streamer").text();
            String dow30Price = doc.select("#marketsummary-itm-1 > h3 > fin-streamer").text();
            String nasdaq = doc.select("#marketsummary-itm-2 > h3 > fin-streamer").text();
            String russell2000 = doc.select("#marketsummary-itm-3 > h3 > fin-streamer").text();

           // Elements snp500diff = doc.select("<span class=\"C($negativeColor)\">(-0.23%)</span>");
//            String dow30Pricediff = doc.select("#marketsummary-itm-1 > h3 > div > fin-streamer:nth-child(2) > span").text();
//            String nasdaqdiff = doc.select("#marketsummary-itm-2 > h3 > div > fin-streamer:nth-child(2) > span").text();
//            String rusell2000diff = doc.select("#marketsummary-itm-3 > h3 > div > fin-streamer:nth-child(2) > span").text();

            //String snp500diffNumber = snp500diff.text();

            log.info("=========snp500==================");
            //log.info(snp500diffNumber);
            log.info("================================");




            // 데이터를 JSON 형식으로 변환하여 반환합니다.
            JSONObject price = new JSONObject();
            price.put("snp500", snp500);
            price.put("dow30Price", dow30Price);
            price.put("nasdaq", nasdaq);
            price.put("russell2000", russell2000);

            JSONObject diffPrice = new JSONObject();
            //diffPrice.put("snp500diff", snp500diff);
//            diffPrice.put("dow30Pricediff", dow30Pricediff);
//            diffPrice.put("nasdaqdiff", nasdaqdiff);
//            diffPrice.put("rusell2000diff", rusell2000diff);

            JSONArray result = new JSONArray();
            result.add(price);
            result.add(diffPrice);


            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
