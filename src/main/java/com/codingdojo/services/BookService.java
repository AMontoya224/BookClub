package com.codingdojo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.models.Book;
import com.codingdojo.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepository;
	
	public Book insertIntoBooks( Book newBook ) {
		return bookRepository.save( newBook );
	}
	
	public List<Book> selectAllFromBooks(){
		List<Book> booksList = bookRepository.findAll();
		if ( booksList.isEmpty() ) {
			Book bookEmpty = new Book( "N/A", "N/A", "N/A", null, null, null );
			booksList.add(bookEmpty);
		}
		return booksList;
	}
	
	public Book selectFromBooksWhereId( Long id ) {
		List<Book> foundBook = bookRepository.findByid( id );
		if ( foundBook.isEmpty() ) {
			return null;
		}
		else {
			return foundBook.get( 0 );
		}
	}
	
	public void updateBooks( Book newBook ) {
		bookRepository.save(newBook);
	}
	
	public void deleteFromBooks( Long id ) {
		bookRepository.deleteById( id );
	}
}
