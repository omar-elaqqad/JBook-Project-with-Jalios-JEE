// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletTopMemberHandler extends EditAbstractPortletSkinableHandler {

  protected PortletTopMember theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletTopMember.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletTopMember
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("titleText".equals(field)) {
      return getAllAvailableTitleTextML();
    }

    if ("maxResults".equals(field)) {
      return getAvailableMaxResults();
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
  // validateCommonCreateUpdatePortletTopMember
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletTopMember() {
    if (!isMaxResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxResults", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletTopMember()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletTopMember()) {
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
    PortletTopMember obj = (PortletTopMember)data;
    obj.setTitleText(getAvailableTitleText());
    obj.setTitleTextML(getAvailableTitleTextML());
    obj.setMaxResults(getAvailableMaxResults());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletTopMember) {
      super.setId(v);
      theContent = (PortletTopMember)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // titleText
  // ----------------------------------------------------------------------
  protected TypeFieldEntry titleTextTFE = channel.getTypeFieldEntry(PortletTopMember.class, "titleText", true);
  protected String titleText = channel.getTypeFieldEntry(PortletTopMember.class, "titleText", true).getDefaultTextString();
  protected HashMap<String,String> titleTextML = titleTextTFE.getDefaultTextMap();
  public void setTitleText(String[] v) {
    titleText = getMultilingualMainValue(titleTextTFE, v);
    titleTextML = getMultilingualMLMap(titleTextTFE, v);
  }
  public String getAvailableTitleText() {
    if (theContent != null && isFieldMissing("titleText")) {
     String objectValue = theContent.getTitleText();
      return objectValue;
    }
    return titleText;
  }


  public HashMap<String,String> getAllAvailableTitleTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableTitleTextML());
    map.put(channel.getLanguage(),getAvailableTitleText(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableTitleTextML() {
    if (theContent != null && isFieldMissing("titleText")) {
      return theContent.getTitleTextML();
    }
    return titleTextML;
  }
  public String getAvailableTitleText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(titleText, channel.getTypeFieldEntry(PortletTopMember.class, "titleText", true).getDefaultTextString())) {
          return titleText;
      	}
      } else {
      	if (titleTextML != null && Util.notEmpty(titleTextML.get(lang))) {
      	  return titleTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getTitleText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return titleText;
    }
    return titleTextML == null ? "" : Util.getString(titleTextML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------
  protected TypeFieldEntry maxResultsTFE = channel.getTypeFieldEntry(PortletTopMember.class, "maxResults", true);
  protected boolean isMaxResultsValidated = true;
  protected int maxResults = 10;
  public void setMaxResults(String v) {
    try {
      maxResults = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaxResultsValidated = false;
    }
  }
  public int getAvailableMaxResults() {
    if (theContent != null && isFieldMissing("maxResults")) {
     int objectValue = theContent.getMaxResults();
      return objectValue;
    }
    return maxResults;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// gH8hSImrnM2F78X7lU2wkg==
