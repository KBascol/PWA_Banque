package com.parttwo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import lombok.Data;

/**
 * Products' entity
 */

@Entity
@Data
public class Product implements Serializable {
    @Id
    private String name;
        
    private String category;
    
    @OneToMany
    private List<Subscription> subs;
}
