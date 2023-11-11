package com.kbstar.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static java.net.http.HttpResponse.*;
import static java.net.http.HttpResponse.BodyHandlers.*;

@Slf4j
@Component("StockPriceAPI")
public class StockPriceAPI {
    private static final String function = "TIME_SERIES_DAILY";
    private static final String authkey = "L646A87J103HCPR7";
    private static final String BASE_URL = "https://www.alphavantage.co/query";
    private final HttpClient client;

    public StockPriceAPI() {
        client = HttpClient.newBuilder().build();
    }
    //https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=AUTHKEY1234567890&searchdate=20180102&data=AP01
    public HashMap<String, Object> generateCode(String symbol) throws Exception {

        HashMap<String, Object> payload = new HashMap<>();
        JsonObject requestBody = new JsonObject();
        // Gson을 사용하여 JSON 요청 본문을 문자열로 변환
        Gson gson = new Gson();
        String requestBodyString = gson.toJson(requestBody);

        JSONObject obj;
        obj = null;
//        https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=demo
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(BASE_URL + "?function=" + function + "&symbol=" + symbol + "&apikey="+authkey))
                    .header("Accept", "application/json") // JSON 응답을 요청함
                    .GET()
                    .build();
            //응답
            HttpResponse<?> response = client.send(request, ofByteArray());

            if (response.statusCode() == 200) {
                byte[] responseBodyBytes = (byte[]) response.body();
                String responseBody = new String(gson.toJson(response.body()).getBytes(), StandardCharsets.UTF_8);


                log.info("=====================response 객체=========");
                log.info(response.toString());
                log.info(responseBody.toString());
                log.info(response.body().toString());
                log.info("=====================response 객체=========");
                payload.put("result",responseBody);


            } else {
                log.debug("API request failed. Response code: " + response.statusCode());
                log.info("=====================response 객체2=========");
                log.info(response.toString());
                log.info(response.body().toString());
                log.info("=====================response 객체2=========");
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return payload;
    }

    // HTML 공백 문자 제거
    private static String cleanHtmlWhitespace(String input) {
        return input.replaceAll("\\s+", "");
    }
}
