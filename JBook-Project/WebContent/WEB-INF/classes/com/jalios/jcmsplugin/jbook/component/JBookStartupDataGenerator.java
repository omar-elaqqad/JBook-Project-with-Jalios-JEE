package com.jalios.jcmsplugin.jbook.component;

import com.jalios.jcms.StartupDataGenerator;
import com.jalios.jcmsplugin.jbook.*;

public class JBookStartupDataGenerator extends StartupDataGenerator{

	
	
	@Override
	protected void createData() {
		createCategory(JBookManager.VID_TOPIC_ROOT);
		
	}
	
	

}
