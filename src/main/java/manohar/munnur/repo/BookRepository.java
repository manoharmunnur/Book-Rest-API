package manohar.munnur.repo;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import manohar.munnur.entity.Book;

public interface BookRepository extends JpaRepository<Book, Serializable> {
	
}
