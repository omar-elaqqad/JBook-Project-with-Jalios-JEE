// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletSignUpHandler extends EditAbstractPortletSkinableHandler {

  protected PortletSignUp theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletSignUp.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletSignUp
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("displayPortal", __displayPortalStr, generated.PortletPortal.class);
      if (data != null) {
        displayPortal = (generated.PortletPortal)data;
      } else {
        isDisplayPortalValidated = Util.isEmpty(__displayPortalStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableDisplayPortal(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableDisplayPortal(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("intro".equals(field)) {
      return getAllAvailableIntroML();
    }

    if ("label".equals(field)) {
      return getAllAvailableLabelML();
    }

    if ("displayPortal".equals(field)) {
      return getAvailableDisplayPortal();
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
  // validateCommonCreateUpdatePortletSignUp
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletSignUp() {
    if (!isDisplayPortalValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "displayPortal", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletSignUp()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletSignUp()) {
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
    PortletSignUp obj = (PortletSignUp)data;
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setLabel(getAvailableLabel());
    obj.setLabelML(getAvailableLabelML());
    obj.setDisplayPortal(getAvailableDisplayPortal());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletSignUp) {
      super.setId(v);
      theContent = (PortletSignUp)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------
  protected TypeFieldEntry introTFE = channel.getTypeFieldEntry(PortletSignUp.class, "intro", true);
  protected String intro = channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextString();
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
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextString())) {
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
  // label
  // ----------------------------------------------------------------------
  protected TypeFieldEntry labelTFE = channel.getTypeFieldEntry(PortletSignUp.class, "label", true);
  protected String label = channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextString();
  protected HashMap<String,String> labelML = labelTFE.getDefaultTextMap();
  public void setLabel(String[] v) {
    label = getMultilingualMainValue(labelTFE, v);
    labelML = getMultilingualMLMap(labelTFE, v);
  }
  public String getAvailableLabel() {
    if (theContent != null && isFieldMissing("label")) {
     String objectValue = theContent.getLabel();
      return objectValue;
    }
    return label;
  }


  public HashMap<String,String> getAllAvailableLabelML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableLabelML());
    map.put(channel.getLanguage(),getAvailableLabel(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableLabelML() {
    if (theContent != null && isFieldMissing("label")) {
      return theContent.getLabelML();
    }
    return labelML;
  }
  public String getAvailableLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(label, channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextString())) {
          return label;
      	}
      } else {
      	if (labelML != null && Util.notEmpty(labelML.get(lang))) {
      	  return labelML.get(lang);
      	}
      }
      return Util.getString(theContent.getLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return label;
    }
    return labelML == null ? "" : Util.getString(labelML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------
  protected TypeFieldEntry displayPortalTFE = channel.getTypeFieldEntry(PortletSignUp.class, "displayPortal", true);
  protected boolean isDisplayPortalValidated = true;
  protected generated.PortletPortal displayPortal;
  String __displayPortalStr = null;
  public void setDisplayPortal(String v) {
    __displayPortalStr = v;
  }
  public generated.PortletPortal getAvailableDisplayPortal() {
    if (theContent != null && isFieldMissing("displayPortal")) {
     generated.PortletPortal objectValue = theContent.getDisplayPortal();
      return objectValue;
    }
    return displayPortal;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// JqQO5oLKSZd9CX9TdYbnmw==
