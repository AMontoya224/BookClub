package com.codingdojo.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	@SuppressWarnings("unchecked")
	Book save( Book newBook );
	
	List<Book> findAll();
	
	List<Book> findByid( Long id );
	
	@Transactional
	void deleteById( Long id );
}
