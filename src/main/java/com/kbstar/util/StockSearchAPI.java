package com.kbstar.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
@Component("StockSearchAPI")
public class StockSearchAPI {
    private static final String function = "SYMBOL_SEARCH";
    private static final String authkey = "L646A87J103HCPR7";
    private static final String BASE_URL = "https://www.alphavantage.co/query";
    private final HttpClient client;

    public StockSearchAPI() {
        client = HttpClient.newBuilder().build();
    }
    //https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=AUTHKEY1234567890&searchdate=20180102&data=AP01
    public JSONObject generateCode(String keywords) throws Exception {
        JSONObject code = new JSONObject();

        // JSON 형식의 요청 본문 생성
        JsonObject requestBody = new JsonObject();

        // Gson을 사용하여 JSON 요청 본문을 문자열로 변환
        Gson gson = new Gson();
        String requestBodyString = gson.toJson(requestBody);

        JSONObject obj;
        obj = null;
//        https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=demo
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(BASE_URL + "?function=" + function + "&keywords=" + keywords + "&apikey="+authkey))
                    .GET()
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() == 200) {
                code.put("result", response.body());

            } else {
                System.out.println("API request failed. Response code: " + response.statusCode());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return code;
    }
}
