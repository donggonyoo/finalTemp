package dong.finnaltemp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("faqList")
    public String faqList(){
        return "board/faqList";
    }

    @GetMapping("noticeDetail")
    public String noticeDetail(){
        return "board/noticeDetail";
    }
    @GetMapping("noticeList")
    public String noticeList(){
        return "board/noticeList";
    }
    @GetMapping("noticeWrite")
    public String noticeWrite(){
        return "board/noticeWrite";
    }

    @GetMapping("questionDetail")
    public String questionDetail(){
        return "board/questionDetail";
    }
    @GetMapping("questionList")
    public String questionList(){
        return "board/questionList";
    }
    @GetMapping("questionWrite")
    public String questionWrite(){
        return "board/questionWrite";
    }
}
