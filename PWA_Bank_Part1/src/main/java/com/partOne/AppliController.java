package com.partOne;

import com.partOne.resources.TransactionRepository;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Kevin
 */

@Controller
public class AppliController {
    @Autowired
    TransactionRepository transRepo;
    
    @RequestMapping("/Liste")
    public String DisplayListTrans(Map<String, Object> model) {
        model.put("transactions", transRepo.findAll());
        return "listTrans";
    }
}
