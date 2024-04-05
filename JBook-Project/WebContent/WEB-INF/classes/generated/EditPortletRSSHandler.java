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
public class EditPortletRSSHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletRSS theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletRSS.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletRSS  
  // ----------------------------------------------------------------------
  
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
      return getAvailableSource();
    }
    
    if ("showTitle".equals(field)) {
      return getAvailableShowTitle();
    }
    
    if ("showDescription".equals(field)) {
      return getAvailableShowDescription();
    }
    
    if ("showImage".equals(field)) {
      return getAvailableShowImage();
    }
    
    if ("showWebMastersEmail".equals(field)) {
      return getAvailableShowWebMastersEmail();
    }
    
    if ("showItemsDescription".equals(field)) {
      return getAvailableShowItemsDescription();
    }
    
    if ("openLinksInNewWindow".equals(field)) {
      return getAvailableOpenLinksInNewWindow();
    }
    
    if ("trackingEnabled".equals(field)) {
      return getAvailableTrackingEnabled();
    }
    
    if ("refresh".equals(field)) {
      return getAvailableRefresh();
    }
    
    if ("maxItems".equals(field)) {
      return getAvailableMaxItems();
    }
    
    if ("skipFirstItems".equals(field)) {
      return getAvailableSkipFirstItems();
    }
    
    if ("sortAttribute".equals(field)) {
      return getAvailableSortAttribute();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("showTitle".equals(field)) {
      return PortletRSS.getShowTitleValues();
    }
    if ("showDescription".equals(field)) {
      return PortletRSS.getShowDescriptionValues();
    }
    if ("showImage".equals(field)) {
      return PortletRSS.getShowImageValues();
    }
    if ("showWebMastersEmail".equals(field)) {
      return PortletRSS.getShowWebMastersEmailValues();
    }
    if ("showItemsDescription".equals(field)) {
      return PortletRSS.getShowItemsDescriptionValues();
    }
    if ("openLinksInNewWindow".equals(field)) {
      return PortletRSS.getOpenLinksInNewWindowValues();
    }
    if ("trackingEnabled".equals(field)) {
      return PortletRSS.getTrackingEnabledValues();
    }
    if ("sortAttribute".equals(field)) {
      return PortletRSS.getSortAttributeValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("showTitle".equals(field)) {
      return PortletRSS.getShowTitleLabels(userLang);
    }
    if ("showDescription".equals(field)) {
      return PortletRSS.getShowDescriptionLabels(userLang);
    }
    if ("showImage".equals(field)) {
      return PortletRSS.getShowImageLabels(userLang);
    }
    if ("showWebMastersEmail".equals(field)) {
      return PortletRSS.getShowWebMastersEmailLabels(userLang);
    }
    if ("showItemsDescription".equals(field)) {
      return PortletRSS.getShowItemsDescriptionLabels(userLang);
    }
    if ("openLinksInNewWindow".equals(field)) {
      return PortletRSS.getOpenLinksInNewWindowLabels(userLang);
    }
    if ("trackingEnabled".equals(field)) {
      return PortletRSS.getTrackingEnabledLabels(userLang);
    }
    if ("sortAttribute".equals(field)) {
      return PortletRSS.getSortAttributeLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletRSS  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletRSS() {
    if (!isRefreshValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "refresh", userLang)));
      return false;
    }
    if (!isMaxItemsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxItems", userLang)));
      return false;
    }
    if (!isSkipFirstItemsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "skipFirstItems", userLang)));
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
    if (!validateCommonCreateUpdatePortletRSS()) {
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
    
    if (!validateCommonCreateUpdatePortletRSS()) {
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
    PortletRSS obj = (PortletRSS)data;
    obj.setSource(getAvailableSource());
    obj.setShowTitle(getAvailableShowTitle());
    obj.setShowDescription(getAvailableShowDescription());
    obj.setShowImage(getAvailableShowImage());
    obj.setShowWebMastersEmail(getAvailableShowWebMastersEmail());
    obj.setShowItemsDescription(getAvailableShowItemsDescription());
    obj.setOpenLinksInNewWindow(getAvailableOpenLinksInNewWindow());
    obj.setTrackingEnabled(getAvailableTrackingEnabled());
    obj.setRefresh(getAvailableRefresh());
    obj.setMaxItems(getAvailableMaxItems());
    obj.setSkipFirstItems(getAvailableSkipFirstItems());
    obj.setSortAttribute(getAvailableSortAttribute());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletRSS) {
      super.setId(v);
      theContent = (PortletRSS)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // source
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry sourceTFE = channel.getTypeFieldEntry(PortletRSS.class, "source", true);
  protected String source = channel.getTypeFieldEntry(PortletRSS.class, "source", true).getDefaultTextString();
  public void setSource(String[] v) {
    source = getMonolingualValue(sourceTFE, v);
  }
  public String getAvailableSource() {
    if (theContent != null && isFieldMissing("source")) {
     String objectValue = theContent.getSource();
      return objectValue;
    }
    return source;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showTitle
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showTitleTFE = channel.getTypeFieldEntry(PortletRSS.class, "showTitle", true);
  protected boolean showTitle = true;
  public void setShowTitle(boolean  v) {
    this.showTitle = v;
  }
  
  public boolean getAvailableShowTitle() {
    if (theContent != null && isFieldMissing("showTitle")) {
     boolean objectValue = theContent.getShowTitle();
      return objectValue;
    }
    return showTitle;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showDescription
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showDescriptionTFE = channel.getTypeFieldEntry(PortletRSS.class, "showDescription", true);
  protected boolean showDescription = true;
  public void setShowDescription(boolean  v) {
    this.showDescription = v;
  }
  
  public boolean getAvailableShowDescription() {
    if (theContent != null && isFieldMissing("showDescription")) {
     boolean objectValue = theContent.getShowDescription();
      return objectValue;
    }
    return showDescription;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showImage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showImageTFE = channel.getTypeFieldEntry(PortletRSS.class, "showImage", true);
  protected boolean showImage = true;
  public void setShowImage(boolean  v) {
    this.showImage = v;
  }
  
  public boolean getAvailableShowImage() {
    if (theContent != null && isFieldMissing("showImage")) {
     boolean objectValue = theContent.getShowImage();
      return objectValue;
    }
    return showImage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showWebMastersEmail
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showWebMastersEmailTFE = channel.getTypeFieldEntry(PortletRSS.class, "showWebMastersEmail", true);
  protected boolean showWebMastersEmail = false;
  public void setShowWebMastersEmail(boolean  v) {
    this.showWebMastersEmail = v;
  }
  
  public boolean getAvailableShowWebMastersEmail() {
    if (theContent != null && isFieldMissing("showWebMastersEmail")) {
     boolean objectValue = theContent.getShowWebMastersEmail();
      return objectValue;
    }
    return showWebMastersEmail;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showItemsDescription
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showItemsDescriptionTFE = channel.getTypeFieldEntry(PortletRSS.class, "showItemsDescription", true);
  protected boolean showItemsDescription = true;
  public void setShowItemsDescription(boolean  v) {
    this.showItemsDescription = v;
  }
  
  public boolean getAvailableShowItemsDescription() {
    if (theContent != null && isFieldMissing("showItemsDescription")) {
     boolean objectValue = theContent.getShowItemsDescription();
      return objectValue;
    }
    return showItemsDescription;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // openLinksInNewWindow
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry openLinksInNewWindowTFE = channel.getTypeFieldEntry(PortletRSS.class, "openLinksInNewWindow", true);
  protected boolean openLinksInNewWindow = false;
  public void setOpenLinksInNewWindow(boolean  v) {
    this.openLinksInNewWindow = v;
  }
  
  public boolean getAvailableOpenLinksInNewWindow() {
    if (theContent != null && isFieldMissing("openLinksInNewWindow")) {
     boolean objectValue = theContent.getOpenLinksInNewWindow();
      return objectValue;
    }
    return openLinksInNewWindow;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // trackingEnabled
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry trackingEnabledTFE = channel.getTypeFieldEntry(PortletRSS.class, "trackingEnabled", true);
  protected boolean trackingEnabled = false;
  public void setTrackingEnabled(boolean  v) {
    this.trackingEnabled = v;
  }
  
  public boolean getAvailableTrackingEnabled() {
    if (theContent != null && isFieldMissing("trackingEnabled")) {
     boolean objectValue = theContent.getTrackingEnabled();
      return objectValue;
    }
    return trackingEnabled;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // refresh
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry refreshTFE = channel.getTypeFieldEntry(PortletRSS.class, "refresh", true);
  protected boolean isRefreshValidated = true;
  protected long refresh = 86400;
  public void setRefresh(String v) {
    try {
      refresh = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      isRefreshValidated = false;
    }
  }
  
  public long getAvailableRefresh() {
    if (theContent != null && isFieldMissing("refresh")) {
     long objectValue = theContent.getRefresh();
      return objectValue;
    }
    return refresh;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // maxItems
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry maxItemsTFE = channel.getTypeFieldEntry(PortletRSS.class, "maxItems", true);
  protected boolean isMaxItemsValidated = true;
  protected int maxItems = 10;
  public void setMaxItems(String v) {
    try {
      maxItems = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaxItemsValidated = false;
    }
  }
  public int getAvailableMaxItems() {
    if (theContent != null && isFieldMissing("maxItems")) {
     int objectValue = theContent.getMaxItems();
      return objectValue;
    }
    return maxItems;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skipFirstItems
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skipFirstItemsTFE = channel.getTypeFieldEntry(PortletRSS.class, "skipFirstItems", true);
  protected boolean isSkipFirstItemsValidated = true;
  protected int skipFirstItems = 0;
  public void setSkipFirstItems(String v) {
    try {
      skipFirstItems = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isSkipFirstItemsValidated = false;
    }
  }
  public int getAvailableSkipFirstItems() {
    if (theContent != null && isFieldMissing("skipFirstItems")) {
     int objectValue = theContent.getSkipFirstItems();
      return objectValue;
    }
    return skipFirstItems;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // sortAttribute
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry sortAttributeTFE = channel.getTypeFieldEntry(PortletRSS.class, "sortAttribute", true);
  protected String sortAttribute = channel.getTypeFieldEntry(PortletRSS.class, "sortAttribute", true).getDefaultTextString();
  public void setSortAttribute(String[] v) {
    sortAttribute = getMonolingualValue(sortAttributeTFE, v);
  }
  public String getAvailableSortAttribute() {
    if (theContent != null && isFieldMissing("sortAttribute")) {
     String objectValue = theContent.getSortAttribute();
      return objectValue;
    }
    return sortAttribute;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 5rkCFC8Y1+ABgoV30ltstA==
