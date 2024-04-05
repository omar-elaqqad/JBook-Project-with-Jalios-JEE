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
public class EditPortletWorkflowHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletWorkflow theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletWorkflow.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletWorkflow  
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
  
    if ("queries".equals(field)) {
      return getAvailableQueries();
    }
    
    if ("maximumItemsPerWorkspace".equals(field)) {
      return getAvailableMaximumItemsPerWorkspace();
    }
    
    if ("orderBy".equals(field)) {
      return getAvailableOrderBy();
    }
    
    if ("hideWhenNoResults".equals(field)) {
      return getAvailableHideWhenNoResults();
    }
    
    if ("pageSizes".equals(field)) {
      return getAvailablePageSizes();
    }
    
    if ("pagerAllLimit".equals(field)) {
      return getAvailablePagerAllLimit();
    }
    
    if ("displayCSWorkspacePublication".equals(field)) {
      return getAvailableDisplayCSWorkspacePublication();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("orderBy".equals(field)) {
      return PortletWorkflow.getOrderByValues();
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletWorkflow.getHideWhenNoResultsValues();
    }
    if ("displayCSWorkspacePublication".equals(field)) {
      return PortletWorkflow.getDisplayCSWorkspacePublicationValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("orderBy".equals(field)) {
      return PortletWorkflow.getOrderByLabels(userLang);
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletWorkflow.getHideWhenNoResultsLabels(userLang);
    }
    if ("displayCSWorkspacePublication".equals(field)) {
      return PortletWorkflow.getDisplayCSWorkspacePublicationLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletWorkflow  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletWorkflow() {
    if (!isMaximumItemsPerWorkspaceValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maximumItemsPerWorkspace", userLang)));
      return false;
    }
    if (!isPageSizesValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "pageSizes", userLang)));
      return false;
    }
    if (!isPagerAllLimitValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "pagerAllLimit", userLang)));
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
    if (!validateCommonCreateUpdatePortletWorkflow()) {
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
    
    if (!validateCommonCreateUpdatePortletWorkflow()) {
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
    PortletWorkflow obj = (PortletWorkflow)data;
    obj.setQueries(getAvailableQueries());
    obj.setMaximumItemsPerWorkspace(getAvailableMaximumItemsPerWorkspace());
    obj.setOrderBy(getAvailableOrderBy());
    obj.setHideWhenNoResults(getAvailableHideWhenNoResults());
    obj.setPageSizes(getAvailablePageSizes());
    obj.setPagerAllLimit(getAvailablePagerAllLimit());
    obj.setDisplayCSWorkspacePublication(getAvailableDisplayCSWorkspacePublication());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletWorkflow) {
      super.setId(v);
      theContent = (PortletWorkflow)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // queries
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry queriesTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "queries", true);
  protected String[] queries = new String[0];
  protected int queriesAddCount = 0;
  public void setQueries(String[] v) {
    queries = getMonolingualValueArray(queriesTFE, v);
  }
  
  public String[] getAvailableQueries() {
    if (theContent != null && isFieldMissing("queries")) {
	  String[] objectValue = theContent.getQueries();
      if (objectValue == null) {
        return queries;
      }
      return objectValue;
    }
    return queries;
  }
  
    
  
  public void setQueriesAddCount(int  v) {
    queriesAddCount = v;
  }
  
  public int getQueriesCount() {
    int arraySize = Util.getSize(getAvailableQueries());
    int res = 3 + arraySize + queriesAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // maximumItemsPerWorkspace
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry maximumItemsPerWorkspaceTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "maximumItemsPerWorkspace", true);
  protected boolean isMaximumItemsPerWorkspaceValidated = true;
  protected int maximumItemsPerWorkspace = 0;
  public void setMaximumItemsPerWorkspace(String v) {
    try {
      maximumItemsPerWorkspace = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaximumItemsPerWorkspaceValidated = false;
    }
  }
  public int getAvailableMaximumItemsPerWorkspace() {
    if (theContent != null && isFieldMissing("maximumItemsPerWorkspace")) {
     int objectValue = theContent.getMaximumItemsPerWorkspace();
      return objectValue;
    }
    return maximumItemsPerWorkspace;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // orderBy
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry orderByTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "orderBy", true);
  protected String orderBy = "udate";
  public void setOrderBy(String[] v) {
    orderBy = getMonolingualValue(orderByTFE, v);
  }
  public String getAvailableOrderBy() {
    if (theContent != null && isFieldMissing("orderBy")) {
     String objectValue = theContent.getOrderBy();
      return objectValue;
    }
    return orderBy;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry hideWhenNoResultsTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "hideWhenNoResults", true);
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
  // pageSizes
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pageSizesTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "pageSizes", true);
  protected boolean isPageSizesValidated = true;
  protected int[] pageSizes = new int[0];
  protected int pageSizesAddCount = 0;
  public void setPageSizes(String[] v) {
    try {
      v = Util.trimStringArray(v);
      pageSizes = new int[v.length];
      for(int i = 0; i < v.length; i++) {
        if (Util.isEmpty(v[i])) { continue; }
        pageSizes[i] = Integer.parseInt(v[i].trim());
      }
    } catch(NumberFormatException ex) {
      isPageSizesValidated = false;
    }
  }
  public int[] getAvailablePageSizes() {
    if (theContent != null && isFieldMissing("pageSizes")) {
	  int[] objectValue = theContent.getPageSizes();
      if (objectValue == null) {
        return pageSizes;
      }
      return objectValue;
    }
    return pageSizes;
  }
  
    
  
  public void setPageSizesAddCount(int  v) {
    pageSizesAddCount = v;
  }
  
  public int getPageSizesCount() {
    int arraySize = Util.getSize(getAvailablePageSizes());
    int res = 3 + arraySize + pageSizesAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // pagerAllLimit
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pagerAllLimitTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "pagerAllLimit", true);
  protected boolean isPagerAllLimitValidated = true;
  protected int pagerAllLimit = -1;
  public void setPagerAllLimit(String v) {
    try {
      pagerAllLimit = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isPagerAllLimitValidated = false;
    }
  }
  public int getAvailablePagerAllLimit() {
    if (theContent != null && isFieldMissing("pagerAllLimit")) {
     int objectValue = theContent.getPagerAllLimit();
      return objectValue;
    }
    return pagerAllLimit;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayCSWorkspacePublication
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayCSWorkspacePublicationTFE = channel.getTypeFieldEntry(PortletWorkflow.class, "displayCSWorkspacePublication", true);
  protected boolean displayCSWorkspacePublication = true;
  public void setDisplayCSWorkspacePublication(boolean  v) {
    this.displayCSWorkspacePublication = v;
  }
  
  public boolean getAvailableDisplayCSWorkspacePublication() {
    if (theContent != null && isFieldMissing("displayCSWorkspacePublication")) {
     boolean objectValue = theContent.getDisplayCSWorkspacePublication();
      return objectValue;
    }
    return displayCSWorkspacePublication;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// lKe+SWH4ybnFQzA4dkLJxA==
