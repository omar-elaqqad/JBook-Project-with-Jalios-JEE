// This file has been automatically generated.
package generated;


import java.util.HashSet;
import java.util.Set;

import com.jalios.jcms.Category;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletCollaborativeSpaceSuggestionHandler extends EditAbstractPortletSkinableHandler {

  protected PortletCollaborativeSpaceSuggestion theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletCollaborativeSpaceSuggestion.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletCollaborativeSpaceSuggestion
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

    if ("typology".equals(field)) {
      return getTypologyCatSet();
    }

    if ("threshold".equals(field)) {
      return getAvailableThreshold();
    }

    if ("maxItems".equals(field)) {
      return getAvailableMaxItems();
    }

    if ("hideWhenNoResults".equals(field)) {
      return getAvailableHideWhenNoResults();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("hideWhenNoResults".equals(field)) {
      return PortletCollaborativeSpaceSuggestion.getHideWhenNoResultsValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("hideWhenNoResults".equals(field)) {
      return PortletCollaborativeSpaceSuggestion.getHideWhenNoResultsLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletCollaborativeSpaceSuggestion
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletCollaborativeSpaceSuggestion() {
    if (!isThresholdValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "threshold", userLang)));
      return false;
    }
    if (!isMaxItemsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxItems", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletCollaborativeSpaceSuggestion()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletCollaborativeSpaceSuggestion()) {
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
    PortletCollaborativeSpaceSuggestion obj = (PortletCollaborativeSpaceSuggestion)data;
    obj.setThreshold(getAvailableThreshold());
    obj.setMaxItems(getAvailableMaxItems());
    obj.setHideWhenNoResults(getAvailableHideWhenNoResults());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletCollaborativeSpaceSuggestion) {
      super.setId(v);
      theContent = (PortletCollaborativeSpaceSuggestion)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // threshold
  // ----------------------------------------------------------------------
  protected TypeFieldEntry thresholdTFE = channel.getTypeFieldEntry(PortletCollaborativeSpaceSuggestion.class, "threshold", true);
  protected boolean isThresholdValidated = true;
  protected int threshold = 1;
  public void setThreshold(String v) {
    try {
      threshold = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isThresholdValidated = false;
    }
  }
  public int getAvailableThreshold() {
    if (theContent != null && isFieldMissing("threshold")) {
     int objectValue = theContent.getThreshold();
      return objectValue;
    }
    return threshold;
  }




  // ----------------------------------------------------------------------
  // maxItems
  // ----------------------------------------------------------------------
  protected TypeFieldEntry maxItemsTFE = channel.getTypeFieldEntry(PortletCollaborativeSpaceSuggestion.class, "maxItems", true);
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
  // hideWhenNoResults
  // ----------------------------------------------------------------------
  protected TypeFieldEntry hideWhenNoResultsTFE = channel.getTypeFieldEntry(PortletCollaborativeSpaceSuggestion.class, "hideWhenNoResults", true);
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




  public void setTypology(String[] v) {
    updateCids(v);
  }
  public Category getTypologyRoot() {
    return channel.getCategory("$id.jcmsplugin.collaborativespace.typology-root");
  }

  public Set<Category> getTypologyCatSet() {
    Category rootCat = getTypologyRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }




}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// JKNh6f35YhCQU+2xrKShHQ==
