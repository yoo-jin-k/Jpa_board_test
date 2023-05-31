package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

//@RequestMapping("/main/test")
public class TestController {

    @RequestMapping("/main/test")
    public String ex1(){

        return "test";
    }
}
