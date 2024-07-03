package chiragtailor.tech.customersdetails.services;

import chiragtailor.tech.customersdetails.exceptions.CustomerEmailNotFoundException;
import chiragtailor.tech.customersdetails.exceptions.CustomerNotFoundException;
import chiragtailor.tech.customersdetails.models.Customer;
import chiragtailor.tech.customersdetails.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class service implements CustomerService{

    private CustomerRepository customerRepository;

    @Autowired
    public service(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }


    @Override
    public Customer addNewCustomer(Customer customer) {
        Optional<Customer> optionalCustomer = customerRepository.findByEmail(customer.getEmail());

        if(!optionalCustomer.isEmpty()){
            return optionalCustomer.get();
        }
        return customerRepository.save(customer);
    }

    @Override
    public Customer findCustomerById(Long id) throws CustomerNotFoundException {
        Optional<Customer> customer = customerRepository.findById(id);

        if(customer.isEmpty()){
            throw new CustomerNotFoundException("Customer with id " + id + " not found");
        }

        return customer.get();
    }

    @Override
    public Customer updateCustomer(Long id, Customer customer) throws CustomerNotFoundException {
        Optional<Customer> customer1 = customerRepository.findById(id);

        if (customer1.isEmpty()){
         throw new CustomerNotFoundException("Customer with id " + id + " not found");
        }

        if(customer.getEmail() != null){
            customer1.get().setEmail(customer.getEmail());
        }

        if (customer.getPhone() != null){
            customer1.get().setPhone(customer.getPhone());
        }

        if (customer.getName() != null){
            customer1.get().setName(customer.getName());
        }

        if (customer.getAddress() != null){
            customer1.get().setAddress(customer.getAddress());
        }
        return customerRepository.save(customer1.get());


    }

    @Override
    public void deleteCustomer(Long id) {

    }

    @Override
    public Customer findCustomerByEmail(String email) throws CustomerEmailNotFoundException {
        Optional<Customer> customer = customerRepository.findByEmail(email);

        if (customer.isEmpty()){
            throw new CustomerEmailNotFoundException("Customer with email " + email + " not found");
        }
        return customer.get();
    }

    @Override
    public Customer findCustomerByPhone(String phone) {
        return null;
    }
}
