package chiragtailor.tech.customersdetails.models;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Product extends BaseModel{

    private String name;
    private String description;
    private double price;
    private int quantity;

}
