package com.jalios.jcmsplugin.jbook.data;

import java.util.Date;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.db.DBData;

public class JBookBorrowing extends Data implements DBData{
	
	
	private static final long serialVersionUID = 1L;
	
	public static final String BOOK_ID_FIELD = "bookId";
	public static final String BORROWER_ID_FIELD = "borrowerId";
	public static final String RELEASE_DATE_FIELD = "releaseDate";
	public static final String BORROWING_DATE_FIELD = "borrowingDate";
	
	private AbstractBook book;
	private String bookId;
	private Member borrower;
	private String borrowerId;
	private Date borrowingDate;
	private Date releaseDate;
	
	
	public AbstractBook getBook() {
		return book;
	}
	public void setBook(AbstractBook book) {
		bookId=null;
		this.book = book;
	}
	public String getBookId() {
		
		if(book==null) {
			return bookId;
		}
		return book.getId();
	}
	
	public void setBookId(String Id) {
		
		bookId=Id;
		book=channel.getData(AbstractBook.class,Id);
	}
	
	
	public Member getBorrower() {
		return borrower;
	}
	
	
	public void setBorrower(Member borrower) {
		borrowerId=null;
		this.borrower = borrower;
	}
	
	
	public String getBorrowerId() {
		if(borrower==null) {
			return borrowerId;
		}
		
		return borrower.getId();
	}
	public void setBorrowerId(String Id) {
		borrowerId=Id;
		borrower=channel.getData(Member.class,Id);
		
	}
	public Date getBorrowingDate() {
		return borrowingDate;
	}
	public void setBorrowingDate(Date borrowingDate) {
		this.borrowingDate = borrowingDate;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}	

}
