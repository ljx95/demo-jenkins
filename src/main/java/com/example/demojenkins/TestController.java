package com.example.demojenkins;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 功能描述
 * </p>
 *
 * @author LinJianXiong
 * @date 2019/8/4 20:06
 */
@RestController
public class TestController {

    @RequestMapping("/test")
    public String aa(){
        return "i am demo-jenkins";
    }
}
