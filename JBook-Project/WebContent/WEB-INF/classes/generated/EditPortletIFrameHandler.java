// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletIFrameHandler extends EditAbstractPortletSkinableHandler {

  protected PortletIFrame theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletIFrame.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletIFrame
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

    if ("source".equals(field)) {
      return getAllAvailableSourceML();
    }

    if ("frameWidth".equals(field)) {
      return getAvailableFrameWidth();
    }

    if ("frameHeight".equals(field)) {
      return getAvailableFrameHeight();
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
  // validateCommonCreateUpdatePortletIFrame
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletIFrame() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletIFrame()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletIFrame()) {
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
    PortletIFrame obj = (PortletIFrame)data;
    obj.setSource(getAvailableSource());
    obj.setSourceML(getAvailableSourceML());
    obj.setFrameWidth(getAvailableFrameWidth());
    obj.setFrameHeight(getAvailableFrameHeight());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletIFrame) {
      super.setId(v);
      theContent = (PortletIFrame)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // source
  // ----------------------------------------------------------------------
  protected TypeFieldEntry sourceTFE = channel.getTypeFieldEntry(PortletIFrame.class, "source", true);
  protected String source = channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextString();
  protected HashMap<String,String> sourceML = sourceTFE.getDefaultTextMap();
  public void setSource(String[] v) {
    source = getMultilingualMainValue(sourceTFE, v);
    sourceML = getMultilingualMLMap(sourceTFE, v);
  }
  public String getAvailableSource() {
    if (theContent != null && isFieldMissing("source")) {
     String objectValue = theContent.getSource();
      return objectValue;
    }
    return source;
  }


  public HashMap<String,String> getAllAvailableSourceML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSourceML());
    map.put(channel.getLanguage(),getAvailableSource(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableSourceML() {
    if (theContent != null && isFieldMissing("source")) {
      return theContent.getSourceML();
    }
    return sourceML;
  }
  public String getAvailableSource(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(source, channel.getTypeFieldEntry(PortletIFrame.class, "source", true).getDefaultTextString())) {
          return source;
      	}
      } else {
      	if (sourceML != null && Util.notEmpty(sourceML.get(lang))) {
      	  return sourceML.get(lang);
      	}
      }
      return Util.getString(theContent.getSource(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return source;
    }
    return sourceML == null ? "" : Util.getString(sourceML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // frameWidth
  // ----------------------------------------------------------------------
  protected TypeFieldEntry frameWidthTFE = channel.getTypeFieldEntry(PortletIFrame.class, "frameWidth", true);
  protected String frameWidth = channel.getTypeFieldEntry(PortletIFrame.class, "frameWidth", true).getDefaultTextString();
  public void setFrameWidth(String[] v) {
    frameWidth = getMonolingualValue(frameWidthTFE, v);
  }
  public String getAvailableFrameWidth() {
    if (theContent != null && isFieldMissing("frameWidth")) {
     String objectValue = theContent.getFrameWidth();
      return objectValue;
    }
    return frameWidth;
  }




  // ----------------------------------------------------------------------
  // frameHeight
  // ----------------------------------------------------------------------
  protected TypeFieldEntry frameHeightTFE = channel.getTypeFieldEntry(PortletIFrame.class, "frameHeight", true);
  protected String frameHeight = channel.getTypeFieldEntry(PortletIFrame.class, "frameHeight", true).getDefaultTextString();
  public void setFrameHeight(String[] v) {
    frameHeight = getMonolingualValue(frameHeightTFE, v);
  }
  public String getAvailableFrameHeight() {
    if (theContent != null && isFieldMissing("frameHeight")) {
     String objectValue = theContent.getFrameHeight();
      return objectValue;
    }
    return frameHeight;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 21z7vmqpN/da+CZmTIyztw==
