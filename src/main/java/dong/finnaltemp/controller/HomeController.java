package dong.finnaltemp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {

    @GetMapping("/")
    public String home(){
        return "main";
    }
    @GetMapping("/calendar")
    public String calendar(){
        return "calendar";
    }
    @GetMapping("/profile")
    public String profile(){
        return "profile";
    }
    @GetMapping("/homeIndex")
    public String homeIndex ()
    {
        return "homeIndex";
    }
}
