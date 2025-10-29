package manohar.munnur.service;

import java.util.List;

import manohar.munnur.entity.Book;

public interface BookService {
	
	public String upsertBook(Book book); // upsert means update and insert
	
	public List<Book> getAllBooks();
	
//	public String updateBook(Book book);
	
	public String deleteBook(Integer bookId);
	
}
