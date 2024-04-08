// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
@SuppressWarnings({"unchecked", "unused"})
public class EditMediaHandler extends com.jalios.jcms.media.EditAbstractMediaHandler {

  protected Media theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return Media.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpMedia
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

    if ("mediaWidth".equals(field)) {
      return getAvailableMediaWidth();
    }

    if ("mediaHeight".equals(field)) {
      return getAvailableMediaHeight();
    }

    if ("mediaDuration".equals(field)) {
      return getAvailableMediaDuration();
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
  // validateCommonCreateUpdateMedia
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateMedia() {
    if (!isMediaWidthValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "mediaWidth", userLang)));
      return false;
    }
    if (!isMediaHeightValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "mediaHeight", userLang)));
      return false;
    }
    if (!isMediaDurationValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "mediaDuration", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateMedia()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateMedia()) {
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
    Media obj = (Media)data;
    obj.setMediaWidth(getAvailableMediaWidth());
    obj.setMediaHeight(getAvailableMediaHeight());
    obj.setMediaDuration(getAvailableMediaDuration());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof Media) {
      super.setId(v);
      theContent = (Media)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // mediaWidth
  // ----------------------------------------------------------------------
  protected TypeFieldEntry mediaWidthTFE = channel.getTypeFieldEntry(Media.class, "mediaWidth", true);
  protected boolean isMediaWidthValidated = true;
  protected long mediaWidth = -1;
  public void setMediaWidth(String v) {
    try {
      mediaWidth = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMediaWidthValidated = false;
    }
  }
  public long getAvailableMediaWidth() {
    if (theContent != null && isFieldMissing("mediaWidth")) {
     long objectValue = theContent.getMediaWidth();
      return objectValue;
    }
    return mediaWidth;
  }




  // ----------------------------------------------------------------------
  // mediaHeight
  // ----------------------------------------------------------------------
  protected TypeFieldEntry mediaHeightTFE = channel.getTypeFieldEntry(Media.class, "mediaHeight", true);
  protected boolean isMediaHeightValidated = true;
  protected long mediaHeight = -1;
  public void setMediaHeight(String v) {
    try {
      mediaHeight = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMediaHeightValidated = false;
    }
  }
  public long getAvailableMediaHeight() {
    if (theContent != null && isFieldMissing("mediaHeight")) {
     long objectValue = theContent.getMediaHeight();
      return objectValue;
    }
    return mediaHeight;
  }




  // ----------------------------------------------------------------------
  // mediaDuration
  // ----------------------------------------------------------------------
  protected TypeFieldEntry mediaDurationTFE = channel.getTypeFieldEntry(Media.class, "mediaDuration", true);
  protected boolean isMediaDurationValidated = true;
  protected long mediaDuration = -1;
  public void setMediaDuration(String v) {
    try {
      mediaDuration = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isMediaDurationValidated = false;
    }
  }
  public long getAvailableMediaDuration() {
    if (theContent != null && isFieldMissing("mediaDuration")) {
     long objectValue = theContent.getMediaDuration();
      return objectValue;
    }
    return mediaDuration;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 8dYAB/BgF6pIBTcbHoH7ZA==
