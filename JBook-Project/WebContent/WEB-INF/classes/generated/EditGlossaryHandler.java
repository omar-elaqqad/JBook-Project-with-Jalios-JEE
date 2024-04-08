// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditGlossaryHandler extends EditPublicationHandler {

  protected Glossary theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return Glossary.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpGlossary
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

    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }

    if ("displayFirstLetter".equals(field)) {
      return getAvailableDisplayFirstLetter();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("displayFirstLetter".equals(field)) {
      return Glossary.getDisplayFirstLetterValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("displayFirstLetter".equals(field)) {
      return Glossary.getDisplayFirstLetterLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateGlossary
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGlossary() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateGlossary()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateGlossary()) {
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
    Glossary obj = (Glossary)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setDisplayFirstLetter(getAvailableDisplayFirstLetter());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof Glossary) {
      super.setId(v);
      theContent = (Glossary)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(Glossary.class, "description", true);
  protected String description = channel.getTypeFieldEntry(Glossary.class, "description", true).getDefaultTextString();
  protected HashMap<String,String> descriptionML = descriptionTFE.getDefaultTextMap();
  public void setDescription(String[] v) {
    description = getMultilingualMainValue(descriptionTFE, v);
    descriptionML = getMultilingualMLMap(descriptionTFE, v);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }


  public HashMap<String,String> getAllAvailableDescriptionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(Glossary.class, "description", true).getDefaultTextString())) {
          return description;
      	}
      } else {
      	if (descriptionML != null && Util.notEmpty(descriptionML.get(lang))) {
      	  return descriptionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDescription(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return description;
    }
    return descriptionML == null ? "" : Util.getString(descriptionML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // displayFirstLetter
  // ----------------------------------------------------------------------
  protected TypeFieldEntry displayFirstLetterTFE = channel.getTypeFieldEntry(Glossary.class, "displayFirstLetter", true);
  protected boolean displayFirstLetter = true;
  public void setDisplayFirstLetter(boolean  v) {
    this.displayFirstLetter = v;
  }

  public boolean getAvailableDisplayFirstLetter() {
    if (theContent != null && isFieldMissing("displayFirstLetter")) {
     boolean objectValue = theContent.getDisplayFirstLetter();
      return objectValue;
    }
    return displayFirstLetter;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// ivSndAuMiiOJgBcZnPwAOQ==
