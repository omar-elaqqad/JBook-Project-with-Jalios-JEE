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
public class EditPortletQueryForeachHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletQueryForeach theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletQueryForeach.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletQueryForeach  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      List<com.jalios.jcms.Content> list = processDataIds("firstPublications",__firstPublicationsStr,com.jalios.jcms.Content.class);
      this.firstPublications = (com.jalios.jcms.Content[])list.toArray(new com.jalios.jcms.Content[0]);
    }
    {
      List<com.jalios.jcms.Publication> list = processDataIds("publications",__publicationsStr,com.jalios.jcms.Publication.class);
      this.publications = (com.jalios.jcms.Publication[])list.toArray(new com.jalios.jcms.Publication[0]);
    }
    if (!validateUploadedFileDocument(getAvailableFirstPublications(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailablePublications(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableFirstPublications(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailablePublications(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("searchInDB".equals(field)) {
      return getAvailableSearchInDB();
    }
    
    if ("queries".equals(field)) {
      return getAvailableQueries();
    }
    
    if ("refineQueries".equals(field)) {
      return getAvailableRefineQueries();
    }
    
    if ("refineWithContextualCategories".equals(field)) {
      return getAvailableRefineWithContextualCategories();
    }
    
    if ("displayMode".equals(field)) {
      return getAvailableDisplayMode();
    }
    
    if ("orderBy".equals(field)) {
      return getAvailableOrderBy();
    }
    
    if ("reverseOrder".equals(field)) {
      return getAvailableReverseOrder();
    }
    
    if ("maxResults".equals(field)) {
      return getAvailableMaxResults();
    }
    
    if ("skipFirstResults".equals(field)) {
      return getAvailableSkipFirstResults();
    }
    
    if ("skipDisplayedPublications".equals(field)) {
      return getAvailableSkipDisplayedPublications();
    }
    
    if ("showPager".equals(field)) {
      return getAvailableShowPager();
    }
    
    if ("pagerLabel".equals(field)) {
      return getAllAvailablePagerLabelML();
    }
    
    if ("pageSizes".equals(field)) {
      return getAvailablePageSizes();
    }
    
    if ("pagerAllLimit".equals(field)) {
      return getAvailablePagerAllLimit();
    }
    
    if ("hideWhenNoResults".equals(field)) {
      return getAvailableHideWhenNoResults();
    }
    
    if ("firstPublications".equals(field)) {
      return getAvailableFirstPublications();
    }
    
    if ("showInCurrentPortal".equals(field)) {
      return getAvailableShowInCurrentPortal();
    }
    
    if ("contextCategory".equals(field)) {
      return getAvailableContextCategory();
    }
    
    if ("publications".equals(field)) {
      return getAvailablePublications();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("searchInDB".equals(field)) {
      return PortletQueryForeach.getSearchInDBValues();
    }
    if ("refineQueries".equals(field)) {
      return PortletQueryForeach.getRefineQueriesValues();
    }
    if ("refineWithContextualCategories".equals(field)) {
      return PortletQueryForeach.getRefineWithContextualCategoriesValues();
    }
    if ("displayMode".equals(field)) {
      return PortletQueryForeach.getDisplayModeValues();
    }
    if ("orderBy".equals(field)) {
      return PortletQueryForeach.getOrderByValues();
    }
    if ("reverseOrder".equals(field)) {
      return PortletQueryForeach.getReverseOrderValues();
    }
    if ("skipDisplayedPublications".equals(field)) {
      return PortletQueryForeach.getSkipDisplayedPublicationsValues();
    }
    if ("showPager".equals(field)) {
      return PortletQueryForeach.getShowPagerValues();
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletQueryForeach.getHideWhenNoResultsValues();
    }
    if ("showInCurrentPortal".equals(field)) {
      return PortletQueryForeach.getShowInCurrentPortalValues();
    }
    if ("contextCategory".equals(field)) {
      return PortletQueryForeach.getContextCategoryValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("searchInDB".equals(field)) {
      return PortletQueryForeach.getSearchInDBLabels(userLang);
    }
    if ("refineQueries".equals(field)) {
      return PortletQueryForeach.getRefineQueriesLabels(userLang);
    }
    if ("refineWithContextualCategories".equals(field)) {
      return PortletQueryForeach.getRefineWithContextualCategoriesLabels(userLang);
    }
    if ("displayMode".equals(field)) {
      return PortletQueryForeach.getDisplayModeLabels(userLang);
    }
    if ("orderBy".equals(field)) {
      return PortletQueryForeach.getOrderByLabels(userLang);
    }
    if ("reverseOrder".equals(field)) {
      return PortletQueryForeach.getReverseOrderLabels(userLang);
    }
    if ("skipDisplayedPublications".equals(field)) {
      return PortletQueryForeach.getSkipDisplayedPublicationsLabels(userLang);
    }
    if ("showPager".equals(field)) {
      return PortletQueryForeach.getShowPagerLabels(userLang);
    }
    if ("hideWhenNoResults".equals(field)) {
      return PortletQueryForeach.getHideWhenNoResultsLabels(userLang);
    }
    if ("showInCurrentPortal".equals(field)) {
      return PortletQueryForeach.getShowInCurrentPortalLabels(userLang);
    }
    if ("contextCategory".equals(field)) {
      return PortletQueryForeach.getContextCategoryLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletQueryForeach  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletQueryForeach() {
    if (!isMaxResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxResults", userLang)));
      return false;
    }
    if (!isSkipFirstResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "skipFirstResults", userLang)));
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
    if (!validateCommonCreateUpdatePortletQueryForeach()) {
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
    
    if (!validateCommonCreateUpdatePortletQueryForeach()) {
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
    PortletQueryForeach obj = (PortletQueryForeach)data;
    obj.setSearchInDB(getAvailableSearchInDB());
    obj.setQueries(getAvailableQueries());
    obj.setRefineQueries(getAvailableRefineQueries());
    obj.setRefineWithContextualCategories(getAvailableRefineWithContextualCategories());
    obj.setDisplayMode(getAvailableDisplayMode());
    obj.setOrderBy(getAvailableOrderBy());
    obj.setReverseOrder(getAvailableReverseOrder());
    obj.setMaxResults(getAvailableMaxResults());
    obj.setSkipFirstResults(getAvailableSkipFirstResults());
    obj.setSkipDisplayedPublications(getAvailableSkipDisplayedPublications());
    obj.setShowPager(getAvailableShowPager());
    obj.setPagerLabel(getAvailablePagerLabel());
    obj.setPagerLabelML(getAvailablePagerLabelML());
    obj.setPageSizes(getAvailablePageSizes());
    obj.setPagerAllLimit(getAvailablePagerAllLimit());
    obj.setHideWhenNoResults(getAvailableHideWhenNoResults());
    obj.setFirstPublications(getAvailableFirstPublications());
    obj.setShowInCurrentPortal(getAvailableShowInCurrentPortal());
    obj.setContextCategory(getAvailableContextCategory());
    obj.setPublications(getAvailablePublications());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletQueryForeach) {
      super.setId(v);
      theContent = (PortletQueryForeach)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // searchInDB
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry searchInDBTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "searchInDB", true);
  protected boolean searchInDB = true;
  public void setSearchInDB(boolean  v) {
    this.searchInDB = v;
  }
  
  public boolean getAvailableSearchInDB() {
    if (theContent != null && isFieldMissing("searchInDB")) {
     boolean objectValue = theContent.getSearchInDB();
      return objectValue;
    }
    return searchInDB;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // queries
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry queriesTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "queries", true);
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
  // refineQueries
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry refineQueriesTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true);
  protected String refineQueries = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getDefaultTextString();
  public void setRefineQueries(String[] v) {
    refineQueries = getMonolingualValue(refineQueriesTFE, v);
  }
  public String getAvailableRefineQueries() {
    if (theContent != null && isFieldMissing("refineQueries")) {
     String objectValue = theContent.getRefineQueries();
      return objectValue;
    }
    return refineQueries;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // refineWithContextualCategories
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry refineWithContextualCategoriesTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineWithContextualCategories", true);
  protected boolean refineWithContextualCategories = false;
  public void setRefineWithContextualCategories(boolean  v) {
    this.refineWithContextualCategories = v;
  }
  
  public boolean getAvailableRefineWithContextualCategories() {
    if (theContent != null && isFieldMissing("refineWithContextualCategories")) {
     boolean objectValue = theContent.getRefineWithContextualCategories();
      return objectValue;
    }
    return refineWithContextualCategories;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayMode
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayModeTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "displayMode", true);
  protected String displayMode = "dynamicPubList";
  public void setDisplayMode(String[] v) {
    displayMode = getMonolingualValue(displayModeTFE, v);
  }
  public String getAvailableDisplayMode() {
    if (theContent != null && isFieldMissing("displayMode")) {
     String objectValue = theContent.getDisplayMode();
      return objectValue;
    }
    return displayMode;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // orderBy
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry orderByTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true);
  protected String orderBy = "pdate";
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
  // reverseOrder
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry reverseOrderTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true);
  protected String reverseOrder = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getDefaultTextString();
  public void setReverseOrder(String[] v) {
    reverseOrder = getMonolingualValue(reverseOrderTFE, v);
  }
  public String getAvailableReverseOrder() {
    if (theContent != null && isFieldMissing("reverseOrder")) {
     String objectValue = theContent.getReverseOrder();
      return objectValue;
    }
    return reverseOrder;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry maxResultsTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "maxResults", true);
  protected boolean isMaxResultsValidated = true;
  protected int maxResults = 5;
  public void setMaxResults(String v) {
    try {
      maxResults = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMaxResultsValidated = false;
    }
  }
  public int getAvailableMaxResults() {
    if (theContent != null && isFieldMissing("maxResults")) {
     int objectValue = theContent.getMaxResults();
      return objectValue;
    }
    return maxResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skipFirstResults
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skipFirstResultsTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "skipFirstResults", true);
  protected boolean isSkipFirstResultsValidated = true;
  protected int skipFirstResults = 0;
  public void setSkipFirstResults(String v) {
    try {
      skipFirstResults = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isSkipFirstResultsValidated = false;
    }
  }
  public int getAvailableSkipFirstResults() {
    if (theContent != null && isFieldMissing("skipFirstResults")) {
     int objectValue = theContent.getSkipFirstResults();
      return objectValue;
    }
    return skipFirstResults;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skipDisplayedPublications
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skipDisplayedPublicationsTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "skipDisplayedPublications", true);
  protected boolean skipDisplayedPublications = false;
  public void setSkipDisplayedPublications(boolean  v) {
    this.skipDisplayedPublications = v;
  }
  
  public boolean getAvailableSkipDisplayedPublications() {
    if (theContent != null && isFieldMissing("skipDisplayedPublications")) {
     boolean objectValue = theContent.getSkipDisplayedPublications();
      return objectValue;
    }
    return skipDisplayedPublications;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showPager
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showPagerTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true);
  protected String showPager = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getDefaultTextString();
  public void setShowPager(String[] v) {
    showPager = getMonolingualValue(showPagerTFE, v);
  }
  public String getAvailableShowPager() {
    if (theContent != null && isFieldMissing("showPager")) {
     String objectValue = theContent.getShowPager();
      return objectValue;
    }
    return showPager;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // pagerLabel
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pagerLabelTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true);
  protected String pagerLabel = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextString();
  protected HashMap<String,String> pagerLabelML = pagerLabelTFE.getDefaultTextMap();
  public void setPagerLabel(String[] v) {
    pagerLabel = getMultilingualMainValue(pagerLabelTFE, v);
    pagerLabelML = getMultilingualMLMap(pagerLabelTFE, v);
  }
  public String getAvailablePagerLabel() {
    if (theContent != null && isFieldMissing("pagerLabel")) {
     String objectValue = theContent.getPagerLabel();
      return objectValue;
    }
    return pagerLabel;
  }
  
    
  public HashMap<String,String> getAllAvailablePagerLabelML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePagerLabelML());
    map.put(channel.getLanguage(),getAvailablePagerLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailablePagerLabelML() {
    if (theContent != null && isFieldMissing("pagerLabel")) {
      return theContent.getPagerLabelML();
    }
    return pagerLabelML;
  }
  public String getAvailablePagerLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pagerLabel, channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextString())) {
          return pagerLabel;
      	}
      } else {
      	if (pagerLabelML != null && Util.notEmpty(pagerLabelML.get(lang))) {
      	  return pagerLabelML.get(lang);
      	}
      }
      return Util.getString(theContent.getPagerLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return pagerLabel;
    }
    return pagerLabelML == null ? "" : Util.getString(pagerLabelML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // pageSizes
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pageSizesTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "pageSizes", true);
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
  protected TypeFieldEntry pagerAllLimitTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerAllLimit", true);
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
  // hideWhenNoResults
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry hideWhenNoResultsTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "hideWhenNoResults", true);
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
  // firstPublications
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry firstPublicationsTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "firstPublications", true);
  protected com.jalios.jcms.Content[] firstPublications = new com.jalios.jcms.Content[0];
  protected int firstPublicationsAddCount = 0;
  String[] __firstPublicationsStr = null;
  public void setFirstPublications(String[]  v) {
    __firstPublicationsStr = v;
  }
  public com.jalios.jcms.Content[] getAvailableFirstPublications() {
    if (theContent != null && isFieldMissing("firstPublications")) {
	  com.jalios.jcms.Content[] objectValue = theContent.getFirstPublications();
      if (objectValue == null) {
        return firstPublications;
      }
      return objectValue;
    }
    return firstPublications;
  }
  
    
  
  public void setFirstPublicationsAddCount(int  v) {
    firstPublicationsAddCount = v;
  }
  
  public int getFirstPublicationsCount() {
    int arraySize = Util.getSize(getAvailableFirstPublications());
    int res = 3 + arraySize + firstPublicationsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // showInCurrentPortal
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showInCurrentPortalTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "showInCurrentPortal", true);
  protected boolean showInCurrentPortal = false;
  public void setShowInCurrentPortal(boolean  v) {
    this.showInCurrentPortal = v;
  }
  
  public boolean getAvailableShowInCurrentPortal() {
    if (theContent != null && isFieldMissing("showInCurrentPortal")) {
     boolean objectValue = theContent.getShowInCurrentPortal();
      return objectValue;
    }
    return showInCurrentPortal;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // contextCategory
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry contextCategoryTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "contextCategory", true);
  protected boolean contextCategory = false;
  public void setContextCategory(boolean  v) {
    this.contextCategory = v;
  }
  
  public boolean getAvailableContextCategory() {
    if (theContent != null && isFieldMissing("contextCategory")) {
     boolean objectValue = theContent.getContextCategory();
      return objectValue;
    }
    return contextCategory;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // publications
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry publicationsTFE = channel.getTypeFieldEntry(PortletQueryForeach.class, "publications", true);
  protected com.jalios.jcms.Publication[] publications = new com.jalios.jcms.Publication[0];
  protected int publicationsAddCount = 0;
  String[] __publicationsStr = null;
  public void setPublications(String[]  v) {
    __publicationsStr = v;
  }
  public com.jalios.jcms.Publication[] getAvailablePublications() {
    if (theContent != null && isFieldMissing("publications")) {
	  com.jalios.jcms.Publication[] objectValue = theContent.getPublications();
      if (objectValue == null) {
        return publications;
      }
      return objectValue;
    }
    return publications;
  }
  
    
  
  public void setPublicationsAddCount(int  v) {
    publicationsAddCount = v;
  }
  
  public int getPublicationsCount() {
    int arraySize = Util.getSize(getAvailablePublications());
    int res = 3 + arraySize + publicationsAddCount;
    return res;
  }
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// m81uV823qwKpRzkzoBfFTw==
