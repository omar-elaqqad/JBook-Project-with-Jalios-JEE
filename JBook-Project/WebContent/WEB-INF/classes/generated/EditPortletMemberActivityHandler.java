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
public class EditPortletMemberActivityHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletMemberActivity theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletMemberActivity.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMemberActivity  
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
  
    if ("activityMode".equals(field)) {
      return getAvailableActivityMode();
    }
    
    if ("showAbstract".equals(field)) {
      return getAvailableShowAbstract();
    }
    
    if ("showMedia".equals(field)) {
      return getAvailableShowMedia();
    }
    
    if ("showComments".equals(field)) {
      return getAvailableShowComments();
    }
    
    if ("displayAllEvent".equals(field)) {
      return getAvailableDisplayAllEvent();
    }
    
    if ("filters".equals(field)) {
      return getAvailableFilters();
    }
    
    if ("defaultPageSize".equals(field)) {
      return getAvailableDefaultPageSize();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("activityMode".equals(field)) {
      return PortletMemberActivity.getActivityModeValues();
    }
    if ("showAbstract".equals(field)) {
      return PortletMemberActivity.getShowAbstractValues();
    }
    if ("showMedia".equals(field)) {
      return PortletMemberActivity.getShowMediaValues();
    }
    if ("showComments".equals(field)) {
      return PortletMemberActivity.getShowCommentsValues();
    }
    if ("displayAllEvent".equals(field)) {
      return PortletMemberActivity.getDisplayAllEventValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("activityMode".equals(field)) {
      return PortletMemberActivity.getActivityModeLabels(userLang);
    }
    if ("showAbstract".equals(field)) {
      return PortletMemberActivity.getShowAbstractLabels(userLang);
    }
    if ("showMedia".equals(field)) {
      return PortletMemberActivity.getShowMediaLabels(userLang);
    }
    if ("showComments".equals(field)) {
      return PortletMemberActivity.getShowCommentsLabels(userLang);
    }
    if ("displayAllEvent".equals(field)) {
      return PortletMemberActivity.getDisplayAllEventLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMemberActivity  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMemberActivity() {
    if (!isDefaultPageSizeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "defaultPageSize", userLang)));
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
    if (!validateCommonCreateUpdatePortletMemberActivity()) {
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
    
    if (!validateCommonCreateUpdatePortletMemberActivity()) {
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
    PortletMemberActivity obj = (PortletMemberActivity)data;
    obj.setActivityMode(getAvailableActivityMode());
    obj.setShowAbstract(getAvailableShowAbstract());
    obj.setShowMedia(getAvailableShowMedia());
    obj.setShowComments(getAvailableShowComments());
    obj.setDisplayAllEvent(getAvailableDisplayAllEvent());
    obj.setFilters(getAvailableFilters());
    obj.setDefaultPageSize(getAvailableDefaultPageSize());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMemberActivity) {
      super.setId(v);
      theContent = (PortletMemberActivity)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // activityMode
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry activityModeTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "activityMode", true);
  protected String activityMode = channel.getTypeFieldEntry(PortletMemberActivity.class, "activityMode", true).getDefaultTextString();
  public void setActivityMode(String[] v) {
    activityMode = getMonolingualValue(activityModeTFE, v);
  }
  public String getAvailableActivityMode() {
    if (theContent != null && isFieldMissing("activityMode")) {
     String objectValue = theContent.getActivityMode();
      return objectValue;
    }
    return activityMode;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showAbstract
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showAbstractTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "showAbstract", true);
  protected boolean showAbstract = true;
  public void setShowAbstract(boolean  v) {
    this.showAbstract = v;
  }
  
  public boolean getAvailableShowAbstract() {
    if (theContent != null && isFieldMissing("showAbstract")) {
     boolean objectValue = theContent.getShowAbstract();
      return objectValue;
    }
    return showAbstract;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showMedia
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showMediaTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "showMedia", true);
  protected boolean showMedia = true;
  public void setShowMedia(boolean  v) {
    this.showMedia = v;
  }
  
  public boolean getAvailableShowMedia() {
    if (theContent != null && isFieldMissing("showMedia")) {
     boolean objectValue = theContent.getShowMedia();
      return objectValue;
    }
    return showMedia;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showComments
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showCommentsTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "showComments", true);
  protected boolean showComments = true;
  public void setShowComments(boolean  v) {
    this.showComments = v;
  }
  
  public boolean getAvailableShowComments() {
    if (theContent != null && isFieldMissing("showComments")) {
     boolean objectValue = theContent.getShowComments();
      return objectValue;
    }
    return showComments;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayAllEvent
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayAllEventTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "displayAllEvent", true);
  protected boolean displayAllEvent = true;
  public void setDisplayAllEvent(boolean  v) {
    this.displayAllEvent = v;
  }
  
  public boolean getAvailableDisplayAllEvent() {
    if (theContent != null && isFieldMissing("displayAllEvent")) {
     boolean objectValue = theContent.getDisplayAllEvent();
      return objectValue;
    }
    return displayAllEvent;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // filters
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry filtersTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "filters", true);
  protected String filters = channel.getTypeFieldEntry(PortletMemberActivity.class, "filters", true).getDefaultTextString();
  public void setFilters(String[] v) {
    filters = getMonolingualValue(filtersTFE, v);
  }
  public String getAvailableFilters() {
    if (theContent != null && isFieldMissing("filters")) {
     String objectValue = theContent.getFilters();
      return objectValue;
    }
    return filters;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // defaultPageSize
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry defaultPageSizeTFE = channel.getTypeFieldEntry(PortletMemberActivity.class, "defaultPageSize", true);
  protected boolean isDefaultPageSizeValidated = true;
  protected int defaultPageSize = 10;
  public void setDefaultPageSize(String v) {
    try {
      defaultPageSize = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isDefaultPageSizeValidated = false;
    }
  }
  public int getAvailableDefaultPageSize() {
    if (theContent != null && isFieldMissing("defaultPageSize")) {
     int objectValue = theContent.getDefaultPageSize();
      return objectValue;
    }
    return defaultPageSize;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 7ukgECwWA2IH7ah1wRsgiA==
