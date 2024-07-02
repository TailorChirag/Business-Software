package chiragtailor.tech.customersdetails.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class OrderItems {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int quantity;
    @ManyToOne
    private Product product;
    @ManyToOne
    private Order order;
    private double price;
}
