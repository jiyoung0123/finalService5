package com.kbstar;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Slf4j
@SpringBootTest
class Web15ApplicationTests {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads() {
        String rawPassword = "pwd01";
        String encPassword = encoder.encode(rawPassword);
        log.info("-----------------------------------------------------------------------------------");
        log.info(rawPassword);
        log.info("암호화 된 비번" + encPassword);
        //matches란 함수로 rawPassword 와 encPassword(암호화된비번) 를 비교. 두개가 같으면 true가 return됨
        boolean result = encoder.matches(rawPassword,encPassword);
        log.info(result+"");
        log.info("-----------------------------------------------------------------------------------");
    }



}