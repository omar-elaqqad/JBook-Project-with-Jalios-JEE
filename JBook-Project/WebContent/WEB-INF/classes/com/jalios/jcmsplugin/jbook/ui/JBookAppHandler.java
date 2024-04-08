package com.jalios.jcmsplugin.jbook.ui;

import java.util.Comparator;
import java.util.SortedSet;

import com.jalios.jcms.Publication;
import com.jalios.jcms.QueryResultSet;
import com.jalios.jcms.comparator.ComparatorManager;
import com.jalios.jcms.handler.QueryHandler;
import com.jalios.util.Util;

import generated.Book;

public class JBookAppHandler extends QueryHandler {

	protected QueryResultSet resultSet;
	protected Book book;

	public boolean showAppTitle() {
		return !getWorkspace().isCollaborativeSpace();

	}

	public String getAppTitle() {
		return glp("jcmsplugin.jbook.app.catalog.title");
	}

	@Override
	protected void init() {
		setTypes("generated.Book");
		setSort("title");
	}

	@Override
	public QueryResultSet getResultSet() {
		if (resultSet == null) {
			resultSet = super.getResultSet();
		}
		return resultSet;
	}

	public SortedSet<Publication> getSortedResultSet() {
		Comparator comparator = ComparatorManager.getComparator(Publication.class, getSort());
		return getResultSet().getAsSortedSet(comparator);

	}

	public boolean showNoResults() {
		return Util.isEmpty(getResultSet());
	}

	public String getAppUrl() {
		return "plugins/JBookPlugin/jsp/app/jbook.jsp";

	}

	
	// for adding a new book 
	public boolean showAddBook() {
		if (!isLogged) {
			return false;
		}
		return loggedMember.canPublishSome(Book.class);

	}

	public String getAddBookUrl() {

		return "types/Book/editBookModal.jsp";

	}

	// display the book on the app
	
	public boolean showCatalog() {
		return !showBook();
	}

	public boolean showBook() {
		return getSelectedBook() != null;
	}

	public Book getSelectedBook() {
		return book;
	}

	public void setBook(String id) {
		book = channel.getData(Book.class, id);
	}

	public String getEditBookUrl() {
		if(book==null) {
			return null;
		}
		return "types/Book/editBookModal.jsp?id=" + book.getId();
	}
}
