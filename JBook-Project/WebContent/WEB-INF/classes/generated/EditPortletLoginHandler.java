// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletLoginHandler extends EditAbstractPortletSkinableHandler {

  protected PortletLogin theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletLogin.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletLogin
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

    if ("introduction".equals(field)) {
      return getAllAvailableIntroductionML();
    }

    if ("loginText".equals(field)) {
      return getAllAvailableLoginTextML();
    }

    if ("passwordText".equals(field)) {
      return getAllAvailablePasswordTextML();
    }

    if ("buttonText".equals(field)) {
      return getAllAvailableButtonTextML();
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
  // validateCommonCreateUpdatePortletLogin
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletLogin() {
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
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletLogin()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletLogin()) {
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
    PortletLogin obj = (PortletLogin)data;
    obj.setIntroduction(getAvailableIntroduction());
    obj.setIntroductionML(getAvailableIntroductionML());
    obj.setLoginText(getAvailableLoginText());
    obj.setLoginTextML(getAvailableLoginTextML());
    obj.setPasswordText(getAvailablePasswordText());
    obj.setPasswordTextML(getAvailablePasswordTextML());
    obj.setButtonText(getAvailableButtonText());
    obj.setButtonTextML(getAvailableButtonTextML());
    obj.setDisplayPortal(getAvailableDisplayPortal());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletLogin) {
      super.setId(v);
      theContent = (PortletLogin)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // introduction
  // ----------------------------------------------------------------------
  protected TypeFieldEntry introductionTFE = channel.getTypeFieldEntry(PortletLogin.class, "introduction", true);
  protected String introduction = channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextString();
  protected HashMap<String,String> introductionML = introductionTFE.getDefaultTextMap();
  public void setIntroduction(String[] v) {
    introduction = getMultilingualMainValue(introductionTFE, v);
    introductionML = getMultilingualMLMap(introductionTFE, v);
  }
  public String getAvailableIntroduction() {
    if (theContent != null && isFieldMissing("introduction")) {
     String objectValue = theContent.getIntroduction();
      return objectValue;
    }
    return introduction;
  }


  public HashMap<String,String> getAllAvailableIntroductionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableIntroductionML());
    map.put(channel.getLanguage(),getAvailableIntroduction(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableIntroductionML() {
    if (theContent != null && isFieldMissing("introduction")) {
      return theContent.getIntroductionML();
    }
    return introductionML;
  }
  public String getAvailableIntroduction(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(introduction, channel.getTypeFieldEntry(PortletLogin.class, "introduction", true).getDefaultTextString())) {
          return introduction;
      	}
      } else {
      	if (introductionML != null && Util.notEmpty(introductionML.get(lang))) {
      	  return introductionML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntroduction(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return introduction;
    }
    return introductionML == null ? "" : Util.getString(introductionML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // loginText
  // ----------------------------------------------------------------------
  protected TypeFieldEntry loginTextTFE = channel.getTypeFieldEntry(PortletLogin.class, "loginText", true);
  protected String loginText = channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextString();
  protected HashMap<String,String> loginTextML = loginTextTFE.getDefaultTextMap();
  public void setLoginText(String[] v) {
    loginText = getMultilingualMainValue(loginTextTFE, v);
    loginTextML = getMultilingualMLMap(loginTextTFE, v);
  }
  public String getAvailableLoginText() {
    if (theContent != null && isFieldMissing("loginText")) {
     String objectValue = theContent.getLoginText();
      return objectValue;
    }
    return loginText;
  }


  public HashMap<String,String> getAllAvailableLoginTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableLoginTextML());
    map.put(channel.getLanguage(),getAvailableLoginText(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableLoginTextML() {
    if (theContent != null && isFieldMissing("loginText")) {
      return theContent.getLoginTextML();
    }
    return loginTextML;
  }
  public String getAvailableLoginText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(loginText, channel.getTypeFieldEntry(PortletLogin.class, "loginText", true).getDefaultTextString())) {
          return loginText;
      	}
      } else {
      	if (loginTextML != null && Util.notEmpty(loginTextML.get(lang))) {
      	  return loginTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getLoginText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return loginText;
    }
    return loginTextML == null ? "" : Util.getString(loginTextML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // passwordText
  // ----------------------------------------------------------------------
  protected TypeFieldEntry passwordTextTFE = channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true);
  protected String passwordText = channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextString();
  protected HashMap<String,String> passwordTextML = passwordTextTFE.getDefaultTextMap();
  public void setPasswordText(String[] v) {
    passwordText = getMultilingualMainValue(passwordTextTFE, v);
    passwordTextML = getMultilingualMLMap(passwordTextTFE, v);
  }
  public String getAvailablePasswordText() {
    if (theContent != null && isFieldMissing("passwordText")) {
     String objectValue = theContent.getPasswordText();
      return objectValue;
    }
    return passwordText;
  }


  public HashMap<String,String> getAllAvailablePasswordTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePasswordTextML());
    map.put(channel.getLanguage(),getAvailablePasswordText(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailablePasswordTextML() {
    if (theContent != null && isFieldMissing("passwordText")) {
      return theContent.getPasswordTextML();
    }
    return passwordTextML;
  }
  public String getAvailablePasswordText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(passwordText, channel.getTypeFieldEntry(PortletLogin.class, "passwordText", true).getDefaultTextString())) {
          return passwordText;
      	}
      } else {
      	if (passwordTextML != null && Util.notEmpty(passwordTextML.get(lang))) {
      	  return passwordTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getPasswordText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return passwordText;
    }
    return passwordTextML == null ? "" : Util.getString(passwordTextML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // buttonText
  // ----------------------------------------------------------------------
  protected TypeFieldEntry buttonTextTFE = channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true);
  protected String buttonText = channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextString();
  protected HashMap<String,String> buttonTextML = buttonTextTFE.getDefaultTextMap();
  public void setButtonText(String[] v) {
    buttonText = getMultilingualMainValue(buttonTextTFE, v);
    buttonTextML = getMultilingualMLMap(buttonTextTFE, v);
  }
  public String getAvailableButtonText() {
    if (theContent != null && isFieldMissing("buttonText")) {
     String objectValue = theContent.getButtonText();
      return objectValue;
    }
    return buttonText;
  }


  public HashMap<String,String> getAllAvailableButtonTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableButtonTextML());
    map.put(channel.getLanguage(),getAvailableButtonText(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableButtonTextML() {
    if (theContent != null && isFieldMissing("buttonText")) {
      return theContent.getButtonTextML();
    }
    return buttonTextML;
  }
  public String getAvailableButtonText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(buttonText, channel.getTypeFieldEntry(PortletLogin.class, "buttonText", true).getDefaultTextString())) {
          return buttonText;
      	}
      } else {
      	if (buttonTextML != null && Util.notEmpty(buttonTextML.get(lang))) {
      	  return buttonTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getButtonText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return buttonText;
    }
    return buttonTextML == null ? "" : Util.getString(buttonTextML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------
  protected TypeFieldEntry displayPortalTFE = channel.getTypeFieldEntry(PortletLogin.class, "displayPortal", true);
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
// hEatzHkGLE/T59+LFzTi6w==
