/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.partOne.resources;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author bascool
 */

@Service
public interface TransactionRepository extends PagingAndSortingRepository<Transaction, Long> {
    
}
