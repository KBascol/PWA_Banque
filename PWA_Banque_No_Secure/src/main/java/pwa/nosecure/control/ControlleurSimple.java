/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pwa.nosecure.control;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pwa.nosecure.service.TransactionRepository;

@Controller
public class ControlleurSimple {

    @Autowired
    TransactionRepository transRepo;

    @RequestMapping("/Liste")
    public String DisplayListTrans() {
        ModelAndView model = new ModelAndView();
        model.addObject("transactions", transRepo.findAll());
        return "listTrans";
    }

}
