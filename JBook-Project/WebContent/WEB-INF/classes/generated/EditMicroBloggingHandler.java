// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditMicroBloggingHandler extends com.jalios.jcmsplugin.esn.EditAbstractMicroBloggingHandler {

  protected MicroBlogging theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return MicroBlogging.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpMicroBlogging
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

    if ("text".equals(field)) {
      return getAvailableText();
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
  // validateCommonCreateUpdateMicroBlogging
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateMicroBlogging() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateMicroBlogging()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateMicroBlogging()) {
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
    MicroBlogging obj = (MicroBlogging)data;
    obj.setText(getAvailableText());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof MicroBlogging) {
      super.setId(v);
      theContent = (MicroBlogging)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // text
  // ----------------------------------------------------------------------
  protected TypeFieldEntry textTFE = channel.getTypeFieldEntry(MicroBlogging.class, "text", true);
  protected String text = channel.getTypeFieldEntry(MicroBlogging.class, "text", true).getDefaultTextString();
  public void setText(String[] v) {
    text = getMonolingualValue(textTFE, v);
  }
  public String getAvailableText() {
    if (theContent != null && isFieldMissing("text")) {
     String objectValue = theContent.getText();
      return objectValue;
    }
    return text;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 1es+YLKDA3jhfnmdZNthHA==
