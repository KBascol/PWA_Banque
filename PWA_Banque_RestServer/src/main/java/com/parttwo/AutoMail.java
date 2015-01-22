/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Kevin
 */

public class AutoMail {
    String user;
    String pass;

    public AutoMail(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public void sendOrder(Order ord){      
        Email email = new SimpleEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator(user, pass));
        email.setSSL(true);
        try {
            email.setFrom(user + "@gmail.com");
            email.setSubject("Confirmation commande");
            email.setMsg(ord.mail());
            email.addTo(ord.getEmail());
            email.send();
        } catch (EmailException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
}
