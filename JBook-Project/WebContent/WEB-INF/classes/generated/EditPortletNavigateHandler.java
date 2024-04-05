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
public class EditPortletNavigateHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletNavigate theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletNavigate.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletNavigate  
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
  
    if ("rootCategory".equals(field)) {
      return getRootCategoryCatSet();
    }
    
    if ("refineCategory".equals(field)) {
      return getAvailableRefineCategory();
    }
    
    if ("levels".equals(field)) {
      return getAvailableLevels();
    }
    
    if ("hideWhenNoResults".equals(field)) {
      return getAvailableHideWhenNoResults();
    }
    
    if ("navigatePortlet".equals(field)) {
      return getAvailableNavigatePortlet();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("refineCategory".equals(field)) {
      return PortletNavigate.getRefineCategoryValues();
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletNavigate.getHideWhenNoResultsValues();
    }
    if ("navigatePortlet".equals(field)) {
      return PortletNavigate.getNavigatePortletValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("refineCategory".equals(field)) {
      return PortletNavigate.getRefineCategoryLabels(userLang);
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletNavigate.getHideWhenNoResultsLabels(userLang);
    }
    if ("navigatePortlet".equals(field)) {
      return PortletNavigate.getNavigatePortletLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletNavigate  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletNavigate() {
    if (!isLevelsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "levels", userLang)));
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
    if (!validateCommonCreateUpdatePortletNavigate()) {
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
    
    if (!validateCommonCreateUpdatePortletNavigate()) {
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
    PortletNavigate obj = (PortletNavigate)data;
    obj.setRefineCategory(getAvailableRefineCategory());
    obj.setLevels(getAvailableLevels());
    obj.setHideWhenNoResults(getAvailableHideWhenNoResults());
    obj.setNavigatePortlet(getAvailableNavigatePortlet());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletNavigate) {
      super.setId(v);
      theContent = (PortletNavigate)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // refineCategory
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry refineCategoryTFE = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true);
  protected String refineCategory = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getDefaultTextString();
  public void setRefineCategory(String[] v) {
    refineCategory = getMonolingualValue(refineCategoryTFE, v);
  }
  public String getAvailableRefineCategory() {
    if (theContent != null && isFieldMissing("refineCategory")) {
     String objectValue = theContent.getRefineCategory();
      return objectValue;
    }
    return refineCategory;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // levels
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry levelsTFE = channel.getTypeFieldEntry(PortletNavigate.class, "levels", true);
  protected boolean isLevelsValidated = true;
  protected int levels = 1;
  public void setLevels(String v) {
    try {
      levels = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isLevelsValidated = false;
    }
  }
  public int getAvailableLevels() {
    if (theContent != null && isFieldMissing("levels")) {
     int objectValue = theContent.getLevels();
      return objectValue;
    }
    return levels;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry hideWhenNoResultsTFE = channel.getTypeFieldEntry(PortletNavigate.class, "hideWhenNoResults", true);
  protected boolean hideWhenNoResults = false;
  public void setHideWhenNoResults(boolean  v) {
    this.hideWhenNoResults = v;
  }
  
  public boolean getAvailableHideWhenNoResults() {
    if (theContent != null && isFieldMissing("hideWhenNoResults")) {
     boolean objectValue = theContent.getHideWhenNoResults();
      return objectValue;
    }
    return hideWhenNoResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // navigatePortlet
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry navigatePortletTFE = channel.getTypeFieldEntry(PortletNavigate.class, "navigatePortlet", true);
  protected boolean navigatePortlet = true;
  public void setNavigatePortlet(boolean  v) {
    this.navigatePortlet = v;
  }
  
  public boolean getAvailableNavigatePortlet() {
    if (theContent != null && isFieldMissing("navigatePortlet")) {
     boolean objectValue = theContent.getNavigatePortlet();
      return objectValue;
    }
    return navigatePortlet;
  }
  
    
  
  
  public void setRootCategory(String[] v) {
    updateCids(v);
  }
  public Category getRootCategoryRoot() {
    return channel.getCategory("j_3");
  }  
    
  public Set<Category> getRootCategoryCatSet() {
    Category rootCat = getRootCategoryRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// xKVaHoEa+d7ObF2qcl3HQA==
