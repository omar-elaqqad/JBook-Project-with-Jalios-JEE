package com.jalios.jcmsplugin.jbook;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;

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
	

}
