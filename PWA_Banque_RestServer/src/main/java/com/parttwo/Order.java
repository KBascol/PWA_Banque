/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 * Orders' entity.
 */
@Entity
@Data
@Table(name="ProdOrder")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer orderNum;
    
    private String firstName;
    private String lastName;
    private String email;
    private String iban;
    
    private String sub;
    private String prod;

    /**
     * Method to set a confirmation mail.
     * @return mail (String)
     */
    public String mail() {
        return "Cher(e) " + firstName + " " + lastName +".\n"
                + "Votre souscription à l'abonnement " + sub + " de " + prod + " est confirmée.\n"
                + "Votre numero de commande est " + orderNum + ", Le prélevement s'effectuera sur " + iban +".\n"
                + "Lien vers le resumé http://localhost:8383/PWA_Banque_RestClient/order.html?id=" + orderNum + " .\n\n"
                + "KNK Multimedia.";
    }
}
