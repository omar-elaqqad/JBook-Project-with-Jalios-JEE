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
public class EditPortletCarouselHandler extends EditPortletQueryForeachHandler {
   
  protected PortletCarousel theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletCarousel.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletCarousel  
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
  
    if ("autoplaycarousel".equals(field)) {
      return getAvailableAutoplaycarousel();
    }
    
    if ("arrows".equals(field)) {
      return getAvailableArrows();
    }
    
    if ("dots".equals(field)) {
      return getAvailableDots();
    }
    
    if ("showTitle".equals(field)) {
      return getAvailableShowTitle();
    }
    
    if ("showDate".equals(field)) {
      return getAvailableShowDate();
    }
    
    if ("showAuthor".equals(field)) {
      return getAvailableShowAuthor();
    }
    
    if ("slidesToShow".equals(field)) {
      return getAvailableSlidesToShow();
    }
    
    if ("numberOfLinesInTheTitle".equals(field)) {
      return getAvailableNumberOfLinesInTheTitle();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("arrows".equals(field)) {
      return PortletCarousel.getArrowsValues();
    }
    if ("dots".equals(field)) {
      return PortletCarousel.getDotsValues();
    }
    if ("showTitle".equals(field)) {
      return PortletCarousel.getShowTitleValues();
    }
    if ("showDate".equals(field)) {
      return PortletCarousel.getShowDateValues();
    }
    if ("showAuthor".equals(field)) {
      return PortletCarousel.getShowAuthorValues();
    }
    if ("numberOfLinesInTheTitle".equals(field)) {
      return PortletCarousel.getNumberOfLinesInTheTitleValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("arrows".equals(field)) {
      return PortletCarousel.getArrowsLabels(userLang);
    }
    if ("dots".equals(field)) {
      return PortletCarousel.getDotsLabels(userLang);
    }
    if ("showTitle".equals(field)) {
      return PortletCarousel.getShowTitleLabels(userLang);
    }
    if ("showDate".equals(field)) {
      return PortletCarousel.getShowDateLabels(userLang);
    }
    if ("showAuthor".equals(field)) {
      return PortletCarousel.getShowAuthorLabels(userLang);
    }
    if ("numberOfLinesInTheTitle".equals(field)) {
      return PortletCarousel.getNumberOfLinesInTheTitleLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletCarousel  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletCarousel() {
    if (!isAutoplaycarouselValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "autoplaycarousel", userLang)));
      return false;
    }
    if (!isSlidesToShowValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "slidesToShow", userLang)));
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
    if (!validateCommonCreateUpdatePortletCarousel()) {
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
    
    if (!validateCommonCreateUpdatePortletCarousel()) {
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
    PortletCarousel obj = (PortletCarousel)data;
    obj.setAutoplaycarousel(getAvailableAutoplaycarousel());
    obj.setArrows(getAvailableArrows());
    obj.setDots(getAvailableDots());
    obj.setShowTitle(getAvailableShowTitle());
    obj.setShowDate(getAvailableShowDate());
    obj.setShowAuthor(getAvailableShowAuthor());
    obj.setSlidesToShow(getAvailableSlidesToShow());
    obj.setNumberOfLinesInTheTitle(getAvailableNumberOfLinesInTheTitle());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletCarousel) {
      super.setId(v);
      theContent = (PortletCarousel)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // autoplaycarousel
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry autoplaycarouselTFE = channel.getTypeFieldEntry(PortletCarousel.class, "autoplaycarousel", true);
  protected boolean isAutoplaycarouselValidated = true;
  protected long autoplaycarousel = 0;
  public void setAutoplaycarousel(String v) {
    try {
      autoplaycarousel = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      isAutoplaycarouselValidated = false;
    }
  }
  
  public long getAvailableAutoplaycarousel() {
    if (theContent != null && isFieldMissing("autoplaycarousel")) {
     long objectValue = theContent.getAutoplaycarousel();
      return objectValue;
    }
    return autoplaycarousel;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // arrows
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry arrowsTFE = channel.getTypeFieldEntry(PortletCarousel.class, "arrows", true);
  protected boolean arrows = true;
  public void setArrows(boolean  v) {
    this.arrows = v;
  }
  
  public boolean getAvailableArrows() {
    if (theContent != null && isFieldMissing("arrows")) {
     boolean objectValue = theContent.getArrows();
      return objectValue;
    }
    return arrows;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // dots
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry dotsTFE = channel.getTypeFieldEntry(PortletCarousel.class, "dots", true);
  protected boolean dots = true;
  public void setDots(boolean  v) {
    this.dots = v;
  }
  
  public boolean getAvailableDots() {
    if (theContent != null && isFieldMissing("dots")) {
     boolean objectValue = theContent.getDots();
      return objectValue;
    }
    return dots;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showTitle
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showTitleTFE = channel.getTypeFieldEntry(PortletCarousel.class, "showTitle", true);
  protected boolean showTitle = true;
  public void setShowTitle(boolean  v) {
    this.showTitle = v;
  }
  
  public boolean getAvailableShowTitle() {
    if (theContent != null && isFieldMissing("showTitle")) {
     boolean objectValue = theContent.getShowTitle();
      return objectValue;
    }
    return showTitle;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showDate
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showDateTFE = channel.getTypeFieldEntry(PortletCarousel.class, "showDate", true);
  protected boolean showDate = true;
  public void setShowDate(boolean  v) {
    this.showDate = v;
  }
  
  public boolean getAvailableShowDate() {
    if (theContent != null && isFieldMissing("showDate")) {
     boolean objectValue = theContent.getShowDate();
      return objectValue;
    }
    return showDate;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // showAuthor
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry showAuthorTFE = channel.getTypeFieldEntry(PortletCarousel.class, "showAuthor", true);
  protected boolean showAuthor = true;
  public void setShowAuthor(boolean  v) {
    this.showAuthor = v;
  }
  
  public boolean getAvailableShowAuthor() {
    if (theContent != null && isFieldMissing("showAuthor")) {
     boolean objectValue = theContent.getShowAuthor();
      return objectValue;
    }
    return showAuthor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // slidesToShow
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry slidesToShowTFE = channel.getTypeFieldEntry(PortletCarousel.class, "slidesToShow", true);
  protected boolean isSlidesToShowValidated = true;
  protected int slidesToShow = 1;
  public void setSlidesToShow(String v) {
    try {
      slidesToShow = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isSlidesToShowValidated = false;
    }
  }
  public int getAvailableSlidesToShow() {
    if (theContent != null && isFieldMissing("slidesToShow")) {
     int objectValue = theContent.getSlidesToShow();
      return objectValue;
    }
    return slidesToShow;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // numberOfLinesInTheTitle
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry numberOfLinesInTheTitleTFE = channel.getTypeFieldEntry(PortletCarousel.class, "numberOfLinesInTheTitle", true);
  protected String numberOfLinesInTheTitle = channel.getTypeFieldEntry(PortletCarousel.class, "numberOfLinesInTheTitle", true).getDefaultTextString();
  public void setNumberOfLinesInTheTitle(String[] v) {
    numberOfLinesInTheTitle = getMonolingualValue(numberOfLinesInTheTitleTFE, v);
  }
  public String getAvailableNumberOfLinesInTheTitle() {
    if (theContent != null && isFieldMissing("numberOfLinesInTheTitle")) {
     String objectValue = theContent.getNumberOfLinesInTheTitle();
      return objectValue;
    }
    return numberOfLinesInTheTitle;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// bhVaUQRrRBX6M53s4KzPMg==
