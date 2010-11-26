package com.lsxyz.baolu.site.web.action;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by IntelliJ IDEA.
 * User: sean
 * Date: 2010-11-25
 * Time: 16:19:57
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String detail(Model model) {
        return "baolu.main.layout";
    }
}









