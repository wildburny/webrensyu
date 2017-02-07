package com.scmaster.web2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({"data1", "data2"})
public class SessionController2 {

    @RequestMapping(value = "step1", method = RequestMethod.GET)
    public String step1() {
        return "step";
    }

    @RequestMapping(value = "step2", method = RequestMethod.GET)
    public String step2(Model model) {
        model.addAttribute("data1", "step2에서 모델에 저장한 값");
        return "step";
    }

    @RequestMapping(value = "step3", method = RequestMethod.GET)
    public String step3(@ModelAttribute("data1") String data1, Model model) {
        model.addAttribute("data2", "step3에서 모델에 저장한 값");
        return "step";
    }

    @RequestMapping(value = "end", method = RequestMethod.GET)
    public String end(@ModelAttribute("data1") String data1, @ModelAttribute("data2") String data2, SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "end";
    }

}
