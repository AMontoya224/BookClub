package com.codingdojo.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.models.Book;
import com.codingdojo.models.User;
import com.codingdojo.services.BookService;
import com.codingdojo.services.UserService;

@Controller
@RequestMapping( "/books" )
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
	public Date date = new Date();
	
	@GetMapping( "/b" )
	public String books( Model model, HttpSession session ) {
		if( session.getAttribute("email") != null ) {
			List<Book> booksList = bookService.selectAllFromBooks();
			model.addAttribute( "name", session.getAttribute("name") );
			model.addAttribute( "booksList", booksList );
			return "books.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@GetMapping( "/new" )
	public String add( Model model, HttpSession session ) {
		if( session.getAttribute("email") != null ) {
			model.addAttribute("newBook", new Book());
            return "add.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PostMapping( "/new" )
	public String add_P( @Valid @ModelAttribute("newBook") Book newBook, 
			 			 BindingResult result, Model model, HttpSession session,
			 			 RedirectAttributes flash ) {
		if( result.hasErrors() ) {
			return "add.jsp";
		}
		User foundUser = userService.selectFromUsersWhereEmail( session.getAttribute("email").toString() );
		newBook.setUser(foundUser);
		newBook.setCreatedAt(date);
		newBook.setUpdatedAt(date);
		bookService.insertIntoBooks( newBook );
		return "redirect:/books/b";
	}
	
	@GetMapping( "/{id}" )
	public String show( @PathVariable("id") Long id, Model model, HttpSession session ) {
		if( session.getAttribute("email") != null ) {
			Book foundBook = bookService.selectFromBooksWhereId(id);
			if( foundBook == null ) {
				return "redirect:/books/b";
			}
			model.addAttribute( "book", foundBook );
			model.addAttribute( "user", session.getAttribute("email").toString() );
            return "show.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@GetMapping( "/{id}/edit" )
	public String edit( @PathVariable("id") Long id, Model model,
						@ModelAttribute("newBook") Book newBook, 
						HttpSession session ) {
		if( session.getAttribute("email") != null ) {
			Book foundBook = bookService.selectFromBooksWhereId(id);
			if( foundBook == null ) {
				return "redirect:/books/b";
			}
			model.addAttribute( "book", foundBook );
            return "edit.jsp";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PutMapping( "/{id}/edit" )
	public String edit_P( @PathVariable("id") Long id,
						  @Valid @ModelAttribute("newBook") Book newBook,
						  BindingResult result, HttpSession session ) {
		if( result.hasErrors() ) {
			return "add.jsp";
		}
		User foundUser = userService.selectFromUsersWhereEmail( session.getAttribute("email").toString() );
		newBook.setUser(foundUser);
		newBook.setUpdatedAt(date);
		bookService.updateBooks( newBook );
		return String.format( "redirect:/books/%s", id );
	}
	
	@DeleteMapping( "/{id}/delete" )
	public String delete( @PathVariable("id") Long id ) {
		bookService.deleteFromBooks( id );
		return "redirect:/books/b";
	}
	
}
