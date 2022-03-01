package com.codingdojo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	@SuppressWarnings("unchecked")
	User save( User newUser );
	
	List<User> findByEmail( String email );
}
