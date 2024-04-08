// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPollHandler extends EditPublicationHandler {

  protected Poll theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return Poll.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPoll
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

    if ("image".equals(field)) {
      return getAvailableImage();
    }

    if ("options".equals(field)) {
      return getAllAvailableOptionsML();
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
  // validateCommonCreateUpdatePoll
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePoll() {
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePoll()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePoll()) {
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
    Poll obj = (Poll)data;
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setImage(getAvailableImage());
    obj.setOptions(getAvailableOptions());
    obj.setOptionsML(getAvailableOptionsML());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof Poll) {
      super.setId(v);
      theContent = (Poll)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(Poll.class, "description", true);
  protected String description = channel.getTypeFieldEntry(Poll.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(Poll.class, "description", true).getDefaultTextString())) {
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
  // image
  // ----------------------------------------------------------------------
  protected TypeFieldEntry imageTFE = channel.getTypeFieldEntry(Poll.class, "image", true);
  protected String image = channel.getTypeFieldEntry(Poll.class, "image", true).getDefaultTextString();
  public void setImage(String[] v) {
    image = getMonolingualValue(imageTFE, v);
  }
  public String getAvailableImage() {
    if (theContent != null && isFieldMissing("image")) {
     String objectValue = theContent.getImage();
      return objectValue;
    }
    return image;
  }




  // ----------------------------------------------------------------------
  // options
  // ----------------------------------------------------------------------
  protected TypeFieldEntry optionsTFE = channel.getTypeFieldEntry(Poll.class, "options", true);
  protected String[] options = new String[0];
  protected int optionsAddCount = 0;
  HashMap<String,String[]> optionsML;
  public void setOptions(String[] v) {
   options = getMultilingualMainValueArray(optionsTFE, v);
   optionsML = getMultilingualMLMapArray(optionsTFE, v);
  }
  public String[] getAvailableOptions() {
    if (theContent != null && isFieldMissing("options")) {
	  String[] objectValue = theContent.getOptions();
      if (objectValue == null) {
        return options;
      }
      return objectValue;
    }
    return options;
  }


  public HashMap<String,String[]> getAllAvailableOptionsML() {
    HashMap<String,String[]> map = Util.getHashMap(getAvailableOptionsML());
    map.put(channel.getLanguage(),getAvailableOptions(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String[]> getAvailableOptionsML() {
    if (theContent != null && isFieldMissing("options")) {
      return theContent.getOptionsML();
    }
    return optionsML;
  }
  public String[] getAvailableOptions(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (Util.notEmpty(options)) {
          return options;
      	}
      } else {
      	if (optionsML != null && Util.notEmpty(optionsML.get(lang))) {
      	  return optionsML.get(lang);
      	}
      }
      return theContent.getOptions(lang, false);
    }
    if (lang.equals(channel.getLanguage())) {
      return options;
    }
    return optionsML == null ? null : optionsML.get(lang);
  }

  public void setOptionsAddCount(int  v) {
    optionsAddCount = v;
  }

  public int getOptionsCount() {
    int arraySize = Util.getSize(getAvailableOptions());
    if (channel.isMultilingual()) {
      for (String lang : channel.getOtherLanguageList()) {
        String[] array = getAvailableOptions(lang);
        if (array != null && array.length > arraySize) {
          arraySize = array.length;
        }
      }
    }
    int res = 3 + arraySize + optionsAddCount;
    return res;
  }



}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// NHsIXmhQD3OBu49r/rt1dg==
