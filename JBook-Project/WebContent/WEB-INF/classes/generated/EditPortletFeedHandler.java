// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletFeedHandler extends EditPortletQueryForeachHandler {

  protected PortletFeed theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletFeed.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletFeed
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

    if ("formats".equals(field)) {
      return getAvailableFormats();
    }

    if ("copyright".equals(field)) {
      return getAllAvailableCopyrightML();
    }

    if ("useAuthKey".equals(field)) {
      return getAvailableUseAuthKey();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("formats".equals(field)) {
      return PortletFeed.getFormatsValues();
    }
    if ("useAuthKey".equals(field)) {
      return PortletFeed.getUseAuthKeyValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("formats".equals(field)) {
      return PortletFeed.getFormatsLabels(userLang);
    }
    if ("useAuthKey".equals(field)) {
      return PortletFeed.getUseAuthKeyLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletFeed
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletFeed() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletFeed()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletFeed()) {
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
    PortletFeed obj = (PortletFeed)data;
    obj.setFormats(getAvailableFormats());
    obj.setCopyright(getAvailableCopyright());
    obj.setCopyrightML(getAvailableCopyrightML());
    obj.setUseAuthKey(getAvailableUseAuthKey());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletFeed) {
      super.setId(v);
      theContent = (PortletFeed)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // formats
  // ----------------------------------------------------------------------
  protected TypeFieldEntry formatsTFE = channel.getTypeFieldEntry(PortletFeed.class, "formats", true);
  protected String[] formats = new String[0];
  protected int formatsAddCount = 0;
  public void setFormats(String[] v) {
    formats = getMonolingualValueArray(formatsTFE, v);
  }

  public String[] getAvailableFormats() {
    if (theContent != null && isFieldMissing("formats")) {
	  String[] objectValue = theContent.getFormats();
      if (objectValue == null) {
        return formats;
      }
      return objectValue;
    }
    return formats;
  }



  public void setFormatsAddCount(int  v) {
    formatsAddCount = v;
  }

  public int getFormatsCount() {
    int arraySize = Util.getSize(getAvailableFormats());
    int res = 3 + arraySize + formatsAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // copyright
  // ----------------------------------------------------------------------
  protected TypeFieldEntry copyrightTFE = channel.getTypeFieldEntry(PortletFeed.class, "copyright", true);
  protected String copyright = channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextString();
  protected HashMap<String,String> copyrightML = copyrightTFE.getDefaultTextMap();
  public void setCopyright(String[] v) {
    copyright = getMultilingualMainValue(copyrightTFE, v);
    copyrightML = getMultilingualMLMap(copyrightTFE, v);
  }
  public String getAvailableCopyright() {
    if (theContent != null && isFieldMissing("copyright")) {
     String objectValue = theContent.getCopyright();
      return objectValue;
    }
    return copyright;
  }


  public HashMap<String,String> getAllAvailableCopyrightML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableCopyrightML());
    map.put(channel.getLanguage(),getAvailableCopyright(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableCopyrightML() {
    if (theContent != null && isFieldMissing("copyright")) {
      return theContent.getCopyrightML();
    }
    return copyrightML;
  }
  public String getAvailableCopyright(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(copyright, channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextString())) {
          return copyright;
      	}
      } else {
      	if (copyrightML != null && Util.notEmpty(copyrightML.get(lang))) {
      	  return copyrightML.get(lang);
      	}
      }
      return Util.getString(theContent.getCopyright(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return copyright;
    }
    return copyrightML == null ? "" : Util.getString(copyrightML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // useAuthKey
  // ----------------------------------------------------------------------
  protected TypeFieldEntry useAuthKeyTFE = channel.getTypeFieldEntry(PortletFeed.class, "useAuthKey", true);
  protected boolean useAuthKey = false;
  public void setUseAuthKey(boolean  v) {
    this.useAuthKey = v;
  }

  public boolean getAvailableUseAuthKey() {
    if (theContent != null && isFieldMissing("useAuthKey")) {
     boolean objectValue = theContent.getUseAuthKey();
      return objectValue;
    }
    return useAuthKey;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// XRhsKMVF3s6TE5jpQTdHuA==
