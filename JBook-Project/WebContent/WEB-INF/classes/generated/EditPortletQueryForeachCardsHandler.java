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
public class EditPortletQueryForeachCardsHandler extends EditPortletQueryForeachHandler {
   
  protected PortletQueryForeachCards theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletQueryForeachCards.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletQueryForeachCards  
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
  
    if ("cardsPerLine".equals(field)) {
      return getAvailableCardsPerLine();
    }
    
    if ("cardCssClass".equals(field)) {
      return getAvailableCardCssClass();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("cardsPerLine".equals(field)) {
      return PortletQueryForeachCards.getCardsPerLineValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("cardsPerLine".equals(field)) {
      return PortletQueryForeachCards.getCardsPerLineLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletQueryForeachCards  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletQueryForeachCards() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdatePortletQueryForeachCards()) {
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
    
    if (!validateCommonCreateUpdatePortletQueryForeachCards()) {
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
    PortletQueryForeachCards obj = (PortletQueryForeachCards)data;
    obj.setCardsPerLine(getAvailableCardsPerLine());
    obj.setCardCssClass(getAvailableCardCssClass());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletQueryForeachCards) {
      super.setId(v);
      theContent = (PortletQueryForeachCards)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // cardsPerLine
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry cardsPerLineTFE = channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardsPerLine", true);
  protected String cardsPerLine = channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardsPerLine", true).getDefaultTextString();
  public void setCardsPerLine(String[] v) {
    cardsPerLine = getMonolingualValue(cardsPerLineTFE, v);
  }
  public String getAvailableCardsPerLine() {
    if (theContent != null && isFieldMissing("cardsPerLine")) {
     String objectValue = theContent.getCardsPerLine();
      return objectValue;
    }
    return cardsPerLine;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cardCssClass
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry cardCssClassTFE = channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardCssClass", true);
  protected String cardCssClass = channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardCssClass", true).getDefaultTextString();
  public void setCardCssClass(String[] v) {
    cardCssClass = getMonolingualValue(cardCssClassTFE, v);
  }
  public String getAvailableCardCssClass() {
    if (theContent != null && isFieldMissing("cardCssClass")) {
     String objectValue = theContent.getCardCssClass();
      return objectValue;
    }
    return cardCssClass;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// /TZktnpb5YMN0zRQ0H+w3A==
