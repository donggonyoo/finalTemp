package dong.finnaltemp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/draft")
public class DraftController {

    @GetMapping("draftDetail")
    public String draftDetail() {
        return "draft/draftDetail";
    }

    @GetMapping("draftForm")
    public String draftForm() {
        return "draft/draftForm";
    }
    //하하
    @GetMapping("draftList")
    public String draftList() {
        return "draft/draftList";
    }

    @GetMapping("draftManagement")
    public String draftManagement() {
        return "draft/draftManagement";
    }
    @GetMapping("receviedDraftList")
    public String receviedDraftList() {
        return "draft/receviedDraftList";
    }


}
