package com.jalios.jcmsplugin.jbook;

import static com.jalios.jcms.test.Assert.assertStatusOK;
import static com.jalios.jcms.test.JcmsTestCaseUtil.deleteOnTearDown;

import com.jalios.jcms.ControllerStatus;

//newer verion of DevTestCase4 is JcmsTestCase4 
import com.jalios.jcms.test.JcmsTestCase4;

import generated.Book;

public abstract class JBookTestCase extends JcmsTestCase4 {
	

  protected String createBook(String title) {
    String id;
    beginTransaction();
    {
      Book book = new Book();
      book.setTitle(title);
      book.setAuthor(admin);
      ControllerStatus status = book.checkAndPerformCreate(admin);
      assertStatusOK(status);
      id = book.getId();
      deleteOnTearDown(book);
    }
    commitTransaction();
    return id;
  }

}