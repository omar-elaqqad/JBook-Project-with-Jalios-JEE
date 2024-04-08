// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletNotificationHandler extends EditAbstractPortletSkinableHandler {

  protected PortletNotification theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletNotification.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletNotification
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

    if ("maxResults".equals(field)) {
      return getAvailableMaxResults();
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
  // validateCommonCreateUpdatePortletNotification
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletNotification() {
    if (!isMaxResultsValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "maxResults", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletNotification()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletNotification()) {
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
    PortletNotification obj = (PortletNotification)data;
    obj.setMaxResults(getAvailableMaxResults());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletNotification) {
      super.setId(v);
      theContent = (PortletNotification)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------
  protected TypeFieldEntry maxResultsTFE = channel.getTypeFieldEntry(PortletNotification.class, "maxResults", true);
  protected boolean isMaxResultsValidated = true;
  protected int maxResults = 10;
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






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 5pDDlClePOxuTSqM9eHuWA==
