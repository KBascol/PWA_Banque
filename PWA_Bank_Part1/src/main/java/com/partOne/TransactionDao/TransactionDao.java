/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.partOne.TransactionDao;

import com.partOne.resources.Transaction;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
/**
 *
 * @author nciolas
 */

@Service
public interface TransactionDao extends PagingAndSortingRepository<Transaction, Long>{

}
