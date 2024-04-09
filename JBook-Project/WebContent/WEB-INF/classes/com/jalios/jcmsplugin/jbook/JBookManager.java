package com.jalios.jcmsplugin.jbook;

import static com.jalios.jcmsplugin.jbook.data.JBookBorrowing.BORROWING_DATE_FIELD;

import static com.jalios.jcmsplugin.jbook.data.JBookBorrowing.RELEASE_DATE_FIELD;

import com.jalios.jcmsplugin.jbook.data.JBookBorrowingQueryBuilder;


import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import org.hibernate.criterion.Order;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Member;
import com.jalios.jcmsplugin.jbook.data.AbstractBook;
import com.jalios.jcmsplugin.jbook.data.JBookBorrowing;

public class JBookManager {


	private static final JBookManager SINGLETON=new JBookManager();

	public static final String VID_TOPIC_ROOT = "$id.jcmsplugin.jbook.catalog.topic-root";

	 // Singleton & init

	private JBookManager() {
		//empty
	}

	public static JBookManager getInstance() {

		return SINGLETON;
	}


	public Category getTopicRoot() {
		return Channel.getChannel().getCategory(VID_TOPIC_ROOT);
	}

	  /**
	   * Returns the current borrowing for the given book.
	   *
	   * @param book the book
	   * @return the current borrowing for the given book.
	   */
	  public JBookBorrowing getCurrentBorrowing(AbstractBook book) {
	    Objects.requireNonNull(book, "book must not be null");

	    return new JBookBorrowingQueryBuilder()
	    .book(book)
	    .current()
	    .orderBy(Order.desc(BORROWING_DATE_FIELD))
	    .first();
	  }
	
	/**
	 * Saves that the given member borrows the given book.
	 * @param book the book
	 * @param borrower the member who borrows the book.
	 * @return the JBookBorrowing object
	 */
	public JBookBorrowing borrowBook(AbstractBook book, Member borrower) {
	  Objects.requireNonNull(borrower, "mbr must not be null");

	  JBookBorrowing borrowing = getCurrentBorrowing(book);
	  if (borrowing != null) {

	    if (borrower == borrowing.getBorrower()) {
	      return borrowing;
	    }

	    releaseBook(book, borrower);
	  }

	  borrowing = new JBookBorrowing();
	  borrowing.setAuthor(borrower);
	  borrowing.setBorrower(borrower);
	  borrowing.setBook(book);
	  borrowing.setBorrowingDate(new Date());
	  ControllerStatus status = borrowing.checkAndPerformCreate(borrower);

	  if (status.isOK()) {
	    return borrowing;
	  }

	  return null;
	}

	/**
	 * Saves that the given member releases the given book.
	 * @param book the book
	 * @param borrower the member who borrows the book.
	 * @return true if the release has been performed.
	 */
	public boolean releaseBook(AbstractBook book, Member borrower) {
	  Objects.requireNonNull(borrower);

	  JBookBorrowing borrowing = getCurrentBorrowing(book);
	  if (borrowing == null) {
	    return false;
	  }

	  borrowing.setReleaseDate(new Date());
	  ControllerStatus status = borrowing.checkAndPerformUpdate(borrower);
	  return status.isOK();
	}
	
	
	/**
	 * Returns the list of borrowing for the given book.
	 * @param book the book.
	 * @return the list of borrowing for the given book.
	 */
	public List<JBookBorrowing> getBorrowingList(AbstractBook book) {
	  Objects.requireNonNull(book, "book must not be null");

	  return new JBookBorrowingQueryBuilder()
	  .book(book)
	  .list();
	}
	
	
	
	/**
	 * Returns the list of current borrowing for the given member.
	 * @param borrower the member.
	 * @return the list of current borrowing for the given member.
	 */
	public List<JBookBorrowing> getCurrentBorrowingList(Member borrower) {
	  Objects.requireNonNull(borrower, "borrower must not be null");

	  return new JBookBorrowingQueryBuilder()
	  .borrower(borrower)
	  .current()
	  .list();
	}


	/**
	 * Returns all the borrowings.
	 * @return all the borrowings.
	 */
	public List<JBookBorrowing> getAllCurrentBorrowingList() {

	  return new JBookBorrowingQueryBuilder()
	  .current()
	  .list();
	}
	
	
	
	/**
	 * Returns the count of current borrowing for the given member.
	 * @param borrower the member.
	 * @return the count of current borrowing for the given member.
	 */
	public int getCurrentBorrowingCount(Member borrower) {
	  Objects.requireNonNull(borrower, "borrower must not be null");

	  return new JBookBorrowingQueryBuilder()
	  .borrower(borrower)
	  .current()
	  .count();
	}

	  /**
	   * Returns the set of previous borrowers of the given book.
	   * @param book the book
	   * @return the set of previous borrowers of the given book.
	   */
	  public Set<Member> getPreviousBorrowerSet(AbstractBook book) {
	    List<JBookBorrowing> list = new JBookBorrowingQueryBuilder()
	        .book(book)
	        .released()
	        .orderBy(Order.desc(RELEASE_DATE_FIELD))
	        .list();

	    Set<Member> borrowerSet = list.stream()
	    .map(JBookBorrowing::getBorrower)
	    .collect(Collectors.toSet());

	    return borrowerSet;
	  }
	
	
	
	
}
