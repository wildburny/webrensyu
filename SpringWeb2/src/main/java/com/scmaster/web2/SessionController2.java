package com.scmaster.web2;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping
public class SessionController2 {

    @RequestMapping(value = "step1",method = RequestMethod.GET)
    public String step1(){
        
        return "";
    }
}
