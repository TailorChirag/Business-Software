package chiragtailor.tech.customersdetails.models;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Order extends BaseModel{
    @ManyToOne
    private Customer customer;
    private String orderNumber;
    private String orderStatus;
}
