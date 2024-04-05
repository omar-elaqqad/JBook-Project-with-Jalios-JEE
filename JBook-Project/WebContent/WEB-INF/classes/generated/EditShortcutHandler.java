// This file has been automatically generated.
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.jcms.wysiwyg.WysiwygManager;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditShortcutHandler extends EditPublicationHandler {
   
  protected Shortcut theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return Shortcut.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpShortcut  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("pub", __pubStr, com.jalios.jcms.Publication.class);
      if (data != null) { 
        pub = (com.jalios.jcms.Publication)data;
      } else {
        isPubValidated = Util.isEmpty(__pubStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailablePub(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailablePub(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("image".equals(field)) {
      return getAllAvailableImageML();
    }
    
    if ("icon".equals(field)) {
      return getAvailableIcon();
    }
    
    if ("text".equals(field)) {
      return getAllAvailableTextML();
    }
    
    if ("link".equals(field)) {
      return getAvailableLink();
    }
    
    if ("pub".equals(field)) {
      return getAvailablePub();
    }
    
    if ("parameters".equals(field)) {
      return getAvailableParameters();
    }
    
    if ("keywords".equals(field)) {
      return getAllAvailableKeywordsML();
    }
    
    if ("openMode".equals(field)) {
      return getAvailableOpenMode();
    }
    
    if ("showInToolsPage".equals(field)) {
      return getAvailableShowInToolsPage();
    }
    
    if ("type".equals(field)) {
      return getTypeCatSet();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("openMode".equals(field)) {
      return Shortcut.getOpenModeValues();
    }
    if ("showInToolsPage".equals(field)) {
      return Shortcut.getShowInToolsPageValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("openMode".equals(field)) {
      return Shortcut.getOpenModeLabels(userLang);
    }
    if ("showInToolsPage".equals(field)) {
      return Shortcut.getShowInToolsPageLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateShortcut  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateShortcut() {
    if (!isPubValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "pub", userLang)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateShortcut()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateShortcut()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    Shortcut obj = (Shortcut)data;
    obj.setImage(getAvailableImage());
    obj.setImageML(getAvailableImageML());
    obj.setIcon(getAvailableIcon());
    obj.setText(getAvailableText());
    obj.setTextML(getAvailableTextML());
    obj.setLink(getAvailableLink());
    obj.setPub(getAvailablePub());
    obj.setParameters(getAvailableParameters());
    obj.setKeywords(getAvailableKeywords());
    obj.setKeywordsML(getAvailableKeywordsML());
    obj.setOpenMode(getAvailableOpenMode());
    obj.setShowInToolsPage(getAvailableShowInToolsPage());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Shortcut) {
      super.setId(v);
      theContent = (Shortcut)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry imageTFE = channel.getTypeFieldEntry(Shortcut.class, "image", true);
  protected String image = channel.getTypeFieldEntry(Shortcut.class, "image", true).getDefaultTextString();
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
      	if (!Util.isSameContent(image, channel.getTypeFieldEntry(Shortcut.class, "image", true).getDefaultTextString())) {
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
  // icon
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry iconTFE = channel.getTypeFieldEntry(Shortcut.class, "icon", true);
  protected String icon = channel.getTypeFieldEntry(Shortcut.class, "icon", true).getDefaultTextString();
  public void setIcon(String[] v) {
    icon = getMonolingualValue(iconTFE, v);
  }
  public String getAvailableIcon() {
    if (theContent != null && isFieldMissing("icon")) {
     String objectValue = theContent.getIcon();
      return objectValue;
    }
    return icon;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // text
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry textTFE = channel.getTypeFieldEntry(Shortcut.class, "text", true);
  protected String text = channel.getTypeFieldEntry(Shortcut.class, "text", true).getDefaultTextString();
  protected HashMap<String,String> textML = textTFE.getDefaultTextMap();
  public void setText(String[] v) {
    text = getMultilingualMainValue(textTFE, v);
    textML = getMultilingualMLMap(textTFE, v);
  }
  public String getAvailableText() {
    if (theContent != null && isFieldMissing("text")) {
     String objectValue = theContent.getText();
      return objectValue;
    }
    return text;
  }
  
    
  public HashMap<String,String> getAllAvailableTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableTextML());
    map.put(channel.getLanguage(),getAvailableText(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableTextML() {
    if (theContent != null && isFieldMissing("text")) {
      return theContent.getTextML();
    }
    return textML;
  }
  public String getAvailableText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(text, channel.getTypeFieldEntry(Shortcut.class, "text", true).getDefaultTextString())) {
          return text;
      	}
      } else {
      	if (textML != null && Util.notEmpty(textML.get(lang))) {
      	  return textML.get(lang);
      	}
      }
      return Util.getString(theContent.getText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return text;
    }
    return textML == null ? "" : Util.getString(textML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // link
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry linkTFE = channel.getTypeFieldEntry(Shortcut.class, "link", true);
  protected String link = channel.getTypeFieldEntry(Shortcut.class, "link", true).getDefaultTextString();
  public void setLink(String[] v) {
    link = getMonolingualValue(linkTFE, v);
  }
  public String getAvailableLink() {
    if (theContent != null && isFieldMissing("link")) {
     String objectValue = theContent.getLink();
      return objectValue;
    }
    return link;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // pub
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pubTFE = channel.getTypeFieldEntry(Shortcut.class, "pub", true);
  protected boolean isPubValidated = true;
  protected com.jalios.jcms.Publication pub;
  String __pubStr = null;
  public void setPub(String v) {
    __pubStr = v;
  }
  public com.jalios.jcms.Publication getAvailablePub() {
    if (theContent != null && isFieldMissing("pub")) {
     com.jalios.jcms.Publication objectValue = theContent.getPub();
      return objectValue;
    }
    return pub;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // parameters
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry parametersTFE = channel.getTypeFieldEntry(Shortcut.class, "parameters", true);
  protected String parameters = channel.getTypeFieldEntry(Shortcut.class, "parameters", true).getDefaultTextString();
  public void setParameters(String[] v) {
    parameters = getMonolingualValue(parametersTFE, v);
  }
  public String getAvailableParameters() {
    if (theContent != null && isFieldMissing("parameters")) {
     String objectValue = theContent.getParameters();
      return objectValue;
    }
    return parameters;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // keywords
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry keywordsTFE = channel.getTypeFieldEntry(Shortcut.class, "keywords", true);
  protected String keywords = channel.getTypeFieldEntry(Shortcut.class, "keywords", true).getDefaultTextString();
  protected HashMap<String,String> keywordsML = keywordsTFE.getDefaultTextMap();
  public void setKeywords(String[] v) {
    keywords = getMultilingualMainValue(keywordsTFE, v);
    keywordsML = getMultilingualMLMap(keywordsTFE, v);
  }
  public String getAvailableKeywords() {
    if (theContent != null && isFieldMissing("keywords")) {
     String objectValue = theContent.getKeywords();
      return objectValue;
    }
    return keywords;
  }
  
    
  public HashMap<String,String> getAllAvailableKeywordsML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableKeywordsML());
    map.put(channel.getLanguage(),getAvailableKeywords(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableKeywordsML() {
    if (theContent != null && isFieldMissing("keywords")) {
      return theContent.getKeywordsML();
    }
    return keywordsML;
  }
  public String getAvailableKeywords(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(keywords, channel.getTypeFieldEntry(Shortcut.class, "keywords", true).getDefaultTextString())) {
          return keywords;
      	}
      } else {
      	if (keywordsML != null && Util.notEmpty(keywordsML.get(lang))) {
      	  return keywordsML.get(lang);
      	}
      }
      return Util.getString(theContent.getKeywords(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return keywords;
    }
    return keywordsML == null ? "" : Util.getString(keywordsML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // openMode
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry openModeTFE = channel.getTypeFieldEntry(Shortcut.class, "openMode", true);
  protected String openMode = channel.getTypeFieldEntry(Shortcut.class, "openMode", true).getDefaultTextString();
  public void setOpenMode(String[] v) {
    openMode = getMonolingualValue(openModeTFE, v);
  }
  public String getAvailableOpenMode() {
    if (theContent != null && isFieldMissing("openMode")) {
     String objectValue = theContent.getOpenMode();
      return objectValue;
    }
    return openMode;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showInToolsPage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showInToolsPageTFE = channel.getTypeFieldEntry(Shortcut.class, "showInToolsPage", true);
  protected boolean showInToolsPage = true;
  public void setShowInToolsPage(boolean  v) {
    this.showInToolsPage = v;
  }
  
  public boolean getAvailableShowInToolsPage() {
    if (theContent != null && isFieldMissing("showInToolsPage")) {
     boolean objectValue = theContent.getShowInToolsPage();
      return objectValue;
    }
    return showInToolsPage;
  }
  
    
  
  
  public void setType(String[] v) {
    updateCids(v);
  }
  public Category getTypeRoot() {
    return channel.getCategory("$id.application.shortcut.category");
  }  
    
  public Set<Category> getTypeCatSet() {
    Category rootCat = getTypeRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 7qMFlJ6YTfH56iDwlmZxhA==
