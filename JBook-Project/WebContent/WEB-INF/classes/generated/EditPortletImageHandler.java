// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletImageHandler extends EditAbstractPortletSkinableHandler {

  protected PortletImage theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletImage.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletImage
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

    if ("image".equals(field)) {
      return getAllAvailableImageML();
    }

    if ("link".equals(field)) {
      return getAllAvailableLinkML();
    }

    if ("alt".equals(field)) {
      return getAllAvailableAltML();
    }

    if ("targetWindow".equals(field)) {
      return getAvailableTargetWindow();
    }

    if ("imgWidth".equals(field)) {
      return getAvailableImgWidth();
    }

    if ("imgHeight".equals(field)) {
      return getAvailableImgHeight();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("targetWindow".equals(field)) {
      return PortletImage.getTargetWindowValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("targetWindow".equals(field)) {
      return PortletImage.getTargetWindowLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletImage
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletImage() {
    if (!isImgWidthValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "imgWidth", userLang)));
      return false;
    }
    if (!isImgHeightValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "imgHeight", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletImage()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletImage()) {
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
    PortletImage obj = (PortletImage)data;
    obj.setImage(getAvailableImage());
    obj.setImageML(getAvailableImageML());
    obj.setLink(getAvailableLink());
    obj.setLinkML(getAvailableLinkML());
    obj.setAlt(getAvailableAlt());
    obj.setAltML(getAvailableAltML());
    obj.setTargetWindow(getAvailableTargetWindow());
    obj.setImgWidth(getAvailableImgWidth());
    obj.setImgHeight(getAvailableImgHeight());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletImage) {
      super.setId(v);
      theContent = (PortletImage)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------
  protected TypeFieldEntry imageTFE = channel.getTypeFieldEntry(PortletImage.class, "image", true);
  protected String image = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextString();
  protected HashMap<String,String> imageML = imageTFE.getDefaultTextMap();
  public void setImage(String[] v) {
    image = getMultilingualMainValue(imageTFE, v);
    imageML = getMultilingualMLMap(imageTFE, v);
  }
  public String getAvailableImage() {
    if (theContent != null && isFieldMissing("image")) {
     String objectValue = theContent.getImage();
      return objectValue;
    }
    return image;
  }


  public HashMap<String,String> getAllAvailableImageML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableImageML());
    map.put(channel.getLanguage(),getAvailableImage(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableImageML() {
    if (theContent != null && isFieldMissing("image")) {
      return theContent.getImageML();
    }
    return imageML;
  }
  public String getAvailableImage(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(image, channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextString())) {
          return image;
      	}
      } else {
      	if (imageML != null && Util.notEmpty(imageML.get(lang))) {
      	  return imageML.get(lang);
      	}
      }
      return Util.getString(theContent.getImage(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return image;
    }
    return imageML == null ? "" : Util.getString(imageML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // link
  // ----------------------------------------------------------------------
  protected TypeFieldEntry linkTFE = channel.getTypeFieldEntry(PortletImage.class, "link", true);
  protected String link = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextString();
  protected HashMap<String,String> linkML = linkTFE.getDefaultTextMap();
  public void setLink(String[] v) {
    link = getMultilingualMainValue(linkTFE, v);
    linkML = getMultilingualMLMap(linkTFE, v);
  }
  public String getAvailableLink() {
    if (theContent != null && isFieldMissing("link")) {
     String objectValue = theContent.getLink();
      return objectValue;
    }
    return link;
  }


  public HashMap<String,String> getAllAvailableLinkML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableLinkML());
    map.put(channel.getLanguage(),getAvailableLink(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableLinkML() {
    if (theContent != null && isFieldMissing("link")) {
      return theContent.getLinkML();
    }
    return linkML;
  }
  public String getAvailableLink(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(link, channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextString())) {
          return link;
      	}
      } else {
      	if (linkML != null && Util.notEmpty(linkML.get(lang))) {
      	  return linkML.get(lang);
      	}
      }
      return Util.getString(theContent.getLink(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return link;
    }
    return linkML == null ? "" : Util.getString(linkML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // alt
  // ----------------------------------------------------------------------
  protected TypeFieldEntry altTFE = channel.getTypeFieldEntry(PortletImage.class, "alt", true);
  protected String alt = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextString();
  protected HashMap<String,String> altML = altTFE.getDefaultTextMap();
  public void setAlt(String[] v) {
    alt = getMultilingualMainValue(altTFE, v);
    altML = getMultilingualMLMap(altTFE, v);
  }
  public String getAvailableAlt() {
    if (theContent != null && isFieldMissing("alt")) {
     String objectValue = theContent.getAlt();
      return objectValue;
    }
    return alt;
  }


  public HashMap<String,String> getAllAvailableAltML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableAltML());
    map.put(channel.getLanguage(),getAvailableAlt(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableAltML() {
    if (theContent != null && isFieldMissing("alt")) {
      return theContent.getAltML();
    }
    return altML;
  }
  public String getAvailableAlt(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(alt, channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextString())) {
          return alt;
      	}
      } else {
      	if (altML != null && Util.notEmpty(altML.get(lang))) {
      	  return altML.get(lang);
      	}
      }
      return Util.getString(theContent.getAlt(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return alt;
    }
    return altML == null ? "" : Util.getString(altML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // targetWindow
  // ----------------------------------------------------------------------
  protected TypeFieldEntry targetWindowTFE = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true);
  protected String targetWindow = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getDefaultTextString();
  public void setTargetWindow(String[] v) {
    targetWindow = getMonolingualValue(targetWindowTFE, v);
  }
  public String getAvailableTargetWindow() {
    if (theContent != null && isFieldMissing("targetWindow")) {
     String objectValue = theContent.getTargetWindow();
      return objectValue;
    }
    return targetWindow;
  }




  // ----------------------------------------------------------------------
  // imgWidth
  // ----------------------------------------------------------------------
  protected TypeFieldEntry imgWidthTFE = channel.getTypeFieldEntry(PortletImage.class, "imgWidth", true);
  protected boolean isImgWidthValidated = true;
  protected int imgWidth = 0;
  public void setImgWidth(String v) {
    try {
      imgWidth = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isImgWidthValidated = false;
    }
  }
  public int getAvailableImgWidth() {
    if (theContent != null && isFieldMissing("imgWidth")) {
     int objectValue = theContent.getImgWidth();
      return objectValue;
    }
    return imgWidth;
  }




  // ----------------------------------------------------------------------
  // imgHeight
  // ----------------------------------------------------------------------
  protected TypeFieldEntry imgHeightTFE = channel.getTypeFieldEntry(PortletImage.class, "imgHeight", true);
  protected boolean isImgHeightValidated = true;
  protected int imgHeight = 0;
  public void setImgHeight(String v) {
    try {
      imgHeight = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isImgHeightValidated = false;
    }
  }
  public int getAvailableImgHeight() {
    if (theContent != null && isFieldMissing("imgHeight")) {
     int objectValue = theContent.getImgHeight();
      return objectValue;
    }
    return imgHeight;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// BNsLC9stflCWiBYojhcgkw==
