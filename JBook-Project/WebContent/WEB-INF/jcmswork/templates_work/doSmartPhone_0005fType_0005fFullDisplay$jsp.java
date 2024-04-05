import com.jalios.util.*;
import  java.io.*;
import  java.util.*;
import  java.text.*;
import  java.net.*;
import  org.jdom.*;
import  com.jalios.jcms.*;
import  com.jalios.jcms.portlet.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jalios.jspengine.runtime.*;


public class doSmartPhone_0005fType_0005fFullDisplay$jsp extends HttpJspBase {


    static {
    }
    public doSmartPhone_0005fType_0005fFullDisplay$jsp( ) {
    }

    private static boolean _jspx_inited = false;

    public final void _jspx_init() throws com.jalios.jspengine.runtime.JspException {
    }

    public void _jspService(HttpServletRequest request, HttpServletResponse  response)
        throws java.io.IOException, ServletException {

        JspFactory _jspxFactory = null;
        PageContext pageContext = null;
        HttpSession session = null;
        ServletContext application = null;
        ServletConfig config = null;
        JspWriter out = null;
        Object page = this;
        String  _value = null;
        try {

            if (_jspx_inited == false) {
                synchronized (this) {
                    if (_jspx_inited == false) {
                        _jspx_init();
                        _jspx_inited = true;
                    }
                }
            }
            _jspxFactory = com.jalios.jspengine.runtime.JspFactoryImpl.getInstance();
            response.setContentType("text/plain; charset=UTF-8");
            pageContext = _jspxFactory.getPageContext(this, request, response,
            			"", true, 8192, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(0,50);to=(1,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(1,145);to=(2,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(2,44);to=(3,0)]
                out.write("\r\n");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(3,2);to=(38,0)]
                
                  request.setCharacterEncoding("UTF-8");
                
                final Channel channel = Channel.getChannel();
                
                boolean isPublicationType = true;
                boolean isFileDocument = false;
                Element   typeElt = (Element)session.getAttribute("typeElt");
                
                List extendedTypeList = null;
                String className = null;
                // Extension
                if (typeElt == null) {
                  typeElt = (Element)session.getAttribute("extensionElt");
                  isPublicationType = false;
                  String extendedType = typeElt.getAttributeValue("type");
                  className = Util.getClassShortName(extendedType) + "Extension";
                } 
                // Publication Type
                else {
                  extendedTypeList = (List)session.getAttribute("extendedTypeList");
                  className = typeElt.getAttributeValue("name");
                  isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
                }
                String superclass = Util.getString(typeElt.getAttributeValue("superclass"), "");
                
                // Get the fields (and the inherited fields), 
                List fieldEntryList = Util.getArrayList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry itField = (TypeFieldEntry)it.next();
                  if (itField.isHidden()) {
                    it.remove();
                  }
                }
                
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(38,2);to=(42,12)]
                out.write("\r\n[[%@ page contentType=\"text/html; charset=UTF-8\" %]][[%\r\n%]][[%-- This file has been automatically generated. --%]][[%\r\n%]][[%--\r\n  @Summary: ");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(42,15);to=(42,26)]
                out.print( className );
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(42,28);to=(48,0)]
                out.write(" SmartPhone display page\r\n  @Category: Generated\r\n  @Author: JCMS Type Processor\r\n  @Customizable: True\r\n  @Requestable: True\r\n--%]][[%\r\n");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(48,2);to=(48,25)]
                 if (isFileDocument) { 
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(48,27);to=(50,0)]
                out.write("\r\n%]][[%@ include file='/plugins/SmartPhonePlugin/jsp/type/fileDocument.jsp' %]]\r\n");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(50,2);to=(50,12)]
                 } else { 
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(50,14);to=(53,2)]
                out.write("\r\n%]][[%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %]]\r\n[[%\r\n  ");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(53,5);to=(53,16)]
                out.print( className );
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(53,18);to=(53,26)]
                out.write(" pub = (");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(53,29);to=(53,40)]
                out.print( className );
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(53,42);to=(70,0)]
                out.write(") getPublicationParameter(\"id\");\r\n%]]\r\n[[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %]]\r\n<div id=\"pub-default\" data-role=\"page\" class=\"pub-page pub-default\">\r\n  [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %]]\r\n  <div data-role=\"content\" class=\"pub-content\">\r\n    <div class=\"card card-publication\">\r\n      [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %]]\r\n      [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %]]\r\n      [[% if (Util.notEmpty(pub.getAbstract())) { %]]\r\n      <div class=\"card-item pub-body\">\r\n        [[jalios:include target=\"SMARTPHONE_PUB_BODY_TOP\" /]]\r\n\r\n\r\n        <dl>\r\n\r\n\r\n");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(70,2);to=(70,24)]
                 String data = "pub"; 
            // end
            // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(70,26);to=(72,0)]
                out.write("\r\n\r\n");

            // end
            // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(72,0);to=(72,88)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setCollection( fieldEntryList );
                _jspx_th_jalios_foreach_0.setName("itField");
                _jspx_th_jalios_foreach_0.setType("TypeFieldEntry");
                try {
                    int _jspx_eval_jalios_foreach_0 = _jspx_th_jalios_foreach_0.doStartTag();
                    if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        try {
                            if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_foreach_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_foreach_0.doInitBody();
                          }
                          do {
                              Integer itCounter = null;
                              itCounter = (Integer) pageContext.findAttribute("itCounter");
                              TypeFieldEntry itField = null;
                              itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(72,88);to=(73,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(73,2);to=(126,0)]
                              
                                String name = itField.getName();
                                String nameCap = itField.getNameCap();
                                String label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + name + "\", userLang) %]]";
                                String type = itField.getType();
                                String editor = itField.getEditor();
                                if (editor == null) { editor = ""; }
                                boolean isAbstract = itField.isAbstract();
                              
                                boolean fieldML         = itField.isFieldML();
                                boolean fieldSearchable = itField.isSearchable();
                                boolean fieldWiki       = itField.isFieldWiki();
                                boolean openWindow      = itField.isOpenWindow();
                                boolean resize          = itField.isResize();
                                int resizeWidth         = itField.getResizeWidth();
                                int resizeHeight        = itField.getResizeHeight();
                                
                                String getter = data + ".get" + nameCap + "(" + (fieldML ? "userLang" : "") + ")";
                                
                                boolean isDateOnly = itField.isDateOnly(); 
                                String dateFormat = itField.getDateFormat();
                              
                                String unit       = itField.getUnit();
                                String unitBefore = itField.getUnitBefore();
                                String unitAfter  = itField.getUnitAfter();
                                int decimals      = itField.getDecimals();
                                
                                String rootCatId  = itField.getRoot();
                              
                                String typeShort = itField.getTypeShort();
                              
                                String editorCSS = editor;
                                if (editorCSS.endsWith("[]")) {
                                 editorCSS = editorCSS.substring(0, editorCSS.length() - 2);
                                }
                               editorCSS = editorCSS + "Editor";
                              
                                String isEmptySelector = "";
                                if (type.equals("String[]") || type.equals("String")) { 
                                  isEmptySelector = "[[%= Util.isEmpty(" + data + ".get" + nameCap + "(" + (fieldML ? "userLang" : "") + ")) ? \"empty\" : \"\" %]]";
                                }
                                else if (itField.isAnyLink() || itField.isTypePrimitiveArray() || (itField.isTypeMV() && editor.equals("duration")) || 
                                    itField.isTypeDate() || itField.isTypeDateArray()) { 
                                  isEmptySelector = "[[%= Util.isEmpty(" + data + ".get" + nameCap + "(" + (fieldML ? "userLang" : "") + ")) ? \"empty\" : \"\" %]]";
                                }
                                else if (editor.equals("category")) {
                                  isEmptySelector = "[[%= Util.isEmpty(" + data + ".get" + nameCap + "(loggedMember)) ? \"empty\" : \"\" %]]";
                                }  
                                
                                String foreachCollection = "array";
                                if (itField.isTypeCollection()) {
                                  foreachCollection="collection";
                                }
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(126,2);to=(127,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(127,0);to=(127,57)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_0.setPageContext(pageContext);
                              _jspx_th_jalios_if_0.setParent(_jspx_th_jalios_foreach_0);
                              _jspx_th_jalios_if_0.setPredicate( editor.equals("sqlresult") );
                              try {
                              int _jspx_eval_jalios_if_0 = _jspx_th_jalios_if_0.doStartTag();
                              if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(127,57);to=(128,34)]
                              out.write("\r\n  [[% request.setAttribute(\"sqr\", ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(128,37);to=(128,45)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(128,47);to=(129,0)]
                              out.write("); %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(129,0);to=(129,12)]
                          } while (_jspx_th_jalios_if_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_0.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(129,12);to=(130,16)]
              out.write("\r\n          [[%-- ");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(130,19);to=(130,28)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(130,30);to=(131,49)]
              out.write(" ------------------------------------------------------------ --%]]\r\n          <dt class=\"smartphone-fulldisplay-key\">");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(131,52);to=(131,59)]
              out.print( label );
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(131,61);to=(132,51)]
              out.write("</dt>\r\n          <dd class=\"smartphone-fulldisplay-value\" ");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,53);to=(132,87)]
               if (type.startsWith("String")) { 
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,89);to=(132,99)]
              out.write("[[%= gfla(");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,102);to=(132,108)]
              out.print( data );
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,110);to=(132,113)]
              out.write(", \"");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,116);to=(132,122)]
              out.print( name );
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,124);to=(132,130)]
              out.write("\") %]]");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,132);to=(132,135)]
               } 
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(132,137);to=(134,0)]
              out.write(">\r\n\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(134,0);to=(134,15)]
              /* ----  jalios:select ---- */
              com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_0 = new com.jalios.jtaglib.SelectTag();
              _jspx_th_jalios_select_0.setPageContext(pageContext);
              _jspx_th_jalios_select_0.setParent(_jspx_th_jalios_foreach_0);
              try {
                  int _jspx_eval_jalios_select_0 = _jspx_th_jalios_select_0.doStartTag();
                  if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_select_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_select_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(134,15);to=(136,0)]
                              out.write("\r\n\r\n");

                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(136,73);to=(137,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(137,0);to=(137,83)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_1.setPageContext(pageContext);
                              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_select_0);
                              _jspx_th_jalios_if_1.setPredicate( type.equals("String[]") && editor.equals("sqlquery") );
                              try {
                              int _jspx_eval_jalios_if_1 = _jspx_th_jalios_if_1.doStartTag();
                              if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_1.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(137,83);to=(138,42)]
                              out.write("\r\n            [[% if (Util.notEmpty(sqrArray");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(138,45);to=(138,54)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(138,56);to=(140,45)]
                              out.write(")) { %]]\r\n              <ol>\r\n                [[% SQLQueryResult[] sqrArray");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(140,48);to=(140,57)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(140,59);to=(140,62)]
                              out.write(" = ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(140,65);to=(140,71)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(140,73);to=(140,77)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(140,80);to=(140,89)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(140,91);to=(141,86)]
                              out.write("SQR(); %>\r\n                [[jalios:foreach name=\"sqr\" type=\"SQLQueryResult\" array=\"[[%= sqrArray");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(141,89);to=(141,98)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(141,100);to=(150,0)]
                              out.write(" %]]\"]]\r\n                <li>\r\n                  [[% request.setAttribute(\"sqr\", sqr); %]]\r\n                  [[jsp:include page=\"/jcore/doDisplaySQLQuery.jsp\"/]]\r\n                  [[% request.removeAttribute(\"sqr\"); %]]\r\n                </li>\r\n                [[/jalios:foreach]]\r\n              </ol>\r\n            [[% } %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(150,0);to=(150,12)]
                          } while (_jspx_th_jalios_if_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_1.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(150,12);to=(152,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(152,73);to=(153,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(153,0);to=(153,83)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_2.setPageContext(pageContext);
              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_2.setPredicate( type.equals("String[]") && editor.equals("dbrecord") );
              try {
                  int _jspx_eval_jalios_if_2 = _jspx_th_jalios_if_2.doStartTag();
                  if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_2.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(153,83);to=(155,33)]
                              out.write("\r\n            [[% { \r\n              String[] labels =  ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(155,36);to=(155,42)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(155,44);to=(155,48)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(155,51);to=(155,60)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(155,62);to=(156,33)]
                              out.write("Label();\r\n              String[] params =  ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(156,36);to=(156,42)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(156,44);to=(156,48)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(156,51);to=(156,60)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(156,62);to=(166,0)]
                              out.write("DisplayParams();\r\n            %]]\r\n            [[jalios:if predicate=\"[[%= labels != null && params != null && labels.length > 0 %]]\"]]\r\n              <ol>\r\n                [[% for(int i = 0; i < labels.length; i++) { %]]\r\n                <li><a href=\"jcore/displayDBRecord.jsp?[[%= params[i] %]]\">[[%= labels[i] %]]</a></li>\r\n                [[% } %]]\r\n              </ol>\r\n            [[/jalios:if]]\r\n            [[% } %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(166,0);to=(166,12)]
                          } while (_jspx_th_jalios_if_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_2.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(166,12);to=(168,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(168,62);to=(169,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(169,0);to=(169,80)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_3.setPageContext(pageContext);
              _jspx_th_jalios_if_3.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_3.setPredicate( itField.isTypeMV() && typeShort.equals("String")  );
              try {
                  int _jspx_eval_jalios_if_3 = _jspx_th_jalios_if_3.doStartTag();
                  if (_jspx_eval_jalios_if_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_3.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_3.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(169,80);to=(170,34)]
                              out.write("\r\n            [[% if (Util.notEmpty(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(170,37);to=(170,43)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(170,45);to=(170,49)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(170,52);to=(170,61)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(170,63);to=(170,64)]
                              out.write("(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(170,67);to=(170,94)]
                              out.print( fieldML ? "userLang" : "" );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(170,96);to=(172,63)]
                              out.write("))) { %]]\r\n              <ol>\r\n                [[jalios:foreach name=\"itString\" type=\"String\" ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,66);to=(172,85)]
                              out.print( foreachCollection );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,87);to=(172,94)]
                              out.write("=\"[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,97);to=(172,103)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,105);to=(172,109)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,112);to=(172,121)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,123);to=(172,124)]
                              out.write("(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,127);to=(172,154)]
                              out.print( fieldML ? "userLang" : "" );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(172,156);to=(175,0)]
                              out.write(") %]]\"]]\r\n                  [[jalios:if predicate='[[%= Util.notEmpty(itString) %]]']]\r\n                    <li>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(175,0);to=(175,15)]
                              /* ----  jalios:select ---- */
                              com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_1 = new com.jalios.jtaglib.SelectTag();
                              _jspx_th_jalios_select_1.setPageContext(pageContext);
                              _jspx_th_jalios_select_1.setParent(_jspx_th_jalios_if_3);
                              try {
                              int _jspx_eval_jalios_select_1 = _jspx_th_jalios_select_1.doStartTag();
                              if (_jspx_eval_jalios_select_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_select_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_select_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_select_1.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(175,15);to=(177,0)]
                              out.write("\r\n\r\n");

                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(177,62);to=(178,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(178,0);to=(178,53)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_4.setPageContext(pageContext);
                              _jspx_th_jalios_if_4.setParent(_jspx_th_jalios_select_1);
                              _jspx_th_jalios_if_4.setPredicate( editor.equals("image") );
                              try {
                              int _jspx_eval_jalios_if_4 = _jspx_th_jalios_if_4.doStartTag();
                              if (_jspx_eval_jalios_if_4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_4.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_4.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(178,53);to=(179,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(179,2);to=(179,17)]
                               if (resize) { 
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(179,19);to=(180,92)]
                              out.write("\r\n                      <p>[[jalios:thumbnail path='[[%= Util.encodeUrl(itString) %]]' width='");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(180,95);to=(180,108)]
                              out.print( resizeWidth );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(180,110);to=(180,120)]
                              out.write("' height='");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(180,123);to=(180,137)]
                              out.print( resizeHeight );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(180,139);to=(181,0)]
                              out.write("' /]]</p>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(181,2);to=(181,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(181,14);to=(183,0)]
                              out.write("\r\n                      <p><img src='[[%= Util.encodeUrl(itString) %]]' alt='' /></p>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(183,2);to=(183,5)]
                               } 
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(183,7);to=(184,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(184,0);to=(184,12)]
                          } while (_jspx_th_jalios_if_4.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_4.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(184,12);to=(186,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(186,62);to=(187,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(187,0);to=(187,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_5 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_5.setPageContext(pageContext);
              _jspx_th_jalios_if_5.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_5.setPredicate( editor.equals("media") );
              try {
                  int _jspx_eval_jalios_if_5 = _jspx_th_jalios_if_5.doStartTag();
                  if (_jspx_eval_jalios_if_5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_5.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_5.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(187,53);to=(189,0)]
                              out.write("\r\n                      <p>[[jalios:media path='[[%= Util.encodeUrl(itString) %]]' /]]</p>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(189,0);to=(189,12)]
                          } while (_jspx_th_jalios_if_5.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_5.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(189,12);to=(191,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(191,60);to=(192,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(192,0);to=(192,51)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_6 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_6.setPageContext(pageContext);
              _jspx_th_jalios_if_6.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_6.setPredicate( editor.equals("url") );
              try {
                  int _jspx_eval_jalios_if_6 = _jspx_th_jalios_if_6.doStartTag();
                  if (_jspx_eval_jalios_if_6 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_6.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_6.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(192,51);to=(193,49)]
                              out.write("\r\n                      <a href='[[%= itString %]]'");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(193,52);to=(193,88)]
                              out.print( openWindow ? "target='blank'" : "" );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(193,90);to=(194,0)]
                              out.write(">[[%= itString %]]</a>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(194,0);to=(194,12)]
                          } while (_jspx_th_jalios_if_6.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_6.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(194,12);to=(196,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(196,62);to=(197,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(197,0);to=(197,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_7 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_7.setPageContext(pageContext);
              _jspx_th_jalios_if_7.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_7.setPredicate( editor.equals("email") );
              try {
                  int _jspx_eval_jalios_if_7 = _jspx_th_jalios_if_7.doStartTag();
                  if (_jspx_eval_jalios_if_7 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_7 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_7.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_7.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(197,53);to=(199,0)]
                              out.write("\r\n                      <a href='mailto:[[%= itString %]]'>[[%= itString %]]</a>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(199,0);to=(199,12)]
                          } while (_jspx_th_jalios_if_7.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_7 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_7.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(199,12);to=(201,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(201,65);to=(202,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(202,0);to=(202,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_8 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_8.setPageContext(pageContext);
              _jspx_th_jalios_if_8.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_8.setPredicate( editor.equals("password") );
              try {
                  int _jspx_eval_jalios_if_8 = _jspx_th_jalios_if_8.doStartTag();
                  if (_jspx_eval_jalios_if_8 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_8 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_8.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_8.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(202,56);to=(204,0)]
                              out.write("\r\n                     ******\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(204,0);to=(204,12)]
                          } while (_jspx_th_jalios_if_8.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_8 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_8.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(204,12);to=(206,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(206,59);to=(207,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(207,0);to=(207,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_9 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_9.setPageContext(pageContext);
              _jspx_th_jalios_if_9.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_9.setPredicate( editor.equals("query") );
              try {
                  int _jspx_eval_jalios_if_9 = _jspx_th_jalios_if_9.doStartTag();
                  if (_jspx_eval_jalios_if_9 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_9 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_9.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_9.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(207,53);to=(210,43)]
                              out.write("\r\n                      [[%= itString %]]\r\n                      <ul style=\"list-style-type: none; padding: 0\">\r\n                      [[jalios:query name='");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(210,46);to=(210,52)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(210,54);to=(211,43)]
                              out.write("ResultSet' queryString='[[%= itString %]]' />\r\n                      [[jalios:pager name=\"");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(211,46);to=(211,52)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(211,54);to=(211,101)]
                              out.write("Pager\" declare='true' action=\"init\" size=\"[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(211,104);to=(211,110)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(211,112);to=(213,56)]
                              out.write("ResultSet.size() %]]\"/>\r\n                      [[jalios:foreach counter='itCounter2'\r\n                                       collection='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(213,59);to=(213,65)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(213,67);to=(216,49)]
                              out.write("ResultSet %]]' \r\n                                       type='Publication' \r\n                                       name='itPub' \r\n                                       max='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(216,52);to=(216,58)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(216,60);to=(217,50)]
                              out.write("Pager.getPageSize() %]]'\r\n                                       skip='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(217,53);to=(217,59)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(217,61);to=(219,55)]
                              out.write("Pager.getStart() %]]'\r\n                                       >\r\n                      <li>[[%= itCounter2.intValue() + ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(219,58);to=(219,64)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(219,66);to=(222,43)]
                              out.write("Pager.getStart() %]]. [[jalios:link data='[[%= itPub %]]'/]]</li>\r\n                      [[/jalios:foreach>\r\n                      </ul>\r\n                      [[jalios:pager name=\"");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(222,46);to=(222,52)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(222,54);to=(223,0)]
                              out.write("Pager\" /> \r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(223,0);to=(223,12)]
                          } while (_jspx_th_jalios_if_9.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_9 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_9.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(223,12);to=(225,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(225,69);to=(226,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(226,0);to=(226,69)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_10 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_10.setPageContext(pageContext);
              _jspx_th_jalios_if_10.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_10.setPredicate( editor.equals("textarea") && fieldWiki );
              try {
                  int _jspx_eval_jalios_if_10 = _jspx_th_jalios_if_10.doStartTag();
                  if (_jspx_eval_jalios_if_10 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_10 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_10.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_10.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(226,69);to=(228,0)]
                              out.write("\r\n                      [[jalios:wiki]][[%= itString %]][[/jalios:wiki]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(228,0);to=(228,12)]
                          } while (_jspx_th_jalios_if_10.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_10 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_10.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(228,12);to=(230,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(230,62);to=(231,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(231,0);to=(231,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_11 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_11.setPageContext(pageContext);
              _jspx_th_jalios_if_11.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_11.setPredicate( editor.equals("textarea") );
              try {
                  int _jspx_eval_jalios_if_11 = _jspx_th_jalios_if_11.doStartTag();
                  if (_jspx_eval_jalios_if_11 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_11 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_11.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_11.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(231,56);to=(233,0)]
                              out.write("\r\n                      [[%= itString %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(233,0);to=(233,12)]
                          } while (_jspx_th_jalios_if_11.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_11 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_11.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(233,12);to=(235,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(235,61);to=(236,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(236,0);to=(236,55)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_12 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_12.setPageContext(pageContext);
              _jspx_th_jalios_if_12.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_12.setPredicate( editor.equals("wysiwyg") );
              try {
                  int _jspx_eval_jalios_if_12 = _jspx_th_jalios_if_12.doStartTag();
                  if (_jspx_eval_jalios_if_12 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_12 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_12.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_12.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(236,55);to=(238,0)]
                              out.write("\r\n                      [[jalios:wysiwyg]][[%= itString %]][[/jalios:wysiwyg]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(238,0);to=(238,12)]
                          } while (_jspx_th_jalios_if_12.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_12 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_12.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_12.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(238,12);to=(240,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(240,65);to=(241,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(241,0);to=(241,57)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_13 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_13.setPageContext(pageContext);
              _jspx_th_jalios_if_13.setParent(_jspx_th_jalios_select_1);
              _jspx_th_jalios_if_13.setPredicate( editor.equals("enumerate") );
              try {
                  int _jspx_eval_jalios_if_13 = _jspx_th_jalios_if_13.doStartTag();
                  if (_jspx_eval_jalios_if_13 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_13 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_13.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_13.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(241,57);to=(242,27)]
                              out.write("\r\n                      [[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(242,30);to=(242,36)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(242,38);to=(242,42)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(242,45);to=(242,54)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(242,56);to=(243,0)]
                              out.write("Label(itString, userLang) %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(243,0);to=(243,12)]
                          } while (_jspx_th_jalios_if_13.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_13 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_13.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_13.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(243,12);to=(245,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(245,63);to=(246,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(246,0);to=(246,16)]
              /* ----  jalios:default ---- */
              com.jalios.jtaglib.ConditionalTag _jspx_th_jalios_default_0 = new com.jalios.jtaglib.ConditionalTag();
              _jspx_th_jalios_default_0.setPageContext(pageContext);
              _jspx_th_jalios_default_0.setParent(_jspx_th_jalios_select_1);
              try {
                  int _jspx_eval_jalios_default_0 = _jspx_th_jalios_default_0.doStartTag();
                  if (_jspx_eval_jalios_default_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_default_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_default_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_default_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(246,16);to=(248,0)]
                              out.write("\r\n                      [[%= itString %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(248,0);to=(248,17)]
                          } while (_jspx_th_jalios_default_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_default_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_default_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_default_0.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(248,17);to=(249,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(249,0);to=(249,16)]
          } while (_jspx_th_jalios_select_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_select_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_select_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_select_1.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(249,16);to=(255,0)]
    out.write("\r\n                    </li>\r\n                  [[/jalios:if]]\r\n                [[/jalios:foreach]]\r\n              </ol>\r\n            [[% } %]]\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(255,0);to=(255,12)]
} while (_jspx_th_jalios_if_3.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_if_3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_if_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_if_3.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(255,12);to=(257,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(257,62);to=(258,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(258,0);to=(258,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_14 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_14.setPageContext(pageContext);
    _jspx_th_jalios_if_14.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_14.setPredicate( itField.isTypeScalar() && type.equals("String") );
    try {
        int _jspx_eval_jalios_if_14 = _jspx_th_jalios_if_14.doStartTag();
        if (_jspx_eval_jalios_if_14 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_14 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_14.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_14.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(258,78);to=(259,54)]
                    out.write("\r\n            [[jalios:if predicate='[[%= Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(259,57);to=(259,65)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(259,67);to=(260,0)]
                    out.write(") %]]']]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(260,0);to=(260,15)]
                    /* ----  jalios:select ---- */
                    com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_2 = new com.jalios.jtaglib.SelectTag();
                    _jspx_th_jalios_select_2.setPageContext(pageContext);
                    _jspx_th_jalios_select_2.setParent(_jspx_th_jalios_if_14);
                    try {
                        int _jspx_eval_jalios_select_2 = _jspx_th_jalios_select_2.doStartTag();
                        if (_jspx_eval_jalios_select_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_select_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_select_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_select_2.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(260,15);to=(262,0)]
                              out.write("\r\n\r\n");

                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(262,62);to=(263,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(263,0);to=(263,53)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_15 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_15.setPageContext(pageContext);
                              _jspx_th_jalios_if_15.setParent(_jspx_th_jalios_select_2);
                              _jspx_th_jalios_if_15.setPredicate( editor.equals("image") );
                              try {
                              int _jspx_eval_jalios_if_15 = _jspx_th_jalios_if_15.doStartTag();
                              if (_jspx_eval_jalios_if_15 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_15 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_15.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_15.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(263,53);to=(264,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(264,2);to=(264,17)]
                               if (resize) { 
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(264,19);to=(265,60)]
                              out.write("\r\n            <p>[[jalios:thumbnail path='[[%= Util.encodeUrl(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(265,63);to=(265,71)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(265,73);to=(265,87)]
                              out.write(") %]]' width='");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(265,90);to=(265,103)]
                              out.print( resizeWidth );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(265,105);to=(265,115)]
                              out.write("' height='");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(265,118);to=(265,132)]
                              out.print( resizeHeight );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(265,134);to=(266,0)]
                              out.write("' /]]</p>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(266,2);to=(266,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(266,14);to=(267,42)]
                              out.write("\r\n            <img src='[[%= Util.encodeUrl(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(267,45);to=(267,53)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(267,55);to=(268,0)]
                              out.write(") %]]' alt='' />\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(268,2);to=(268,5)]
                               } 
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(268,7);to=(269,0)]
                              out.write("\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(269,0);to=(269,12)]
                          } while (_jspx_th_jalios_if_15.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_15 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_15.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_15.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(269,12);to=(271,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(271,60);to=(272,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(272,0);to=(272,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_16 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_16.setPageContext(pageContext);
              _jspx_th_jalios_if_16.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_16.setPredicate( editor.equals("media") );
              try {
                  int _jspx_eval_jalios_if_16 = _jspx_th_jalios_if_16.doStartTag();
                  if (_jspx_eval_jalios_if_16 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_16 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_16.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_16.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(272,53);to=(273,56)]
                              out.write("\r\n            <p>[[jalios:media path='[[%= Util.encodeUrl(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(273,59);to=(273,67)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(273,69);to=(274,0)]
                              out.write(") %]]' /]]</p>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(274,0);to=(274,12)]
                          } while (_jspx_th_jalios_if_16.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_16 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_16.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_16.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(274,12);to=(276,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(276,60);to=(277,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(277,0);to=(277,51)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_17 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_17.setPageContext(pageContext);
              _jspx_th_jalios_if_17.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_17.setPredicate( editor.equals("url") );
              try {
                  int _jspx_eval_jalios_if_17 = _jspx_th_jalios_if_17.doStartTag();
                  if (_jspx_eval_jalios_if_17 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_17 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_17.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_17.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(277,51);to=(278,26)]
                              out.write("\r\n            <a href='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(278,29);to=(278,37)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(278,39);to=(278,45)]
                              out.write(" %]]' ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(278,48);to=(278,84)]
                              out.print( openWindow ? "target='blank'" : "" );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(278,86);to=(278,92)]
                              out.write(">[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(278,95);to=(278,103)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(278,105);to=(279,0)]
                              out.write("%]]</a>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(279,0);to=(279,12)]
                          } while (_jspx_th_jalios_if_17.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_17 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_17.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_17.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(279,12);to=(281,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(281,62);to=(282,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(282,0);to=(282,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_18 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_18.setPageContext(pageContext);
              _jspx_th_jalios_if_18.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_18.setPredicate( editor.equals("email") );
              try {
                  int _jspx_eval_jalios_if_18 = _jspx_th_jalios_if_18.doStartTag();
                  if (_jspx_eval_jalios_if_18 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_18 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_18.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_18.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(282,53);to=(283,33)]
                              out.write("\r\n            <a href='mailto:[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(283,36);to=(283,44)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(283,46);to=(283,57)]
                              out.write(" %]]'>[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(283,60);to=(283,68)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(283,70);to=(284,0)]
                              out.write("%]]</a>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(284,0);to=(284,12)]
                          } while (_jspx_th_jalios_if_18.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_18 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_18.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_18.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(284,12);to=(286,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(286,65);to=(287,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(287,0);to=(287,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_19 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_19.setPageContext(pageContext);
              _jspx_th_jalios_if_19.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_19.setPredicate( editor.equals("password") );
              try {
                  int _jspx_eval_jalios_if_19 = _jspx_th_jalios_if_19.doStartTag();
                  if (_jspx_eval_jalios_if_19 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_19 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_19.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_19.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(287,56);to=(289,0)]
                              out.write("\r\n            ******\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(289,0);to=(289,12)]
                          } while (_jspx_th_jalios_if_19.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_19 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_19.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_19.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(289,12);to=(291,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(291,59);to=(292,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(292,0);to=(292,53)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_20 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_20.setPageContext(pageContext);
              _jspx_th_jalios_if_20.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_20.setPredicate( editor.equals("query") );
              try {
                  int _jspx_eval_jalios_if_20 = _jspx_th_jalios_if_20.doStartTag();
                  if (_jspx_eval_jalios_if_20 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_20 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_20.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_20.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(292,53);to=(294,35)]
                              out.write("\r\n            <ul style=\"list-style-type: none; padding: 0\">\r\n              [[jalios:query name='");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(294,38);to=(294,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(294,46);to=(294,75)]
                              out.write("ResultSet' queryString='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(294,78);to=(294,86)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(294,88);to=(295,35)]
                              out.write(" %]]' />\r\n              [[jalios:pager name=\"");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(295,38);to=(295,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(295,46);to=(295,93)]
                              out.write("Pager\" declare='true' action=\"init\" size=\"[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(295,96);to=(295,102)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(295,104);to=(296,48)]
                              out.write("ResultSet.size() %]]\"/>\r\n              [[jalios:foreach collection='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(296,51);to=(296,57)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(296,59);to=(299,41)]
                              out.write("ResultSet %]]' \r\n                               type='Publication' \r\n                               name='itPub' \r\n                               max='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(299,44);to=(299,50)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(299,52);to=(300,42)]
                              out.write("Pager.getPageSize() %]]'\r\n                               skip='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(300,45);to=(300,51)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(300,53);to=(302,48)]
                              out.write("Pager.getStart() %]]'\r\n                               >\r\n                <li>[[%= itCounter.intValue() + ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(302,51);to=(302,57)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(302,59);to=(304,35)]
                              out.write("Pager.getStart() %]]. [[jalios:link data='[[%= itPub %]]'/]]</li>\r\n              [[/jalios:foreach>\r\n              [[jalios:pager name=\"");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(304,38);to=(304,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(304,46);to=(306,0)]
                              out.write("Pager\" />\r\n            </ul>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(306,0);to=(306,12)]
                          } while (_jspx_th_jalios_if_20.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_20 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_20.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_20.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(306,12);to=(308,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(308,69);to=(309,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(309,0);to=(309,69)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_21 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_21.setPageContext(pageContext);
              _jspx_th_jalios_if_21.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_21.setPredicate( editor.equals("textarea") && fieldWiki );
              try {
                  int _jspx_eval_jalios_if_21 = _jspx_th_jalios_if_21.doStartTag();
                  if (_jspx_eval_jalios_if_21 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_21 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_21.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_21.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(309,69);to=(310,32)]
                              out.write("\r\n            [[jalios:wiki]][[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(310,35);to=(310,43)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(310,45);to=(311,0)]
                              out.write(" %]][[/jalios:wiki]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(311,0);to=(311,12)]
                          } while (_jspx_th_jalios_if_21.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_21 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_21.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_21.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(311,12);to=(313,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(313,62);to=(314,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(314,0);to=(314,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_22 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_22.setPageContext(pageContext);
              _jspx_th_jalios_if_22.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_22.setPredicate( editor.equals("textarea") );
              try {
                  int _jspx_eval_jalios_if_22 = _jspx_th_jalios_if_22.doStartTag();
                  if (_jspx_eval_jalios_if_22 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_22 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_22.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_22.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(314,56);to=(315,17)]
                              out.write("\r\n            [[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(315,20);to=(315,28)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(315,30);to=(316,0)]
                              out.write(" %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(316,0);to=(316,12)]
                          } while (_jspx_th_jalios_if_22.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_22 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_22.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_22.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(316,12);to=(318,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(318,61);to=(319,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(319,0);to=(319,55)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_23 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_23.setPageContext(pageContext);
              _jspx_th_jalios_if_23.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_23.setPredicate( editor.equals("wysiwyg") );
              try {
                  int _jspx_eval_jalios_if_23 = _jspx_th_jalios_if_23.doStartTag();
                  if (_jspx_eval_jalios_if_23 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_23 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_23.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_23.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(319,55);to=(320,35)]
                              out.write("\r\n            [[jalios:wysiwyg]][[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(320,38);to=(320,46)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(320,48);to=(321,0)]
                              out.write(" %]][[/jalios:wysiwyg]]            \r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(321,0);to=(321,12)]
                          } while (_jspx_th_jalios_if_23.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_23 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_23.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_23.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(321,12);to=(323,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(323,63);to=(324,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(324,0);to=(324,57)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_24 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_24.setPageContext(pageContext);
              _jspx_th_jalios_if_24.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_24.setPredicate( editor.equals("enumerate") );
              try {
                  int _jspx_eval_jalios_if_24 = _jspx_th_jalios_if_24.doStartTag();
                  if (_jspx_eval_jalios_if_24 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_24 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_24.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_24.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(324,57);to=(325,17)]
                              out.write("\r\n            [[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(325,20);to=(325,26)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(325,28);to=(325,32)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(325,35);to=(325,44)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(325,46);to=(325,52)]
                              out.write("Label(");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(325,55);to=(325,63)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(325,65);to=(326,0)]
                              out.write(", userLang) %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(326,0);to=(326,12)]
                          } while (_jspx_th_jalios_if_24.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_24 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_24.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_24.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(326,12);to=(328,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(328,62);to=(329,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(329,0);to=(329,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_25 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_25.setPageContext(pageContext);
              _jspx_th_jalios_if_25.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_25.setPredicate( editor.equals("sqlquery") );
              try {
                  int _jspx_eval_jalios_if_25 = _jspx_th_jalios_if_25.doStartTag();
                  if (_jspx_eval_jalios_if_25 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_25 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_25.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_25.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(329,56);to=(330,51)]
                              out.write("\r\n            [[% request.setAttribute(\"dataSource\", ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(330,54);to=(330,60)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(330,62);to=(330,66)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(330,69);to=(330,78)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(330,80);to=(331,49)]
                              out.write("DataSource()); %]]\r\n            [[% request.setAttribute(\"sqlQuery\", ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(331,52);to=(331,60)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(331,62);to=(332,53)]
                              out.write("); %]]\r\n            [[% request.setAttribute(\"maxRows\", \"\" + ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(332,56);to=(332,62)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(332,64);to=(332,68)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(332,71);to=(332,80)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(332,82);to=(334,0)]
                              out.write("MaxRows()); %]]\r\n            [[jsp:include page=\"/jcore/doDisplaySQLQuery.jsp\"/]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(334,0);to=(334,12)]
                          } while (_jspx_th_jalios_if_25.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_25 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_25.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_25.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(334,12);to=(336,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(336,62);to=(337,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(337,0);to=(337,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_26 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_26.setPageContext(pageContext);
              _jspx_th_jalios_if_26.setParent(_jspx_th_jalios_select_2);
              _jspx_th_jalios_if_26.setPredicate( editor.equals("dbrecord") );
              try {
                  int _jspx_eval_jalios_if_26 = _jspx_th_jalios_if_26.doStartTag();
                  if (_jspx_eval_jalios_if_26 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_26 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_26.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_26.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(337,56);to=(338,52)]
                              out.write("\r\n            <a href=\"jcore/displayDBRecord.jsp?[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,55);to=(338,61)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,63);to=(338,67)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,70);to=(338,79)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,81);to=(338,107)]
                              out.write("DisplayParams() %]]\">[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,110);to=(338,116)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,118);to=(338,122)]
                              out.write(".get");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,125);to=(338,134)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(338,136);to=(339,0)]
                              out.write("Label() %]]</a>\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(339,0);to=(339,12)]
                          } while (_jspx_th_jalios_if_26.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_26 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_26.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_26.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(339,12);to=(341,0)]
              out.write("\r\n\r\n");

          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(341,63);to=(342,0)]
              out.write("\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(342,0);to=(342,16)]
              /* ----  jalios:default ---- */
              com.jalios.jtaglib.ConditionalTag _jspx_th_jalios_default_1 = new com.jalios.jtaglib.ConditionalTag();
              _jspx_th_jalios_default_1.setPageContext(pageContext);
              _jspx_th_jalios_default_1.setParent(_jspx_th_jalios_select_2);
              try {
                  int _jspx_eval_jalios_default_1 = _jspx_th_jalios_default_1.doStartTag();
                  if (_jspx_eval_jalios_default_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_default_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_default_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_default_1.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(342,16);to=(343,17)]
                              out.write("\r\n            [[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(343,20);to=(343,28)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(343,30);to=(344,0)]
                              out.write(" %]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(344,0);to=(344,17)]
                          } while (_jspx_th_jalios_default_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_default_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_default_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_default_1.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(344,17);to=(346,0)]
              out.write("\r\n\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(346,0);to=(346,16)]
          } while (_jspx_th_jalios_select_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_select_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_select_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_select_2.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(346,16);to=(348,0)]
    out.write("\r\n            [[/jalios:if]]\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(348,0);to=(348,12)]
} while (_jspx_th_jalios_if_14.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_if_14 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_if_14.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_if_14.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(348,12);to=(350,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(350,59);to=(351,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(351,0);to=(351,77)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_27 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_27.setPageContext(pageContext);
    _jspx_th_jalios_if_27.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_27.setPredicate( itField.isTypeScalar() && editor.equals("int") );
    try {
        int _jspx_eval_jalios_if_27 = _jspx_th_jalios_if_27.doStartTag();
        if (_jspx_eval_jalios_if_27 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_27 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_27.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_27.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(351,77);to=(352,12)]
                    out.write("\r\n            ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,15);to=(352,27)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,29);to=(352,39)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,42);to=(352,53)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,55);to=(352,114)]
                    out.write("[[% */ %]][[%= NumberFormat.getInstance(userLocale).format(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,117);to=(352,125)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,127);to=(352,132)]
                    out.write(") %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,135);to=(352,146)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(352,148);to=(353,0)]
                    out.write("\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(353,0);to=(353,12)]
                } while (_jspx_th_jalios_if_27.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_27 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_27.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_27.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(353,12);to=(355,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(355,62);to=(356,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(356,0);to=(356,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_28 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_28.setPageContext(pageContext);
    _jspx_th_jalios_if_28.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_28.setPredicate( itField.isTypeScalar() && type.equals("double") );
    try {
        int _jspx_eval_jalios_if_28 = _jspx_th_jalios_if_28.doStartTag();
        if (_jspx_eval_jalios_if_28 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_28 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_28.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_28.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(356,78);to=(357,0)]
                    out.write("\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(357,2);to=(357,62)]
                     String decimalPattern = "#." + Util.repeat("#", decimals); 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(357,64);to=(358,12)]
                    out.write("\r\n            ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,15);to=(358,27)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,29);to=(358,39)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,42);to=(358,53)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,55);to=(358,90)]
                    out.write("[[% */ %]][[%= (new DecimalFormat(\"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,93);to=(358,109)]
                    out.print( decimalPattern );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,111);to=(358,122)]
                    out.write("\")).format(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,125);to=(358,133)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,135);to=(358,140)]
                    out.write(") %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,143);to=(358,154)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(358,156);to=(359,0)]
                    out.write("\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(359,0);to=(359,12)]
                } while (_jspx_th_jalios_if_28.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_28 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_28.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_28.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(359,12);to=(361,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(361,64);to=(362,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(362,0);to=(362,82)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_29 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_29.setPageContext(pageContext);
    _jspx_th_jalios_if_29.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_29.setPredicate( itField.isTypeScalar() && editor.equals("duration") );
    try {
        int _jspx_eval_jalios_if_29 = _jspx_th_jalios_if_29.doStartTag();
        if (_jspx_eval_jalios_if_29 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_29 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_29.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_29.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(362,82);to=(363,41)]
                    out.write("\r\n            [[jalios:duration time='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(363,44);to=(363,52)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(363,54);to=(364,0)]
                    out.write(" * 1000L %]]'/]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(364,0);to=(364,12)]
                } while (_jspx_th_jalios_if_29.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_29 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_29.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_29.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(364,12);to=(366,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(366,62);to=(367,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(367,0);to=(367,73)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_30 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_30.setPageContext(pageContext);
    _jspx_th_jalios_if_30.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_30.setPredicate( itField.isTypeMV() && editor.equals("int") );
    try {
        int _jspx_eval_jalios_if_30 = _jspx_th_jalios_if_30.doStartTag();
        if (_jspx_eval_jalios_if_30 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_30 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_30.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_30.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(367,73);to=(368,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(368,37);to=(368,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(368,47);to=(370,33)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[% for(int value: ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(370,36);to=(370,44)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(370,46);to=(371,18)]
                    out.write(") { %]]\r\n              <li>");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(371,21);to=(371,33)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(371,35);to=(371,45)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(371,48);to=(371,59)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(371,61);to=(371,130)]
                    out.write("[[% */ %]][[%= NumberFormat.getInstance(userLocale).format(value) %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(371,133);to=(371,144)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(371,146);to=(375,0)]
                    out.write("</li>\r\n              [[% } %]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(375,0);to=(375,12)]
                } while (_jspx_th_jalios_if_30.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_30 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_30.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_30.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(375,12);to=(377,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(377,64);to=(378,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(378,0);to=(378,76)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_31 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_31.setPageContext(pageContext);
    _jspx_th_jalios_if_31.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_31.setPredicate( itField.isTypeMV() && editor.equals("double") );
    try {
        int _jspx_eval_jalios_if_31 = _jspx_th_jalios_if_31.doStartTag();
        if (_jspx_eval_jalios_if_31 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_31 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_31.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_31.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(378,76);to=(379,0)]
                    out.write("\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(379,2);to=(379,62)]
                     String decimalPattern = "#." + Util.repeat("#", decimals); 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(379,64);to=(380,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(380,37);to=(380,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(380,47);to=(382,36)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[% for(double value: ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(382,39);to=(382,47)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(382,49);to=(383,18)]
                    out.write(") { %]]\r\n              <li>");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,21);to=(383,33)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,35);to=(383,45)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,48);to=(383,59)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,61);to=(383,96)]
                    out.write("[[% */ %]][[%= (new DecimalFormat(\"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,99);to=(383,115)]
                    out.print( decimalPattern );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,117);to=(383,138)]
                    out.write("\")).format(value) %]]");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,141);to=(383,152)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(383,154);to=(387,0)]
                    out.write("</li>\r\n              [[% } %]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(387,0);to=(387,12)]
                } while (_jspx_th_jalios_if_31.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_31 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_31.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_31.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(387,12);to=(389,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(389,67);to=(390,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(390,0);to=(390,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_32 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_32.setPageContext(pageContext);
    _jspx_th_jalios_if_32.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_32.setPredicate( itField.isTypeMV() && editor.equals("duration") );
    try {
        int _jspx_eval_jalios_if_32 = _jspx_th_jalios_if_32.doStartTag();
        if (_jspx_eval_jalios_if_32 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_32 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_32.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_32.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(390,78);to=(391,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(391,37);to=(391,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(391,47);to=(393,34)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[% for(long value: ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(393,37);to=(393,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(393,47);to=(398,0)]
                    out.write(") { %]]\r\n              <li>[[jalios:duration time='[[%= value * 1000L %]]'/]]</li>\r\n              [[% } %]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(398,0);to=(398,12)]
                } while (_jspx_th_jalios_if_32.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_32 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_32.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_32.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(398,12);to=(400,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(400,62);to=(401,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(401,0);to=(401,81)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_33 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_33.setPageContext(pageContext);
    _jspx_th_jalios_if_33.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_33.setPredicate( itField.isTypeScalar() && editor.equals("boolean") );
    try {
        int _jspx_eval_jalios_if_33 = _jspx_th_jalios_if_33.doStartTag();
        if (_jspx_eval_jalios_if_33 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_33 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_33.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_33.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(401,81);to=(402,17)]
                    out.write("\r\n            [[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(402,20);to=(402,26)]
                    out.print( data );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(402,28);to=(402,32)]
                    out.write(".get");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(402,35);to=(402,44)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(402,46);to=(403,0)]
                    out.write("Label(userLang) %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(403,0);to=(403,12)]
                } while (_jspx_th_jalios_if_33.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_33 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_33.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_33.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(403,12);to=(405,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(405,66);to=(406,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(406,0);to=(406,77)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_34 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_34.setPageContext(pageContext);
    _jspx_th_jalios_if_34.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_34.setPredicate( itField.isTypeMV() && editor.equals("boolean") );
    try {
        int _jspx_eval_jalios_if_34 = _jspx_th_jalios_if_34.doStartTag();
        if (_jspx_eval_jalios_if_34 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_34 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_34.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_34.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(406,77);to=(407,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(407,37);to=(407,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(407,47);to=(409,65)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[% TypeFieldEntry tfe = channel.getTypeFieldEntry(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(409,68);to=(409,79)]
                    out.print( className );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(409,81);to=(409,90)]
                    out.write(".class, \"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(409,93);to=(409,99)]
                    out.print( name );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(409,101);to=(410,37)]
                    out.write("\", true); %]]\r\n              [[% for(boolean value: ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(410,40);to=(410,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(410,50);to=(415,0)]
                    out.write(") { %]]\r\n              <li>[[%= value ? tfe.getOnLabel(userLang) : tfe.getOffLabel(userLang) %]]</li>\r\n              [[% } %]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(415,0);to=(415,12)]
                } while (_jspx_th_jalios_if_34.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_34 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_34.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_34.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(415,12);to=(417,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(417,66);to=(418,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(418,0);to=(418,77)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_35 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_35.setPageContext(pageContext);
    _jspx_th_jalios_if_35.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_35.setPredicate( isPublicationType && editor.equals("category") );
    try {
        int _jspx_eval_jalios_if_35 = _jspx_th_jalios_if_35.doStartTag();
        if (_jspx_eval_jalios_if_35 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_35 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_35.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_35.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(418,77);to=(419,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(419,37);to=(419,43)]
                    out.print( data );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(419,45);to=(419,49)]
                    out.write(".get");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(419,52);to=(419,61)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(419,63);to=(421,46)]
                    out.write("(loggedMember))) { %]]\r\n            <ol>\r\n            [[jalios:foreach collection=\"[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(421,49);to=(421,55)]
                    out.print( data );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(421,57);to=(421,61)]
                    out.write(".get");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(421,64);to=(421,73)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(421,75);to=(422,184)]
                    out.write("(loggedMember) %]]\" type=\"Category\" name=\"itCategory\" ]]\r\n              <li>[[% if (itCategory != null) { %]]<a href=\"[[%= ResourceHelper.getQuery() %]]?cids=[[%= itCategory.getId() %]]\">[[%= itCategory.getAncestorString(channel.getCategory(\"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(422,187);to=(422,198)]
                    out.print( rootCatId );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(422,200);to=(426,0)]
                    out.write("\"), \" > \", true, userLang) %]]</a>[[% } %]]</li>\r\n            [[/jalios:foreach]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(426,0);to=(426,12)]
                } while (_jspx_th_jalios_if_35.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_35 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_35.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_35.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(426,12);to=(427,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(427,0);to=(427,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_36 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_36.setPageContext(pageContext);
    _jspx_th_jalios_if_36.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_36.setPredicate( !isPublicationType && editor.equals("category") );
    try {
        int _jspx_eval_jalios_if_36 = _jspx_th_jalios_if_36.doStartTag();
        if (_jspx_eval_jalios_if_36 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_36 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_36.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_36.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(427,78);to=(428,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(428,37);to=(428,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(428,47);to=(430,46)]
                    out.write(")) { %]]\r\n            <ol>\r\n            [[jalios:foreach collection=\"[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(430,49);to=(430,57)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(430,59);to=(431,151)]
                    out.write(" %]]\" type=\"Category\" name=\"itCategory\" ]]\r\n              <li><a href=\"[[%= ResourceHelper.getQuery() %]]?cids=[[%= itCategory.getId() %]]\">[[%= itCategory.getAncestorString(channel.getCategory(\"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(431,154);to=(431,165)]
                    out.print( rootCatId );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(431,167);to=(435,0)]
                    out.write("\"), \" > \", true, userLang) %]]</a></li>\r\n            [[/jalios:foreach]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(435,0);to=(435,12)]
                } while (_jspx_th_jalios_if_36.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_36 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_36.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_36.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(435,12);to=(436,0)]
    out.write("\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(436,64);to=(437,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(437,0);to=(437,74)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_37 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_37.setPageContext(pageContext);
    _jspx_th_jalios_if_37.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_37.setPredicate( itField.isTypeMV() && editor.equals("link") );
    try {
        int _jspx_eval_jalios_if_37 = _jspx_th_jalios_if_37.doStartTag();
        if (_jspx_eval_jalios_if_37 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_37 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_37.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_37.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(437,74);to=(438,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(438,37);to=(438,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(438,47);to=(440,51)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[jalios:foreach name=\"itData\" type=\"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(440,54);to=(440,65)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(440,67);to=(440,69)]
                    out.write("\" ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(440,72);to=(440,91)]
                    out.print( foreachCollection );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(440,93);to=(440,100)]
                    out.write("=\"[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(440,103);to=(440,111)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(440,113);to=(443,0)]
                    out.write(" %]]\"]]\r\n              [[jalios:if predicate='[[%= itData != null && itData.canBeReadBy(loggedMember) %]]']]\r\n              <li>\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(443,2);to=(443,37)]
                     if (itField.isTypeDocumentMV()) { 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(443,39);to=(448,0)]
                    out.write("\r\n              [[jalios:link data='[[%= itData %]]' params='details=true' ]][[jalios:fileicon doc='[[%= itData %]]' /]][[/jalios:link]]\r\n              [[jalios:link data='[[%= itData %]]'/]]\r\n              - [[jalios:filesize doc='[[%= itData %]]'/]]\r\n              [[jalios:pdf doc='[[%= itData %]]' /]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(448,2);to=(448,12)]
                     } else { 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(448,14);to=(450,0)]
                    out.write("\r\n              [[jalios:link data='[[%= itData %]]'/]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(450,2);to=(450,5)]
                     } 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(450,7);to=(456,0)]
                    out.write("\r\n              </li>\r\n              [[/jalios:if]]\r\n              [[/jalios:foreach]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(456,0);to=(456,12)]
                } while (_jspx_th_jalios_if_37.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_37 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_37.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_37.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(456,12);to=(458,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(458,62);to=(459,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(459,0);to=(459,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_38 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_38.setPageContext(pageContext);
    _jspx_th_jalios_if_38.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_38.setPredicate( itField.isTypeScalar() && editor.equals("link") );
    try {
        int _jspx_eval_jalios_if_38 = _jspx_th_jalios_if_38.doStartTag();
        if (_jspx_eval_jalios_if_38 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_38 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_38.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_38.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(459,78);to=(460,40)]
                    out.write("\r\n            [[jalios:if predicate='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(460,43);to=(460,51)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(460,53);to=(460,65)]
                    out.write(" != null && ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(460,68);to=(460,76)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(460,78);to=(461,0)]
                    out.write(".canBeReadBy(loggedMember) %]]']]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(461,2);to=(461,35)]
                     if (itField.isTypeDocument()) { 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(461,37);to=(462,37)]
                    out.write("\r\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(462,40);to=(462,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(462,50);to=(462,108)]
                    out.write(" %]]' params='details=true' ]][[jalios:fileicon doc='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(462,111);to=(462,119)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(462,121);to=(463,37)]
                    out.write(" %]]' /]][[/jalios:link]]\r\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(463,40);to=(463,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(463,50);to=(464,43)]
                    out.write(" %]]'/]]\r\n            - [[jalios:filesize doc='[[%=  ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(464,46);to=(464,54)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(464,56);to=(465,35)]
                    out.write(" %]]'/]]\r\n            [[jalios:pdf doc='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(465,38);to=(465,46)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(465,48);to=(466,0)]
                    out.write(" %]]' /]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(466,2);to=(466,12)]
                     } else { 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(466,14);to=(467,37)]
                    out.write("\r\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(467,40);to=(467,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(467,50);to=(468,0)]
                    out.write(" %]]'/]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(468,2);to=(468,5)]
                     } 
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(468,7);to=(470,0)]
                    out.write("\r\n            [[/jalios:if]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(470,0);to=(470,12)]
                } while (_jspx_th_jalios_if_38.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_38 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_38.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_38.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(470,12);to=(472,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(472,76);to=(473,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(473,0);to=(473,104)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_39 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_39.setPageContext(pageContext);
    _jspx_th_jalios_if_39.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_39.setPredicate( itField.isTypeMV() && (editor.equals("member") || editor.equals("group")) );
    try {
        int _jspx_eval_jalios_if_39 = _jspx_th_jalios_if_39.doStartTag();
        if (_jspx_eval_jalios_if_39 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_39 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_39.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_39.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(473,104);to=(474,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(474,37);to=(474,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(474,47);to=(476,51)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[jalios:foreach name=\"itData\" type=\"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(476,54);to=(476,65)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(476,67);to=(476,69)]
                    out.write("\" ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(476,72);to=(476,91)]
                    out.print( foreachCollection );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(476,93);to=(476,100)]
                    out.write("=\"[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(476,103);to=(476,111)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(476,113);to=(483,0)]
                    out.write(" %]]\"]]\r\n              [[jalios:if predicate='[[%= itData != null %]]']]\r\n              <li>[[jalios:link data='[[%= itData %]]'/]]</li>\r\n              [[/jalios:if]]\r\n              [[/jalios:foreach]]\r\n            </ol>\r\n            [[% } %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(483,0);to=(483,12)]
                } while (_jspx_th_jalios_if_39.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_39 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_39.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_39.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(483,12);to=(485,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(485,72);to=(486,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(486,0);to=(486,108)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_40 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_40.setPageContext(pageContext);
    _jspx_th_jalios_if_40.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_40.setPredicate( itField.isTypeScalar() && (editor.equals("member") || editor.equals("group")) );
    try {
        int _jspx_eval_jalios_if_40 = _jspx_th_jalios_if_40.doStartTag();
        if (_jspx_eval_jalios_if_40 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_40 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_40.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_40.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(486,108);to=(487,40)]
                    out.write("\r\n            [[jalios:if predicate='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(487,43);to=(487,51)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(487,53);to=(488,37)]
                    out.write(" != null %]]']]\r\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(488,40);to=(488,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(488,50);to=(490,0)]
                    out.write(" %]]'/]]\r\n            [[/jalios:if]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(490,0);to=(490,12)]
                } while (_jspx_th_jalios_if_40.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_40 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_40.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_40.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(490,12);to=(492,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(492,62);to=(493,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(493,0);to=(493,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_41 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_41.setPageContext(pageContext);
    _jspx_th_jalios_if_41.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_41.setPredicate( itField.isTypeScalar() && editor.equals("date") );
    try {
        int _jspx_eval_jalios_if_41 = _jspx_th_jalios_if_41.doStartTag();
        if (_jspx_eval_jalios_if_41 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_41 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_41.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_41.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(493,78);to=(494,40)]
                    out.write("\r\n            [[jalios:if predicate='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(494,43);to=(494,51)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(494,53);to=(495,37)]
                    out.write(" != null %]]']]\r\n            [[jalios:date date='[[%= ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(495,40);to=(495,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(495,50);to=(495,70)]
                    out.write(" %]]' format='[[%= \"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(495,73);to=(495,85)]
                    out.print( dateFormat );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(495,87);to=(496,0)]
                    out.write("\" %]]'/]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(496,0);to=(496,42)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_42 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_42.setPageContext(pageContext);
                    _jspx_th_jalios_if_42.setParent(_jspx_th_jalios_if_41);
                    _jspx_th_jalios_if_42.setPredicate( !isDateOnly );
                    try {
                        int _jspx_eval_jalios_if_42 = _jspx_th_jalios_if_42.doStartTag();
                        if (_jspx_eval_jalios_if_42 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_42 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_42.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_42.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(496,42);to=(497,37)]
                              out.write("\r\n            [[jalios:time date='[[%= ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(497,40);to=(497,48)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(497,50);to=(497,70)]
                              out.write(" %]]' format='[[%= \"");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(497,73);to=(497,85)]
                              out.print( dateFormat );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(497,87);to=(498,0)]
                              out.write("\" %]]'/]]\r\n");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(498,0);to=(498,12)]
                          } while (_jspx_th_jalios_if_42.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_42 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_42.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_42.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(498,12);to=(500,0)]
              out.write("\r\n            [[/jalios:if]]\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(500,0);to=(500,12)]
          } while (_jspx_th_jalios_if_41.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_41 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_41.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_41.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(500,12);to=(502,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(502,63);to=(503,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(503,0);to=(503,74)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_43 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_43.setPageContext(pageContext);
    _jspx_th_jalios_if_43.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_43.setPredicate( itField.isTypeMV() && editor.equals("date") );
    try {
        int _jspx_eval_jalios_if_43 = _jspx_th_jalios_if_43.doStartTag();
        if (_jspx_eval_jalios_if_43 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_43 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_43.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_43.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(503,74);to=(504,34)]
                    out.write("\r\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(504,37);to=(504,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(504,47);to=(506,33)]
                    out.write(")) { %]]\r\n            <ol>\r\n              [[% for(Date date: ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(506,36);to=(506,44)]
                    out.print( getter );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(506,46);to=(509,67)]
                    out.write(") { %]]\r\n                [[jalios:if predicate='[[%= date != null %]]']]\r\n                <li>\r\n                  [[jalios:date date='[[%= date %]]' format='[[%= \"");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(509,70);to=(509,82)]
                    out.print( dateFormat );
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(509,84);to=(510,18)]
                    out.write("\" %]]'/]]\r\n                  ");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(510,18);to=(510,60)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_44 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_44.setPageContext(pageContext);
                    _jspx_th_jalios_if_44.setParent(_jspx_th_jalios_if_43);
                    _jspx_th_jalios_if_44.setPredicate( !isDateOnly );
                    try {
                        int _jspx_eval_jalios_if_44 = _jspx_th_jalios_if_44.doStartTag();
                        if (_jspx_eval_jalios_if_44 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_44 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_44.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_44.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(510,60);to=(511,67)]
                              out.write("\r\n                  [[jalios:time date='[[%= date %]]' format='[[%= \"");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(511,70);to=(511,82)]
                              out.print( dateFormat );
                          // end
                          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(511,84);to=(512,18)]
                              out.write("\" %]]'/]]\r\n                  ");

                          // end
                          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(512,18);to=(512,30)]
                          } while (_jspx_th_jalios_if_44.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_44 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_44.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_44.release();
              }
          // end
          // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(512,30);to=(518,0)]
              out.write("\r\n                </li>\r\n                [[/jalios:if]]\r\n              [[% } %]]\r\n            </ol>\r\n            [[% } %]]\r\n");

          // end
          // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(518,0);to=(518,12)]
          } while (_jspx_th_jalios_if_43.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_43 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_43.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_43.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(518,12);to=(520,0)]
    out.write("\r\n\r\n");

// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(520,54);to=(521,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(521,0);to=(521,57)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_45 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_45.setPageContext(pageContext);
    _jspx_th_jalios_if_45.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_45.setPredicate( editor.equals("sqlresult") );
    try {
        int _jspx_eval_jalios_if_45 = _jspx_th_jalios_if_45.doStartTag();
        if (_jspx_eval_jalios_if_45 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_45 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_45.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_45.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(521,57);to=(523,0)]
                    out.write("\r\n            [[jsp:include page=\"/jcore/doDisplaySQLQuery.jsp\"/]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(523,0);to=(523,12)]
                } while (_jspx_th_jalios_if_45.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_45 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_45.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_45.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(523,12);to=(526,0)]
    out.write("\r\n\r\n\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(526,0);to=(526,16)]
} while (_jspx_th_jalios_select_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_select_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_select_0.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(526,16);to=(528,0)]
    out.write("\r\n          </dd>\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(528,0);to=(528,57)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_46 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_46.setPageContext(pageContext);
    _jspx_th_jalios_if_46.setParent(_jspx_th_jalios_foreach_0);
    _jspx_th_jalios_if_46.setPredicate( editor.equals("sqlresult") );
    try {
        int _jspx_eval_jalios_if_46 = _jspx_th_jalios_if_46.doStartTag();
        if (_jspx_eval_jalios_if_46 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_46 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_46.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_46.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(528,57);to=(530,0)]
                    out.write("\r\n  [[% request.removeAttribute(\"sqr\"); %]]\r\n");

                // end
                // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(530,0);to=(530,12)]
                } while (_jspx_th_jalios_if_46.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_46 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_46.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_46.release();
    }
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(530,12);to=(531,0)]
    out.write("\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(531,0);to=(531,17)]
} while (_jspx_th_jalios_foreach_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_foreach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_foreach_0.release();
}
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(531,17);to=(552,0)]
    out.write("\r\n\r\n\r\n        </dl>\r\n\r\n        [[jalios:include target=\"SMARTPHONE_PUB_BODY_BOTTOM\" /]]\r\n      </div>[[%-- EOF .pub-body --%]]\r\n      [[% } %]]\r\n      \r\n      [[%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %]]\r\n      [[jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' /]]\r\n    </div>[[%-- EOF .pub --%]]\r\n    \r\n    <a data-role=\"none\" class=\"ui-btn\" href=\"[[%= pub.getDisplayUrl(userLocale) %>?[[%= SmartPhonePortalPolicyFilter.FORCE_NO_SMARTPHONE_SESSION_ATTR %]]\" data-ajax=\"false\">[[%= glp(\"jcmsplugin.smartphone.action.see-publication\") %]]</a>\r\n    [[jalios:include target=\"SMARTPHONE_PUB_FOOTER\" /]]\r\n  </div>[[%-- EOF .content --%]]\r\n</div>[[%-- EOF #pub-default --%]]\r\n[[%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %]]\r\n\r\n\r\n\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(552,2);to=(552,5)]
     } 
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(552,7);to=(554,0)]
    out.write("\r\n\r\n");

// end
// begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(554,2);to=(554,16)]
     out.flush(); 
// end
// HTML // begin [file="/../plugins/SmartPhonePlugin/templates/doSmartPhone_Type_FullDisplay.jsp";from=(554,18);to=(555,0)]
    out.write("\r\n");

// end

} catch (Throwable t) {
    if (out != null && out.getBufferSize() != 0)
        out.clearBuffer();
    if (pageContext != null) pageContext.handlePageException(t);
} finally {
    if (_jspxFactory != null) _jspxFactory.releasePageContext(pageContext);
}
}
}
