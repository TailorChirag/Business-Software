package chiragtailor.tech.customersdetails.models;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Customer extends BaseModel{

    private String name;
    private String email;
    private String phone;
    private String address;
    private String city;
    private String state;
    private String country;


}
