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
public class EditPortletMyCollaborativeSpacesHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletMyCollaborativeSpaces theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletMyCollaborativeSpaces.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletMyCollaborativeSpaces  
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
  
    if ("depth".equals(field)) {
      return getAvailableDepth();
    }
    
    if ("typologyFilter".equals(field)) {
      return getAvailableTypologyFilter();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("typologyFilter".equals(field)) {
      return PortletMyCollaborativeSpaces.getTypologyFilterValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("typologyFilter".equals(field)) {
      return PortletMyCollaborativeSpaces.getTypologyFilterLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletMyCollaborativeSpaces  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletMyCollaborativeSpaces() {
    if (!isDepthValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "depth", userLang)));
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
    if (!validateCommonCreateUpdatePortletMyCollaborativeSpaces()) {
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
    
    if (!validateCommonCreateUpdatePortletMyCollaborativeSpaces()) {
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
    PortletMyCollaborativeSpaces obj = (PortletMyCollaborativeSpaces)data;
    obj.setDepth(getAvailableDepth());
    obj.setTypologyFilter(getAvailableTypologyFilter());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletMyCollaborativeSpaces) {
      super.setId(v);
      theContent = (PortletMyCollaborativeSpaces)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // depth
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry depthTFE = channel.getTypeFieldEntry(PortletMyCollaborativeSpaces.class, "depth", true);
  protected boolean isDepthValidated = true;
  protected int depth = 2;
  public void setDepth(String v) {
    try {
      depth = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isDepthValidated = false;
    }
  }
  public int getAvailableDepth() {
    if (theContent != null && isFieldMissing("depth")) {
     int objectValue = theContent.getDepth();
      return objectValue;
    }
    return depth;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // typologyFilter
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry typologyFilterTFE = channel.getTypeFieldEntry(PortletMyCollaborativeSpaces.class, "typologyFilter", true);
  protected boolean typologyFilter = true;
  public void setTypologyFilter(boolean  v) {
    this.typologyFilter = v;
  }
  
  public boolean getAvailableTypologyFilter() {
    if (theContent != null && isFieldMissing("typologyFilter")) {
     boolean objectValue = theContent.getTypologyFilter();
      return objectValue;
    }
    return typologyFilter;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 7sOTSP9MFPKCiXwH39QMrQ==
