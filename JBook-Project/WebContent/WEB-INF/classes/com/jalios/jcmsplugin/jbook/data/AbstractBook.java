package com.jalios.jcmsplugin.jbook.data;

import java.util.List;
import java.util.Locale;
import java.util.Set;

import com.jalios.jcms.Content;
import com.jalios.jcms.Member;
import com.jalios.jcmsplugin.jbook.JBookManager;

public abstract class AbstractBook extends Content {

	private transient JBookManager mgr = JBookManager.getInstance();

	public AbstractBook() {

	}

	public AbstractBook(AbstractBook other) {
		super(other);
	}

	abstract public String getDescriptin(String lang);

	abstract public String getIamge();

	public JBookBorrowing getCurrentBorrowing() {
		return mgr.getCurrentBorrowing(this);
	}

	public List<JBookBorrowing> getBorrowingList(int firstResult, int maxResults) {
		return mgr.getBorrowingList(this);
	}

	public Set<Member> getPreviousBorrowerSet() {
		return mgr.getPreviousBorrowerSet(this);
	}

	
	public String getAppDisplayUrl(Locale userLocale) {
		  return JBookManager.getInstance().getAppUrlPrefix(workspace, userLocale) + "book=" + getId();
	}
	
}
