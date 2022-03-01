package com.codingdojo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.models.User;
import com.codingdojo.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public User insertIntoUsers( User newUser ) {
		return userRepository.save( newUser );
	}
	
	public User selectFromUsersWhereEmail( String email ) {
		List<User> foundUser = userRepository.findByEmail( email );
		if ( foundUser.isEmpty() ) {
			return null;
		}
		else {
			return foundUser.get( 0 );
		}
	}
}
