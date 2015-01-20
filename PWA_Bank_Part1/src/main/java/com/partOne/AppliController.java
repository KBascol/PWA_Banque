/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.partOne;

import com.partOne.TransactionDao.TransactionDao;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Kevin
 */
/*
@Controller
public class AppliController {
    @Autowired
    TransactionDao transRepo;
    
    @RequestMapping("/Liste")
    public String DisplayListTrans(Map<String, Object> model) {
        model.put("transactions", transRepo.findAll());
        return "listTrans";
    }
}
*/