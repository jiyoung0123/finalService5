package com.kbstar.util;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import okhttp3.*;

import java.net.http.HttpClient;

import java.util.HashMap;

import static java.net.http.HttpResponse.BodyHandlers.*;

@Slf4j
@Component("NewStockPriceAPI")
public class NewStockPriceAPI {
    private static final String function = "TIME_SERIES_DAILY";
    private static final String authkey = "L646A87J103HCPR7";
    private static final String BASE_URL = "https://www.alphavantage.co/query";

    OkHttpClient client = new OkHttpClient();

    public HashMap<String, Object> generateCode(String symbol) throws Exception {
        String url = null;
        url = BASE_URL + "?function=" + function + "&symbol=" + symbol + "&apikey=" + authkey;
        HashMap<String, Object> payload = new HashMap<String, Object>();
        Request request = new Request
                .Builder()
                .url(url)
                .addHeader("Accept", "application/json")
                .build();

        try (Response response = client.newCall(request).execute()) {
            if(response.isSuccessful()){
                String responseBody = response.body().string();

                payload.put("result", responseBody);

            }

        }catch(Exception e){
            log.error(e.toString());
            payload.put("result", "error");
        }


        return payload;

    }
}
