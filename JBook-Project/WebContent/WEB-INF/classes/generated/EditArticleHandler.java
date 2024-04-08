// This file has been automatically generated.
package generated;


import java.util.HashMap;
import java.util.List;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditArticleHandler extends EditPublicationHandler {

  protected Article theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return Article.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpArticle
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      List<com.jalios.jcms.Content> list = processDataIds("relatedContents",__relatedContentsStr,com.jalios.jcms.Content.class);
      this.relatedContents = list.toArray(new com.jalios.jcms.Content[0]);
    }
    if (!validateUploadedFileDocument(getAvailableRelatedContents(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableRelatedContents(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("summary".equals(field)) {
      return getAllAvailableSummaryML();
    }

    if ("intro".equals(field)) {
      return getAllAvailableIntroML();
    }

    if ("picture".equals(field)) {
      return getAllAvailablePictureML();
    }

    if ("pictureAlt".equals(field)) {
      return getAllAvailablePictureAltML();
    }

    if ("content".equals(field)) {
      return getAllAvailableContentML();
    }

    if ("relatedContents".equals(field)) {
      return getAvailableRelatedContents();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateArticle
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateArticle() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateArticle()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateArticle()) {
      return false;
    }

    return true;
  }

  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  @Override
protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  @Override
protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  @Override
protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  @Override
public void setFields(Publication data) {
    super.setFields(data);
    Article obj = (Article)data;
    obj.setSummary(getAvailableSummary());
    obj.setSummaryML(getAvailableSummaryML());
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setPicture(getAvailablePicture());
    obj.setPictureML(getAvailablePictureML());
    obj.setPictureAlt(getAvailablePictureAlt());
    obj.setPictureAltML(getAvailablePictureAltML());
    obj.setContent(getAvailableContent());
    obj.setContentML(getAvailableContentML());
    obj.setRelatedContents(getAvailableRelatedContents());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof Article) {
      super.setId(v);
      theContent = (Article)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------
  protected TypeFieldEntry summaryTFE = channel.getTypeFieldEntry(Article.class, "summary", true);
  protected String summary = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextString();
  protected HashMap<String,String> summaryML = summaryTFE.getDefaultTextMap();
  public void setSummary(String[] v) {
    summary = getMultilingualMainValue(summaryTFE, v);
    summaryML = getMultilingualMLMap(summaryTFE, v);
  }
  public String getAvailableSummary() {
    if (theContent != null && isFieldMissing("summary")) {
     String objectValue = theContent.getSummary();
      return objectValue;
    }
    return summary;
  }


  public HashMap<String,String> getAllAvailableSummaryML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSummaryML());
    map.put(channel.getLanguage(),getAvailableSummary(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableSummaryML() {
    if (theContent != null && isFieldMissing("summary")) {
      return theContent.getSummaryML();
    }
    return summaryML;
  }
  public String getAvailableSummary(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(summary, channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextString())) {
          return summary;
      	}
      } else {
      	if (summaryML != null && Util.notEmpty(summaryML.get(lang))) {
      	  return summaryML.get(lang);
      	}
      }
      return Util.getString(theContent.getSummary(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return summary;
    }
    return summaryML == null ? "" : Util.getString(summaryML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------
  protected TypeFieldEntry introTFE = channel.getTypeFieldEntry(Article.class, "intro", true);
  protected String intro = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextString();
  protected HashMap<String,String> introML = introTFE.getDefaultTextMap();
  public void setIntro(String[] v) {
    intro = getMultilingualMainValue(introTFE, v);
    introML = getMultilingualMLMap(introTFE, v);
  }
  public String getAvailableIntro() {
    if (theContent != null && isFieldMissing("intro")) {
     String objectValue = theContent.getIntro();
      return objectValue;
    }
    return intro;
  }


  public HashMap<String,String> getAllAvailableIntroML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableIntroML());
    map.put(channel.getLanguage(),getAvailableIntro(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableIntroML() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntroML();
    }
    return introML;
  }
  public String getAvailableIntro(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextString())) {
          return intro;
      	}
      } else {
      	if (introML != null && Util.notEmpty(introML.get(lang))) {
      	  return introML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntro(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return intro;
    }
    return introML == null ? "" : Util.getString(introML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // picture
  // ----------------------------------------------------------------------
  protected TypeFieldEntry pictureTFE = channel.getTypeFieldEntry(Article.class, "picture", true);
  protected String picture = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextString();
  protected HashMap<String,String> pictureML = pictureTFE.getDefaultTextMap();
  public void setPicture(String[] v) {
    picture = getMultilingualMainValue(pictureTFE, v);
    pictureML = getMultilingualMLMap(pictureTFE, v);
  }
  public String getAvailablePicture() {
    if (theContent != null && isFieldMissing("picture")) {
     String objectValue = theContent.getPicture();
      return objectValue;
    }
    return picture;
  }


  public HashMap<String,String> getAllAvailablePictureML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePictureML());
    map.put(channel.getLanguage(),getAvailablePicture(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailablePictureML() {
    if (theContent != null && isFieldMissing("picture")) {
      return theContent.getPictureML();
    }
    return pictureML;
  }
  public String getAvailablePicture(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(picture, channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextString())) {
          return picture;
      	}
      } else {
      	if (pictureML != null && Util.notEmpty(pictureML.get(lang))) {
      	  return pictureML.get(lang);
      	}
      }
      return Util.getString(theContent.getPicture(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return picture;
    }
    return pictureML == null ? "" : Util.getString(pictureML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // pictureAlt
  // ----------------------------------------------------------------------
  protected TypeFieldEntry pictureAltTFE = channel.getTypeFieldEntry(Article.class, "pictureAlt", true);
  protected String pictureAlt = channel.getTypeFieldEntry(Article.class, "pictureAlt", true).getDefaultTextString();
  protected HashMap<String,String> pictureAltML = pictureAltTFE.getDefaultTextMap();
  public void setPictureAlt(String[] v) {
    pictureAlt = getMultilingualMainValue(pictureAltTFE, v);
    pictureAltML = getMultilingualMLMap(pictureAltTFE, v);
  }
  public String getAvailablePictureAlt() {
    if (theContent != null && isFieldMissing("pictureAlt")) {
     String objectValue = theContent.getPictureAlt();
      return objectValue;
    }
    return pictureAlt;
  }


  public HashMap<String,String> getAllAvailablePictureAltML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePictureAltML());
    map.put(channel.getLanguage(),getAvailablePictureAlt(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailablePictureAltML() {
    if (theContent != null && isFieldMissing("pictureAlt")) {
      return theContent.getPictureAltML();
    }
    return pictureAltML;
  }
  public String getAvailablePictureAlt(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pictureAlt, channel.getTypeFieldEntry(Article.class, "pictureAlt", true).getDefaultTextString())) {
          return pictureAlt;
      	}
      } else {
      	if (pictureAltML != null && Util.notEmpty(pictureAltML.get(lang))) {
      	  return pictureAltML.get(lang);
      	}
      }
      return Util.getString(theContent.getPictureAlt(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return pictureAlt;
    }
    return pictureAltML == null ? "" : Util.getString(pictureAltML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------
  protected TypeFieldEntry contentTFE = channel.getTypeFieldEntry(Article.class, "content", true);
  protected String content = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextString();
  protected HashMap<String,String> contentML = contentTFE.getDefaultTextMap();
  public void setContent(String[] v) {
    content = getMultilingualMainValue(contentTFE, v);
    contentML = getMultilingualMLMap(contentTFE, v);
  }
  public String getAvailableContent() {
    if (theContent != null && isFieldMissing("content")) {
     String objectValue = theContent.getContent();
      return objectValue;
    }
    return content;
  }


  public HashMap<String,String> getAllAvailableContentML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableContentML());
    map.put(channel.getLanguage(),getAvailableContent(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableContentML() {
    if (theContent != null && isFieldMissing("content")) {
      return theContent.getContentML();
    }
    return contentML;
  }
  public String getAvailableContent(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(content, channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextString())) {
          return content;
      	}
      } else {
      	if (contentML != null && Util.notEmpty(contentML.get(lang))) {
      	  return contentML.get(lang);
      	}
      }
      return Util.getString(theContent.getContent(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return content;
    }
    return contentML == null ? "" : Util.getString(contentML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // relatedContents
  // ----------------------------------------------------------------------
  protected TypeFieldEntry relatedContentsTFE = channel.getTypeFieldEntry(Article.class, "relatedContents", true);
  protected com.jalios.jcms.Content[] relatedContents = new com.jalios.jcms.Content[0];
  protected int relatedContentsAddCount = 0;
  String[] __relatedContentsStr = null;
  public void setRelatedContents(String[]  v) {
    __relatedContentsStr = v;
  }
  public com.jalios.jcms.Content[] getAvailableRelatedContents() {
    if (theContent != null && isFieldMissing("relatedContents")) {
	  com.jalios.jcms.Content[] objectValue = theContent.getRelatedContents();
      if (objectValue == null) {
        return relatedContents;
      }
      return objectValue;
    }
    return relatedContents;
  }



  public void setRelatedContentsAddCount(int  v) {
    relatedContentsAddCount = v;
  }

  public int getRelatedContentsCount() {
    int arraySize = Util.getSize(getAvailableRelatedContents());
    int res = 3 + arraySize + relatedContentsAddCount;
    return res;
  }



}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// gBH9rVg9d2EFZnTRwl4NSQ==
