package com.jalios.jcmsplugin.jbook.ui;

import java.util.Comparator;
import java.util.SortedSet;

import com.jalios.jcms.Publication;
import com.jalios.jcms.QueryResultSet;
import com.jalios.jcms.comparator.ComparatorManager;
import com.jalios.jcms.handler.QueryHandler;
import com.jalios.util.Util;

import generated.Book;

public class JBookAppHandler extends QueryHandler{
	
	
	protected QueryResultSet resultSet;
	
	public boolean showAppTitle() {
		return !getWorkspace().isCollaborativeSpace();
		
	}
	
	public String getAppTitle() {
		return glp("jcmsplugin.jbook.app.catalog.title");
	}

	
	@Override
	protected void init(){
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


	public boolean showNoResults(){
		  return Util.isEmpty(getResultSet());
	}
	
	
	public String getAppUrl() {
		return "plugins/JBookPlugin/jsp/app/jbook.jsp";
		
	}
	
	
	public boolean showAddBook() {
		if(!isLogged) {
			return false;
		}
		return loggedMember.canPublishSome(Book.class);
		
	}
	
	public String getAddBookUrl() {
		
		return "types/Book/editBookModal.jsp";
		
	}
	
}
