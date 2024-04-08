package com.jalios.jcmsplugin.jbook.data;


import static com.jalios.jcmsplugin.jbook.data.JBookBorrowing.BORROWING_DATE_FIELD;
import static com.jalios.jcmsplugin.jbook.data.JBookBorrowing.RELEASE_DATE_FIELD;
import static com.jalios.jcmsplugin.jbook.data.JBookBorrowing.BOOK_ID_FIELD;
import static com.jalios.jcmsplugin.jbook.data.JBookBorrowing.BORROWER_ID_FIELD;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.jalios.jcms.Member;
import com.jalios.jcms.db.AbstractDBQueryBuilder;

public class JBookBorrowingQueryBuilder extends AbstractDBQueryBuilder<JBookBorrowing> {

	
	private AbstractBook book;
	private Member borrower;
	private boolean current;
	private boolean released;
	
	
	public JBookBorrowingQueryBuilder(){
		setDefaultOrder(Order.desc(BORROWING_DATE_FIELD));
	}
	
	
	@Override
	protected Class<JBookBorrowing> getDBDataClass() {
		
		return JBookBorrowing.class;
	}


	public JBookBorrowingQueryBuilder book(AbstractBook book) {
		this.book=book;
		return this;
	}
	
	public JBookBorrowingQueryBuilder borrower(Member borrower) {
		this.borrower=borrower;
		return this;
	}
	
	public JBookBorrowingQueryBuilder current() {
		this.current=true;
		return this;
	}
	
	public JBookBorrowingQueryBuilder released() {
		this.released=true;
		return this;
	}
	
	public JBookBorrowingQueryBuilder orderByBorrowingDate() {
		
		return (JBookBorrowingQueryBuilder)(orderBy(Order.desc(BORROWING_DATE_FIELD)));
	}
	
	@Override
	protected void addCriterions(Criteria criteria) {
		
	    addBookCriterion(criteria);
	    addBorrowerCriterion(criteria);
	    addCurrentCriterion(criteria);
	    addReleasedCriterion(criteria);
		
	}


	private void addBookCriterion(Criteria criteria) {
		
		if(book!=null) {
			criteria.add(Restrictions.eq(BOOK_ID_FIELD, book.getId()));
		}
	}


	private void addBorrowerCriterion(Criteria criteria) {
		if(borrower!=null) {
			criteria.add(Restrictions.eq(BORROWER_ID_FIELD, borrower.getId()));
		}
		
	}


	private void addCurrentCriterion(Criteria criteria) {
		if(current) {
			// this could be BORROWING_DATE_FIELD
			criteria.add(Restrictions.isNull(RELEASE_DATE_FIELD));
		}
		
	}


	private void addReleasedCriterion(Criteria criteria) {
		if(released) {
			criteria.add(Restrictions.isNull(RELEASE_DATE_FIELD));
		}
		
	}

}
