// This file has been automatically generated.
package generated;


import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletColumnHandler extends EditAbstractCollectionHandler {

  protected PortletColumn theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletColumn.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletColumn
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

    if ("colSpacing".equals(field)) {
      return getAvailableColSpacing();
    }

    if ("alignHorizontal".equals(field)) {
      return getAvailableAlignHorizontal();
    }

    if ("alignVertical".equals(field)) {
      return getAvailableAlignVertical();
    }

    if ("backgroundColor".equals(field)) {
      return getAvailableBackgroundColor();
    }

    if ("backgroundImage".equals(field)) {
      return getAvailableBackgroundImage();
    }

    if ("backgroundRepeat".equals(field)) {
      return getAvailableBackgroundRepeat();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("alignHorizontal".equals(field)) {
      return PortletColumn.getAlignHorizontalValues();
    }
    if ("alignVertical".equals(field)) {
      return PortletColumn.getAlignVerticalValues();
    }
    if ("backgroundRepeat".equals(field)) {
      return PortletColumn.getBackgroundRepeatValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("alignHorizontal".equals(field)) {
      return PortletColumn.getAlignHorizontalLabels(userLang);
    }
    if ("alignVertical".equals(field)) {
      return PortletColumn.getAlignVerticalLabels(userLang);
    }
    if ("backgroundRepeat".equals(field)) {
      return PortletColumn.getBackgroundRepeatLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletColumn
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletColumn() {
    if (!isColSpacingValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "colSpacing", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletColumn()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletColumn()) {
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
    PortletColumn obj = (PortletColumn)data;
    obj.setColSpacing(getAvailableColSpacing());
    obj.setAlignHorizontal(getAvailableAlignHorizontal());
    obj.setAlignVertical(getAvailableAlignVertical());
    obj.setBackgroundColor(getAvailableBackgroundColor());
    obj.setBackgroundImage(getAvailableBackgroundImage());
    obj.setBackgroundRepeat(getAvailableBackgroundRepeat());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletColumn) {
      super.setId(v);
      theContent = (PortletColumn)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // colSpacing
  // ----------------------------------------------------------------------
  protected TypeFieldEntry colSpacingTFE = channel.getTypeFieldEntry(PortletColumn.class, "colSpacing", true);
  protected boolean isColSpacingValidated = true;
  protected int colSpacing = 0;
  public void setColSpacing(String v) {
    try {
      colSpacing = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isColSpacingValidated = false;
    }
  }
  public int getAvailableColSpacing() {
    if (theContent != null && isFieldMissing("colSpacing")) {
     int objectValue = theContent.getColSpacing();
      return objectValue;
    }
    return colSpacing;
  }




  // ----------------------------------------------------------------------
  // alignHorizontal
  // ----------------------------------------------------------------------
  protected TypeFieldEntry alignHorizontalTFE = channel.getTypeFieldEntry(PortletColumn.class, "alignHorizontal", true);
  protected String[] alignHorizontal = new String[0];
  protected int alignHorizontalAddCount = 0;
  public void setAlignHorizontal(String[] v) {
    alignHorizontal = getMonolingualValueArray(alignHorizontalTFE, v);
  }

  public String[] getAvailableAlignHorizontal() {
    if (theContent != null && isFieldMissing("alignHorizontal")) {
	  String[] objectValue = theContent.getAlignHorizontal();
      if (objectValue == null) {
        return alignHorizontal;
      }
      return objectValue;
    }
    return alignHorizontal;
  }



  public void setAlignHorizontalAddCount(int  v) {
    alignHorizontalAddCount = v;
  }

  public int getAlignHorizontalCount() {
    int arraySize = Util.getSize(getAvailableAlignHorizontal());
    int res = 3 + arraySize + alignHorizontalAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // alignVertical
  // ----------------------------------------------------------------------
  protected TypeFieldEntry alignVerticalTFE = channel.getTypeFieldEntry(PortletColumn.class, "alignVertical", true);
  protected String[] alignVertical = new String[0];
  protected int alignVerticalAddCount = 0;
  public void setAlignVertical(String[] v) {
    alignVertical = getMonolingualValueArray(alignVerticalTFE, v);
  }

  public String[] getAvailableAlignVertical() {
    if (theContent != null && isFieldMissing("alignVertical")) {
	  String[] objectValue = theContent.getAlignVertical();
      if (objectValue == null) {
        return alignVertical;
      }
      return objectValue;
    }
    return alignVertical;
  }



  public void setAlignVerticalAddCount(int  v) {
    alignVerticalAddCount = v;
  }

  public int getAlignVerticalCount() {
    int arraySize = Util.getSize(getAvailableAlignVertical());
    int res = 3 + arraySize + alignVerticalAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // backgroundColor
  // ----------------------------------------------------------------------
  protected TypeFieldEntry backgroundColorTFE = channel.getTypeFieldEntry(PortletColumn.class, "backgroundColor", true);
  protected String[] backgroundColor = new String[0];
  protected int backgroundColorAddCount = 0;
  public void setBackgroundColor(String[] v) {
    backgroundColor = getMonolingualValueArray(backgroundColorTFE, v);
  }

  public String[] getAvailableBackgroundColor() {
    if (theContent != null && isFieldMissing("backgroundColor")) {
	  String[] objectValue = theContent.getBackgroundColor();
      if (objectValue == null) {
        return backgroundColor;
      }
      return objectValue;
    }
    return backgroundColor;
  }



  public void setBackgroundColorAddCount(int  v) {
    backgroundColorAddCount = v;
  }

  public int getBackgroundColorCount() {
    int arraySize = Util.getSize(getAvailableBackgroundColor());
    int res = 3 + arraySize + backgroundColorAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // backgroundImage
  // ----------------------------------------------------------------------
  protected TypeFieldEntry backgroundImageTFE = channel.getTypeFieldEntry(PortletColumn.class, "backgroundImage", true);
  protected String[] backgroundImage = new String[0];
  protected int backgroundImageAddCount = 0;
  public void setBackgroundImage(String[] v) {
    backgroundImage = getMonolingualValueArray(backgroundImageTFE, v);
  }

  public String[] getAvailableBackgroundImage() {
    if (theContent != null && isFieldMissing("backgroundImage")) {
	  String[] objectValue = theContent.getBackgroundImage();
      if (objectValue == null) {
        return backgroundImage;
      }
      return objectValue;
    }
    return backgroundImage;
  }



  public void setBackgroundImageAddCount(int  v) {
    backgroundImageAddCount = v;
  }

  public int getBackgroundImageCount() {
    int arraySize = Util.getSize(getAvailableBackgroundImage());
    int res = 3 + arraySize + backgroundImageAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // backgroundRepeat
  // ----------------------------------------------------------------------
  protected TypeFieldEntry backgroundRepeatTFE = channel.getTypeFieldEntry(PortletColumn.class, "backgroundRepeat", true);
  protected String[] backgroundRepeat = new String[0];
  protected int backgroundRepeatAddCount = 0;
  public void setBackgroundRepeat(String[] v) {
    backgroundRepeat = getMonolingualValueArray(backgroundRepeatTFE, v);
  }

  public String[] getAvailableBackgroundRepeat() {
    if (theContent != null && isFieldMissing("backgroundRepeat")) {
	  String[] objectValue = theContent.getBackgroundRepeat();
      if (objectValue == null) {
        return backgroundRepeat;
      }
      return objectValue;
    }
    return backgroundRepeat;
  }



  public void setBackgroundRepeatAddCount(int  v) {
    backgroundRepeatAddCount = v;
  }

  public int getBackgroundRepeatCount() {
    int arraySize = Util.getSize(getAvailableBackgroundRepeat());
    int res = 3 + arraySize + backgroundRepeatAddCount;
    return res;
  }



}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 9wCASPRXxW/AYsXRVZBFfQ==
