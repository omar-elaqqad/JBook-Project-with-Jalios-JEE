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


public class do_0005fType_0005fFullDisplay$jsp extends HttpJspBase {


    static {
    }
    public do_0005fType_0005fFullDisplay$jsp( ) {
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

            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(1,145);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(2,44);to=(3,0)]
                out.write("\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(3,2);to=(45,0)]
                
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
                boolean categorizable = Util.getString(typeElt.getAttributeValue("categorizable"), "false").equals("true");
                
                boolean isForm    = TypeUtil.isSubTypeOf(typeElt, Form.class);
                boolean isPortlet = TypeUtil.isSubTypeOf(typeElt, PortalElement.class);
                
                String superclass = Util.getString(typeElt.getAttributeValue("superclass"), "");
                
                // Get the fields (and the inherited fields), 
                List fieldEntryList = Util.getArrayList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry itField = (TypeFieldEntry)it.next();
                  if (itField.isHidden()) {
                    it.remove();
                  }
                }
                
                boolean unitFieldEdition = isPublicationType && Util.getString(typeElt.getAttributeValue("unitFieldEdition"), "true").equals("true");
                
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(45,2);to=(49,12)]
                out.write("\n[[%@ page contentType=\"text/html; charset=UTF-8\" %]][[%\n%]][[%-- This file has been automatically generated. --%]][[%\n%]][[%--\n  @Summary: ");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(49,15);to=(49,26)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(49,28);to=(55,0)]
                out.write(" display page\n  @Category: Generated\n  @Author: JCMS Type Processor\n  @Customizable: True\n  @Requestable: True\n--%]][[%\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(55,2);to=(55,25)]
                 if (isFileDocument) { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(55,27);to=(57,0)]
                out.write("\n%]][[%@ include file='/types/FileDocument/doFileDocumentFullDisplay.jsp' %]]\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(57,2);to=(57,12)]
                 } else { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(57,14);to=(58,0)]
                out.write("\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(58,2);to=(60,25)]
                
                // PUBLICATION TYPE 
                if (isPublicationType) { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(60,27);to=(62,0)]
                out.write("\n%]][[%@ include file='/jcore/doInitPage.jspf' %]][[%\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(62,2);to=(62,20)]
                 if (isPortlet) { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(62,22);to=(62,86)]
                out.write("%]][[%@ include file='/jcore/portal/doPortletParams.jspf' %]][[%");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(62,88);to=(62,91)]
                 } 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(62,93);to=(63,0)]
                out.write("\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(63,2);to=(66,17)]
                
                boolean titleSearchable = Util.toBoolean(typeElt.getChild("title").getAttribute("searchable"), true);
                
                if (isPortlet) { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(66,19);to=(67,7)]
                out.write("\n%]][[% ");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(67,10);to=(67,21)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(67,23);to=(67,31)]
                out.write(" obj = (");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(67,34);to=(67,45)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(67,47);to=(68,0)]
                out.write(")portlet; %]][[%\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(68,2);to=(68,12)]
                 } else { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(68,14);to=(69,7)]
                out.write("\n%]][[% ");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(69,10);to=(69,21)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(69,23);to=(69,31)]
                out.write(" obj = (");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(69,34);to=(69,45)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(69,47);to=(70,0)]
                out.write(")request.getAttribute(PortalManager.PORTAL_PUBLICATION); %]][[%\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(70,2);to=(70,5)]
                 } 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(70,7);to=(72,24)]
                out.write("\n%]][[%@ include file='/front/doFullDisplay.jspf' %]]\n<div class=\"fullDisplay ");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(72,27);to=(72,38)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(72,40);to=(77,0)]
                out.write(" [[%= obj.canBeEditedFieldByField(loggedMember) ? \"unitFieldEdition\" : \"\" %]]\" itemscope=\"itemscope\">\n\n[[%@ include file='/front/publication/doPublicationHeader.jspf' %]]\n\n<table class=\"fields\">\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(77,2);to=(79,9)]
                
                // EXTENSION 
                } else { 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(79,11);to=(81,1)]
                out.write("\n%]][[%\n ");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(81,4);to=(81,15)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(81,17);to=(81,31)]
                out.write(" extension = (");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(81,34);to=(81,45)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(81,47);to=(83,19)]
                out.write(") obj.getExtension();\n if (extension == null) {\n   extension = new ");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(83,22);to=(83,33)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(83,35);to=(86,0)]
                out.write("();\n }\n%]]\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(86,2);to=(86,5)]
                 } 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(86,7);to=(88,0)]
                out.write("\n\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(88,2);to=(88,58)]
                 String data = isPublicationType ? "obj" : "extension"; 
            // end
            // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(88,60);to=(90,0)]
                out.write("\n\n");

            // end
            // begin [file="/do_Type_FullDisplay.jsp";from=(90,0);to=(90,88)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(90,88);to=(91,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(91,2);to=(144,0)]
                              
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(144,2);to=(145,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(145,0);to=(145,57)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(145,57);to=(146,34)]
                              out.write("\n  [[% request.setAttribute(\"sqr\", ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(146,37);to=(146,45)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(146,47);to=(147,0)]
                              out.write("); %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(147,0);to=(147,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(147,12);to=(148,19)]
              out.write("\n  <tr class=\"field ");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(148,22);to=(148,28)]
              out.print( name );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(148,30);to=(148,31)]
              out.write(" ");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(148,34);to=(148,45)]
              out.print( editorCSS );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(148,47);to=(148,48)]
              out.write(" ");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(148,51);to=(148,81)]
              out.print( isAbstract ? "abstract" : "" );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(148,83);to=(148,84)]
              out.write(" ");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(148,87);to=(148,104)]
              out.print( isEmptySelector );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(148,106);to=(149,28)]
              out.write("\">\n    <td class='field-label'>");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(149,31);to=(149,38)]
              out.print( label );
          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(149,42);to=(149,67)]
               if (unitFieldEdition) { 
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(149,69);to=(149,93)]
              out.write("[[jalios:edit pub='[[%= ");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(149,96);to=(149,102)]
              out.print( data );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(149,104);to=(149,118)]
              out.write(" %]]' fields='");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(149,121);to=(149,127)]
              out.print( name );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(149,129);to=(149,133)]
              out.write("'/]]");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(149,135);to=(149,138)]
               } 
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(149,140);to=(150,27)]
              out.write("</td>\n    <td class='field-data' ");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(150,29);to=(150,63)]
               if (type.startsWith("String")) { 
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(150,65);to=(150,75)]
              out.write("[[%= gfla(");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(150,78);to=(150,84)]
              out.print( data );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(150,86);to=(150,89)]
              out.write(", \"");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(150,92);to=(150,98)]
              out.print( name );
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(150,100);to=(150,106)]
              out.write("\") %]]");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(150,108);to=(150,111)]
               } 
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(150,113);to=(152,0)]
              out.write(">\n\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(152,0);to=(152,15)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(152,15);to=(154,0)]
                              out.write("\n\n");

                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(154,73);to=(155,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(155,0);to=(155,83)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(155,83);to=(156,38)]
                              out.write("\n        [[% if (Util.notEmpty(sqrArray");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(156,41);to=(156,50)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(156,52);to=(158,43)]
                              out.write(")) { %]]\n            <ol>\n              [[% SQLQueryResult[] sqrArray");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(158,46);to=(158,55)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(158,57);to=(158,60)]
                              out.write(" = ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(158,63);to=(158,69)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(158,71);to=(158,75)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(158,78);to=(158,87)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(158,89);to=(159,84)]
                              out.write("SQR(); %>\n              [[jalios:foreach name=\"sqr\" type=\"SQLQueryResult\" array=\"[[%= sqrArray");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(159,87);to=(159,96)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(159,98);to=(168,0)]
                              out.write(" %]]\"]]\n              <li>\n                [[% request.setAttribute(\"sqr\", sqr); %]]\n                [[jsp:include page=\"/jcore/doDisplaySQLQuery.jsp\"/]]\n                [[% request.removeAttribute(\"sqr\"); %]]\n              </li>\n              [[/jalios:foreach]]\n            </ol>\n        [[% } %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(168,0);to=(168,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(168,12);to=(170,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(170,73);to=(171,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(171,0);to=(171,83)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(171,83);to=(173,31)]
                              out.write("\n            [[% { \n            String[] labels =  ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(173,34);to=(173,40)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(173,42);to=(173,46)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(173,49);to=(173,58)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(173,60);to=(174,31)]
                              out.write("Label();\n            String[] params =  ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(174,34);to=(174,40)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(174,42);to=(174,46)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(174,49);to=(174,58)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(174,60);to=(184,0)]
                              out.write("DisplayParams();\n            %]]\n            [[% if (labels != null && params != null && labels.length > 0 ) { %]]\n            <ol>\n              [[% for(int i = 0; i < labels.length; i++) { %]]\n              <li><a href=\"jcore/displayDBRecord.jsp?[[%= params[i] %]]\">[[%= labels[i] %]]</a></li>\n              [[% } %]]\n            </ol>\n            [[% } %]]\n            [[% } %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(184,0);to=(184,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(184,12);to=(186,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(186,77);to=(187,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(187,0);to=(187,80)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(187,80);to=(188,30)]
                              out.write("\n        [[% if (Util.notEmpty(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(188,33);to=(188,39)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(188,41);to=(188,45)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(188,48);to=(188,57)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(188,59);to=(188,60)]
                              out.write("(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(188,63);to=(188,90)]
                              out.print( fieldML ? "userLang" : "" );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(188,92);to=(190,59)]
                              out.write("))) { %]]\n            <ol>\n            [[jalios:foreach name=\"itString\" type=\"String\" ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(190,62);to=(190,81)]
                              out.print( foreachCollection );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(190,83);to=(190,90)]
                              out.write("=\"[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(190,93);to=(190,99)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(190,101);to=(190,105)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(190,108);to=(190,117)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(190,119);to=(190,120)]
                              out.write("(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(190,123);to=(190,150)]
                              out.print( fieldML ? "userLang" : "" );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(190,152);to=(193,0)]
                              out.write(") %]]\"]]\n            [[% if (Util.notEmpty(itString)) { %]]\n              <li>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(193,0);to=(193,15)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(193,15);to=(195,0)]
                              out.write("\n\n");

                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(195,62);to=(196,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(196,0);to=(196,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(196,53);to=(197,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(197,2);to=(197,17)]
                               if (resize) { 
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(197,19);to=(198,84)]
                              out.write("\n              <p>[[jalios:thumbnail path='[[%= Util.encodeUrl(itString) %]]' width='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(198,87);to=(198,100)]
                              out.print( resizeWidth );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(198,102);to=(198,112)]
                              out.write("' height='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(198,115);to=(198,129)]
                              out.print( resizeHeight );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(198,131);to=(199,0)]
                              out.write("' /]]</p>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(199,2);to=(199,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(199,14);to=(201,0)]
                              out.write("\n              <p><img src='[[%= Util.encodeUrl(itString) %]]' alt='' /></p>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(201,2);to=(201,5)]
                               } 
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(201,7);to=(202,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(202,0);to=(202,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(202,12);to=(204,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(204,62);to=(205,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(205,0);to=(205,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(205,53);to=(207,0)]
                              out.write("\n              <p>[[jalios:media path='[[%= Util.encodeUrl(itString) %]]' /]]</p>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(207,0);to=(207,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(207,12);to=(209,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(209,60);to=(210,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(210,0);to=(210,51)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(210,51);to=(211,41)]
                              out.write("\n              <a href='[[%= itString %]]'");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(211,44);to=(211,80)]
                              out.print( openWindow ? "target='blank'" : "" );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(211,82);to=(212,0)]
                              out.write(">[[%= itString %]]</a>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(212,0);to=(212,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(212,12);to=(214,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(214,62);to=(215,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(215,0);to=(215,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(215,53);to=(217,0)]
                              out.write("\n              <a href='mailto:[[%= itString %]]'>[[%= itString %]]</a>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(217,0);to=(217,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(217,12);to=(219,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(219,65);to=(220,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(220,0);to=(220,56)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(220,56);to=(222,0)]
                              out.write("\n              ******\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(222,0);to=(222,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(222,12);to=(224,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(224,59);to=(225,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(225,0);to=(225,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(225,53);to=(228,35)]
                              out.write("\n              [[%= itString %]]\n              <ul style=\"list-style-type: none; padding: 0\">\n              [[jalios:query name='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(228,38);to=(228,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(228,46);to=(229,35)]
                              out.write("ResultSet' queryString='[[%= itString %]]' />\n              [[jalios:pager name=\"");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(229,38);to=(229,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(229,46);to=(229,93)]
                              out.write("Pager\" declare='true' action=\"init\" size=\"[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(229,96);to=(229,102)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(229,104);to=(231,48)]
                              out.write("ResultSet.size() %]]\"/>\n              [[jalios:foreach counter='itCounter2'\n                               collection='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(231,51);to=(231,57)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(231,59);to=(234,41)]
                              out.write("ResultSet %]]' \n                               type='Publication' \n                               name='itPub' \n                               max='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(234,44);to=(234,50)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(234,52);to=(235,42)]
                              out.write("Pager.getPageSize() %]]'\n                               skip='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(235,45);to=(235,51)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(235,53);to=(237,47)]
                              out.write("Pager.getStart() %]]'\n                               >\n              <li>[[%= itCounter2.intValue() + ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(237,50);to=(237,56)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(237,58);to=(240,35)]
                              out.write("Pager.getStart() %]]. [[jalios:link data='[[%= itPub %]]'/]]</li>\n              [[/jalios:foreach>\n              </ul>\n              [[jalios:pager name=\"");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(240,38);to=(240,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(240,46);to=(241,0)]
                              out.write("Pager\" /> \n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(241,0);to=(241,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(241,12);to=(243,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(243,69);to=(244,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(244,0);to=(244,69)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(244,69);to=(246,0)]
                              out.write("\n              [[jalios:wiki]][[%= itString %]][[/jalios:wiki]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(246,0);to=(246,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(246,12);to=(248,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(248,62);to=(249,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(249,0);to=(249,56)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(249,56);to=(251,0)]
                              out.write("\n              [[%= itString %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(251,0);to=(251,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(251,12);to=(253,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(253,61);to=(254,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(254,0);to=(254,55)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(254,55);to=(255,58)]
                              out.write("\n              [[jalios:wysiwyg data='[[%= obj %]]' field='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(255,61);to=(255,67)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(255,69);to=(256,0)]
                              out.write("']][[%= itString %]][[/jalios:wysiwyg]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(256,0);to=(256,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(256,12);to=(258,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(258,65);to=(259,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(259,0);to=(259,57)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(259,57);to=(260,17)]
                              out.write("\n            [[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(260,20);to=(260,26)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(260,28);to=(260,32)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(260,35);to=(260,44)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(260,46);to=(261,0)]
                              out.write("Label(itString, userLang) %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(261,0);to=(261,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(261,12);to=(263,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(263,63);to=(264,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(264,0);to=(264,16)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(264,16);to=(266,0)]
                              out.write("\n              [[%= itString %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(266,0);to=(266,17)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(266,17);to=(267,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(267,0);to=(267,16)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(267,16);to=(273,0)]
    out.write("\n              </li>\n            [[% } %]]\n            [[/jalios:foreach]]\n            </ol>\n        [[% } %]]\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(273,0);to=(273,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(273,12);to=(275,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(275,62);to=(276,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(276,0);to=(276,78)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(276,78);to=(277,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(277,37);to=(277,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(277,47);to=(278,0)]
                    out.write(")) { %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(278,0);to=(278,15)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(278,15);to=(280,0)]
                              out.write("\n\n");

                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(280,62);to=(281,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(281,0);to=(281,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(281,53);to=(282,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(282,2);to=(282,17)]
                               if (resize) { 
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(282,19);to=(283,62)]
                              out.write("\n              <p>[[jalios:thumbnail path='[[%= Util.encodeUrl(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(283,65);to=(283,73)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(283,75);to=(283,89)]
                              out.write(") %]]' width='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(283,92);to=(283,105)]
                              out.print( resizeWidth );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(283,107);to=(283,117)]
                              out.write("' height='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(283,120);to=(283,134)]
                              out.print( resizeHeight );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(283,136);to=(284,0)]
                              out.write("' /]]</p>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(284,2);to=(284,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(284,14);to=(285,42)]
                              out.write("\n            <img src='[[%= Util.encodeUrl(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(285,45);to=(285,53)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(285,55);to=(286,0)]
                              out.write(") %]]' alt='' />\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(286,2);to=(286,5)]
                               } 
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(286,7);to=(287,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(287,0);to=(287,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(287,12);to=(289,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(289,60);to=(290,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(290,0);to=(290,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(290,53);to=(291,58)]
                              out.write("\n              <p>[[jalios:media path='[[%= Util.encodeUrl(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(291,61);to=(291,69)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(291,71);to=(292,0)]
                              out.write(") %]]' /]]</p>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(292,0);to=(292,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(292,12);to=(294,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(294,60);to=(295,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(295,0);to=(295,51)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(295,51);to=(296,26)]
                              out.write("\n            <a href='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(296,29);to=(296,37)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(296,39);to=(296,45)]
                              out.write(" %]]' ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(296,48);to=(296,84)]
                              out.print( openWindow ? "target='blank'" : "" );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(296,86);to=(296,92)]
                              out.write(">[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(296,95);to=(296,103)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(296,105);to=(297,0)]
                              out.write("%]]</a>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(297,0);to=(297,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(297,12);to=(299,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(299,62);to=(300,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(300,0);to=(300,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(300,53);to=(301,33)]
                              out.write("\n            <a href='mailto:[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(301,36);to=(301,44)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(301,46);to=(301,57)]
                              out.write(" %]]'>[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(301,60);to=(301,68)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(301,70);to=(302,0)]
                              out.write("%]]</a>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(302,0);to=(302,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(302,12);to=(304,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(304,65);to=(305,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(305,0);to=(305,56)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(305,56);to=(307,0)]
                              out.write("\n            ******\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(307,0);to=(307,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(307,12);to=(309,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(309,59);to=(310,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(310,0);to=(310,53)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(310,53);to=(312,33)]
                              out.write("\n            <ul style=\"list-style-type: none; padding: 0\">\n            [[jalios:query name='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(312,36);to=(312,42)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(312,44);to=(312,73)]
                              out.write("ResultSet' queryString='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(312,76);to=(312,84)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(312,86);to=(313,33)]
                              out.write(" %]]' />\n            [[jalios:pager name=\"");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(313,36);to=(313,42)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(313,44);to=(313,91)]
                              out.write("Pager\" declare='true' action=\"init\" size=\"[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(313,94);to=(313,100)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(313,102);to=(314,46)]
                              out.write("ResultSet.size() %]]\"/>\n            [[jalios:foreach collection='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(314,49);to=(314,55)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(314,57);to=(317,39)]
                              out.write("ResultSet %]]' \n                             type='Publication' \n                             name='itPub' \n                             max='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(317,42);to=(317,48)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(317,50);to=(318,40)]
                              out.write("Pager.getPageSize() %]]'\n                             skip='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(318,43);to=(318,49)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(318,51);to=(320,44)]
                              out.write("Pager.getStart() %]]'\n                             >\n            <li>[[%= itCounter.intValue() + ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(320,47);to=(320,53)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(320,55);to=(322,33)]
                              out.write("Pager.getStart() %]]. [[jalios:link data='[[%= itPub %]]'/]]</li>\n            [[/jalios:foreach>\n            [[jalios:pager name=\"");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(322,36);to=(322,42)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(322,44);to=(324,0)]
                              out.write("Pager\" />\n            </ul>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(324,0);to=(324,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(324,12);to=(326,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(326,69);to=(327,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(327,0);to=(327,69)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(327,69);to=(328,32)]
                              out.write("\n            [[jalios:wiki]][[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(328,35);to=(328,43)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(328,45);to=(329,0)]
                              out.write(" %]][[/jalios:wiki]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(329,0);to=(329,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(329,12);to=(331,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(331,62);to=(332,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(332,0);to=(332,56)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(332,56);to=(333,17)]
                              out.write("\n            [[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(333,20);to=(333,28)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(333,30);to=(334,0)]
                              out.write(" %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(334,0);to=(334,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(334,12);to=(336,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(336,61);to=(337,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(337,0);to=(337,55)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(337,55);to=(338,56)]
                              out.write("\n            [[jalios:wysiwyg data='[[%= obj %]]' field='");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(338,59);to=(338,65)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(338,67);to=(338,75)]
                              out.write("']][[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(338,78);to=(338,86)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(338,88);to=(339,0)]
                              out.write(" %]][[/jalios:wysiwyg]]            \n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(339,0);to=(339,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(339,12);to=(341,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(341,63);to=(342,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(342,0);to=(342,57)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(342,57);to=(343,17)]
                              out.write("\n            [[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(343,20);to=(343,26)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(343,28);to=(343,32)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(343,35);to=(343,44)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(343,46);to=(343,52)]
                              out.write("Label(");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(343,55);to=(343,63)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(343,65);to=(344,0)]
                              out.write(", userLang) %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(344,0);to=(344,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(344,12);to=(346,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(346,62);to=(347,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(347,0);to=(347,56)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(347,56);to=(348,51)]
                              out.write("\n            [[% request.setAttribute(\"dataSource\", ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(348,54);to=(348,60)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(348,62);to=(348,66)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(348,69);to=(348,78)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(348,80);to=(349,49)]
                              out.write("DataSource()); %]]\n            [[% request.setAttribute(\"sqlQuery\", ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(349,52);to=(349,60)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(349,62);to=(350,53)]
                              out.write("); %]]\n            [[% request.setAttribute(\"maxRows\", \"\" + ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(350,56);to=(350,62)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(350,64);to=(350,68)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(350,71);to=(350,80)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(350,82);to=(352,0)]
                              out.write("MaxRows()); %]]\n            [[jsp:include page=\"/jcore/doDisplaySQLQuery.jsp\"/]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(352,0);to=(352,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(352,12);to=(354,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(354,62);to=(355,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(355,0);to=(355,56)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(355,56);to=(356,52)]
                              out.write("\n            <a href=\"jcore/displayDBRecord.jsp?[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(356,55);to=(356,61)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(356,63);to=(356,67)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(356,70);to=(356,79)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(356,81);to=(356,107)]
                              out.write("DisplayParams() %]]\">[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(356,110);to=(356,116)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(356,118);to=(356,122)]
                              out.write(".get");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(356,125);to=(356,134)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(356,136);to=(357,0)]
                              out.write("Label() %]]</a>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(357,0);to=(357,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(357,12);to=(359,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(359,63);to=(360,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(360,0);to=(360,16)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(360,16);to=(361,17)]
                              out.write("\n            [[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(361,20);to=(361,28)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(361,30);to=(362,0)]
                              out.write(" %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(362,0);to=(362,17)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(362,17);to=(364,0)]
              out.write("\n\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(364,0);to=(364,16)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(364,16);to=(366,0)]
    out.write("\n            [[% } %]]\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(366,0);to=(366,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(366,12);to=(368,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(368,59);to=(369,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(369,0);to=(369,77)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(369,77);to=(370,12)]
                    out.write("\n            ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(370,15);to=(370,27)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(370,29);to=(370,39)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(370,42);to=(370,53)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(370,55);to=(370,114)]
                    out.write("[[% */ %]][[%= NumberFormat.getInstance(userLocale).format(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(370,117);to=(370,125)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(370,127);to=(370,132)]
                    out.write(") %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(370,135);to=(370,146)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(370,148);to=(371,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(371,0);to=(371,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(371,12);to=(373,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(373,62);to=(374,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(374,0);to=(374,78)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(374,78);to=(375,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(375,2);to=(375,62)]
                     String decimalPattern = "#." + Util.repeat("#", decimals); 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(375,64);to=(376,12)]
                    out.write("\n            ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(376,15);to=(376,27)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(376,29);to=(376,39)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(376,42);to=(376,53)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(376,55);to=(376,90)]
                    out.write("[[% */ %]][[%= (new DecimalFormat(\"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(376,93);to=(376,109)]
                    out.print( decimalPattern );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(376,111);to=(376,122)]
                    out.write("\")).format(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(376,125);to=(376,133)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(376,135);to=(376,140)]
                    out.write(") %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(376,143);to=(376,154)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(376,156);to=(377,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(377,0);to=(377,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(377,12);to=(379,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(379,64);to=(380,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(380,0);to=(380,82)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(380,82);to=(381,41)]
                    out.write("\n            [[jalios:duration time='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(381,44);to=(381,52)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(381,54);to=(382,0)]
                    out.write(" * 1000L %]]'/]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(382,0);to=(382,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(382,12);to=(384,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(384,62);to=(385,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(385,0);to=(385,73)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(385,73);to=(386,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(386,37);to=(386,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(386,47);to=(388,33)]
                    out.write(")) { %]]\n            <ol>\n              [[% for(int value: ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(388,36);to=(388,44)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(388,46);to=(389,18)]
                    out.write(") { %]]\n              <li>");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(389,21);to=(389,33)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(389,35);to=(389,45)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(389,48);to=(389,59)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(389,61);to=(389,130)]
                    out.write("[[% */ %]][[%= NumberFormat.getInstance(userLocale).format(value) %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(389,133);to=(389,144)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(389,146);to=(393,0)]
                    out.write("</li>\n              [[% } %]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(393,0);to=(393,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(393,12);to=(395,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(395,64);to=(396,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(396,0);to=(396,76)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(396,76);to=(397,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(397,2);to=(397,62)]
                     String decimalPattern = "#." + Util.repeat("#", decimals); 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(397,64);to=(398,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(398,37);to=(398,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(398,47);to=(400,36)]
                    out.write(")) { %]]\n            <ol>\n              [[% for(double value: ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(400,39);to=(400,47)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(400,49);to=(401,18)]
                    out.write(") { %]]\n              <li>");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(401,21);to=(401,33)]
                    out.print( unitBefore );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(401,35);to=(401,45)]
                    out.write("[[% /* %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(401,48);to=(401,59)]
                    out.print( 123456789 );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(401,61);to=(401,96)]
                    out.write("[[% */ %]][[%= (new DecimalFormat(\"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(401,99);to=(401,115)]
                    out.print( decimalPattern );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(401,117);to=(401,138)]
                    out.write("\")).format(value) %]]");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(401,141);to=(401,152)]
                    out.print( unitAfter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(401,154);to=(405,0)]
                    out.write("</li>\n              [[% } %]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(405,0);to=(405,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(405,12);to=(407,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(407,67);to=(408,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(408,0);to=(408,78)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(408,78);to=(409,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(409,37);to=(409,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(409,47);to=(411,34)]
                    out.write(")) { %]]\n            <ol>\n              [[% for(long value: ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(411,37);to=(411,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(411,47);to=(416,0)]
                    out.write(") { %]]\n              <li>[[jalios:duration time='[[%= value * 1000L %]]'/]]</li>\n              [[% } %]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(416,0);to=(416,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(416,12);to=(418,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(418,62);to=(419,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(419,0);to=(419,81)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(419,81);to=(420,17)]
                    out.write("\n            [[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(420,20);to=(420,26)]
                    out.print( data );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(420,28);to=(420,32)]
                    out.write(".get");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(420,35);to=(420,44)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(420,46);to=(421,0)]
                    out.write("Label(userLang) %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(421,0);to=(421,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(421,12);to=(423,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(423,66);to=(424,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(424,0);to=(424,77)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(424,77);to=(425,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(425,37);to=(425,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(425,47);to=(427,65)]
                    out.write(")) { %]]\n            <ol>\n              [[% TypeFieldEntry tfe = channel.getTypeFieldEntry(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(427,68);to=(427,79)]
                    out.print( className );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(427,81);to=(427,90)]
                    out.write(".class, \"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(427,93);to=(427,99)]
                    out.print( name );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(427,101);to=(428,37)]
                    out.write("\", true); %]]\n              [[% for(boolean value: ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(428,40);to=(428,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(428,50);to=(433,0)]
                    out.write(") { %]]\n              <li>[[%= value ? tfe.getOnLabel(userLang) : tfe.getOffLabel(userLang) %]]</li>\n              [[% } %]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(433,0);to=(433,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(433,12);to=(435,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(435,66);to=(436,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(436,0);to=(436,77)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(436,77);to=(437,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(437,37);to=(437,43)]
                    out.print( data );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(437,45);to=(437,49)]
                    out.write(".get");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(437,52);to=(437,61)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(437,63);to=(439,46)]
                    out.write("(loggedMember))) { %]]\n            <ol>\n            [[jalios:foreach collection=\"[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(439,49);to=(439,55)]
                    out.print( data );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(439,57);to=(439,61)]
                    out.write(".get");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(439,64);to=(439,73)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(439,75);to=(440,184)]
                    out.write("(loggedMember) %]]\" type=\"Category\" name=\"itCategory\" ]]\n              <li>[[% if (itCategory != null) { %]]<a href=\"[[%= ResourceHelper.getQuery() %]]?cids=[[%= itCategory.getId() %]]\">[[%= itCategory.getAncestorString(channel.getCategory(\"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(440,187);to=(440,198)]
                    out.print( rootCatId );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(440,200);to=(444,0)]
                    out.write("\"), \" > \", true, userLang) %]]</a>[[% } %]]</li>\n            [[/jalios:foreach]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(444,0);to=(444,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(444,12);to=(445,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(445,0);to=(445,78)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(445,78);to=(446,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(446,37);to=(446,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(446,47);to=(448,46)]
                    out.write(")) { %]]\n            <ol>\n            [[jalios:foreach collection=\"[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(448,49);to=(448,57)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(448,59);to=(449,151)]
                    out.write(" %]]\" type=\"Category\" name=\"itCategory\" ]]\n              <li><a href=\"[[%= ResourceHelper.getQuery() %]]?cids=[[%= itCategory.getId() %]]\">[[%= itCategory.getAncestorString(channel.getCategory(\"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(449,154);to=(449,165)]
                    out.print( rootCatId );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(449,167);to=(453,0)]
                    out.write("\"), \" > \", true, userLang) %]]</a></li>\n            [[/jalios:foreach]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(453,0);to=(453,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(453,12);to=(454,0)]
    out.write("\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(454,64);to=(455,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(455,0);to=(455,74)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(455,74);to=(456,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(456,37);to=(456,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(456,47);to=(458,51)]
                    out.write(")) { %]]\n            <ol>\n              [[jalios:foreach name=\"itData\" type=\"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(458,54);to=(458,65)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(458,67);to=(458,69)]
                    out.write("\" ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(458,72);to=(458,91)]
                    out.print( foreachCollection );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(458,93);to=(458,100)]
                    out.write("=\"[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(458,103);to=(458,111)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(458,113);to=(461,0)]
                    out.write(" %]]\"]]\n              [[% if (itData != null && itData.canBeReadBy(loggedMember)) { %]]\n              <li>\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(461,2);to=(461,37)]
                     if (itField.isTypeDocumentMV()) { 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(461,39);to=(466,0)]
                    out.write("\n              [[jalios:link data='[[%= itData %]]' params='details=true' ]][[jalios:fileicon doc='[[%= itData %]]' /]][[/jalios:link]]\n              [[jalios:link data='[[%= itData %]]'/]]\n              - [[jalios:filesize doc='[[%= itData %]]'/]]\n              [[jalios:pdf doc='[[%= itData %]]' /]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(466,2);to=(466,12)]
                     } else { 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(466,14);to=(468,0)]
                    out.write("\n              [[jalios:link data='[[%= itData %]]'/]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(468,2);to=(468,5)]
                     } 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(468,7);to=(474,0)]
                    out.write("\n              </li>\n              [[% } %]]\n              [[/jalios:foreach]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(474,0);to=(474,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(474,12);to=(476,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(476,62);to=(477,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(477,0);to=(477,78)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(477,78);to=(478,20)]
                    out.write("\n            [[% if (");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(478,23);to=(478,31)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(478,33);to=(478,45)]
                    out.write(" != null && ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(478,48);to=(478,56)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(478,58);to=(479,0)]
                    out.write(".canBeReadBy(loggedMember)) { %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(479,2);to=(479,35)]
                     if (itField.isTypeDocument()) { 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(479,37);to=(480,37)]
                    out.write("\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(480,40);to=(480,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(480,50);to=(480,108)]
                    out.write(" %]]' params='details=true' ]][[jalios:fileicon doc='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(480,111);to=(480,119)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(480,121);to=(481,37)]
                    out.write(" %]]' /]][[/jalios:link]]\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(481,40);to=(481,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(481,50);to=(482,43)]
                    out.write(" %]]'/]]\n            - [[jalios:filesize doc='[[%=  ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(482,46);to=(482,54)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(482,56);to=(483,35)]
                    out.write(" %]]'/]]\n            [[jalios:pdf doc='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(483,38);to=(483,46)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(483,48);to=(484,0)]
                    out.write(" %]]' /]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(484,2);to=(484,12)]
                     } else { 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(484,14);to=(485,37)]
                    out.write("\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(485,40);to=(485,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(485,50);to=(486,0)]
                    out.write(" %]]'/]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(486,2);to=(486,5)]
                     } 
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(486,7);to=(488,0)]
                    out.write("\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(488,0);to=(488,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(488,12);to=(490,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(490,76);to=(491,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(491,0);to=(491,104)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(491,104);to=(492,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(492,37);to=(492,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(492,47);to=(494,51)]
                    out.write(")) { %]]\n            <ol>\n              [[jalios:foreach name=\"itData\" type=\"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(494,54);to=(494,65)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(494,67);to=(494,69)]
                    out.write("\" ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(494,72);to=(494,91)]
                    out.print( foreachCollection );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(494,93);to=(494,100)]
                    out.write("=\"[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(494,103);to=(494,111)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(494,113);to=(501,0)]
                    out.write(" %]]\"]]\n              [[% if (itData != null ) { %]]\n              <li>[[jalios:link data='[[%= itData %]]'/]]</li>\n              [[% } %]]\n              [[/jalios:foreach]]\n            </ol>\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(501,0);to=(501,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(501,12);to=(503,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(503,72);to=(504,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(504,0);to=(504,108)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(504,108);to=(505,20)]
                    out.write("\n            [[% if (");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(505,23);to=(505,31)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(505,33);to=(506,37)]
                    out.write(" != null) { %]]\n            [[jalios:link data='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(506,40);to=(506,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(506,50);to=(508,0)]
                    out.write(" %]]'/]]\n            [[% } %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(508,0);to=(508,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(508,12);to=(510,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(510,62);to=(511,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(511,0);to=(511,78)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(511,78);to=(512,21)]
                    out.write("\n            [[%  if (");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(512,24);to=(512,32)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(512,34);to=(513,37)]
                    out.write(" != null) { %]]\n            [[jalios:date date='[[%= ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(513,40);to=(513,48)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(513,50);to=(513,70)]
                    out.write(" %]]' format='[[%= \"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(513,73);to=(513,85)]
                    out.print( dateFormat );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(513,87);to=(514,0)]
                    out.write("\" %]]'/]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(514,0);to=(514,42)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(514,42);to=(515,37)]
                              out.write("\n            [[jalios:time date='[[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(515,40);to=(515,48)]
                              out.print( getter );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(515,50);to=(515,70)]
                              out.write(" %]]' format='[[%= \"");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(515,73);to=(515,85)]
                              out.print( dateFormat );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(515,87);to=(516,0)]
                              out.write("\" %]]'/]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(516,0);to=(516,12)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(516,12);to=(518,0)]
              out.write("\n            [[% } %]]\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(518,0);to=(518,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(518,12);to=(520,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(520,63);to=(521,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(521,0);to=(521,74)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(521,74);to=(522,34)]
                    out.write("\n            [[% if (Util.notEmpty(");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(522,37);to=(522,45)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(522,47);to=(524,33)]
                    out.write(")) { %]]\n            <ol>\n              [[% for(Date date: ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(524,36);to=(524,44)]
                    out.print( getter );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(524,46);to=(527,67)]
                    out.write(") { %]]\n                [[% if (date != null ) { %]]\n                <li>\n                  [[jalios:date date='[[%= date %]]' format='[[%= \"");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(527,70);to=(527,82)]
                    out.print( dateFormat );
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(527,84);to=(528,18)]
                    out.write("\" %]]'/]]\n                  ");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(528,18);to=(528,60)]
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
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(528,60);to=(529,67)]
                              out.write("\n                  [[jalios:time date='[[%= date %]]' format='[[%= \"");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(529,70);to=(529,82)]
                              out.print( dateFormat );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(529,84);to=(530,18)]
                              out.write("\" %]]'/]]\n                  ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(530,18);to=(530,30)]
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
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(530,30);to=(536,0)]
              out.write("\n                </li>\n                [[% } %]]\n              [[% } %]]\n            </ol>\n            [[% } %]]\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(536,0);to=(536,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(536,12);to=(538,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(538,54);to=(539,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(539,0);to=(539,57)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(539,57);to=(541,0)]
                    out.write("\n            [[jsp:include page=\"/jcore/doDisplaySQLQuery.jsp\"/]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(541,0);to=(541,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(541,12);to=(544,0)]
    out.write("\n\n\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(544,0);to=(544,16)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(544,16);to=(547,0)]
    out.write("\n    </td>\n  </tr>\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(547,0);to=(547,57)]
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
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(547,57);to=(549,0)]
                    out.write("\n  [[% request.removeAttribute(\"sqr\"); %]]\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(549,0);to=(549,12)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(549,12);to=(550,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(550,0);to=(550,17)]
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
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(550,17);to=(552,0)]
    out.write("\n\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(552,0);to=(552,48)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_47 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_47.setPageContext(pageContext);
    _jspx_th_jalios_if_47.setParent(null);
    _jspx_th_jalios_if_47.setPredicate( isPublicationType );
    try {
        int _jspx_eval_jalios_if_47 = _jspx_th_jalios_if_47.doStartTag();
        if (_jspx_eval_jalios_if_47 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_47 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_47.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_47.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(552,48);to=(554,0)]
                    out.write(" \n\n");

                // end
                // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(554,91);to=(555,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_FullDisplay.jsp";from=(555,0);to=(555,95)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_48 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_48.setPageContext(pageContext);
                    _jspx_th_jalios_if_48.setParent(_jspx_th_jalios_if_47);
                    _jspx_th_jalios_if_48.setPredicate( extendedTypeList != null && extendedTypeList.contains(className) );
                    try {
                        int _jspx_eval_jalios_if_48 = _jspx_th_jalios_if_48.doStartTag();
                        if (_jspx_eval_jalios_if_48 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_48 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_48.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_48.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(555,95);to=(556,28)]
                              out.write(" \n  [[%@ include file=\"/types/");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(556,31);to=(556,42)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(556,44);to=(556,56)]
                              out.write("Extension/do");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(556,59);to=(556,70)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(556,72);to=(557,0)]
                              out.write("ExtensionFullDisplay.jspf\" %]]\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(557,0);to=(557,12)]
                          } while (_jspx_th_jalios_if_48.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_48 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_48.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_48.release();
              }
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(557,12);to=(559,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(559,85);to=(560,0)]
              out.write("\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(560,0);to=(560,37)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_49 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_49.setPageContext(pageContext);
              _jspx_th_jalios_if_49.setParent(_jspx_th_jalios_if_47);
              _jspx_th_jalios_if_49.setPredicate( isForm );
              try {
                  int _jspx_eval_jalios_if_49 = _jspx_th_jalios_if_49.doStartTag();
                  if (_jspx_eval_jalios_if_49 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_49 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_49.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_49.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(560,37);to=(561,46)]
                              out.write("\n  <tr class=\"field submit-member member [[%=  ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(561,49);to=(561,55)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(561,57);to=(566,14)]
                              out.write(".getSubmitMember() != null ? \"\" : \"empty\" %]]\">\n    <td class='field-label'>\n      [[% /* %]]Submit member[[% */ %]][[%= glp(\"ui.work.forms.lbl.submit-mbr\") %]]\n    </td>\n    <td class='field-data'>\n      [[% if (");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(566,17);to=(566,23)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(566,25);to=(567,61)]
                              out.write(".getSubmitMember() != null) { %]]\n      <a href=\"[[%= ResourceHelper.getQuery() %]]?mids=[[%=  ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(567,64);to=(567,70)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(567,72);to=(567,139)]
                              out.write(".getSubmitMember().getId() %]]\">[[% /* %]]John Smith[[% */ %]][[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(567,142);to=(567,148)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(567,150);to=(571,44)]
                              out.write(".getSubmitMember() %]]</a>\n      [[% } %]]\n    </td>\n  </tr>\n  <tr class=\"field submit-remote-addr [[%=  ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(571,47);to=(571,53)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(571,55);to=(576,42)]
                              out.write(".getSubmitRemoteAddr() != null ? \"\" : \"empty\" %]]\">\n    <td class='field-label'>\n      [[% /* %]]IP address[[% */ %]][[%= glp(\"ui.work.forms.lbl.submit-ip\") %]]\n    </td>\n    <td class='field-data'>\n      [[% /* %]]10.10.10.10[[% */ %]][[%= ");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(576,45);to=(576,51)]
                              out.print( data );
                          // end
                          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(576,53);to=(579,0)]
                              out.write(".getSubmitRemoteAddr() %]]\n    </td>\n  </tr>\n");

                          // end
                          // begin [file="/do_Type_FullDisplay.jsp";from=(579,0);to=(579,12)]
                          } while (_jspx_th_jalios_if_49.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_49 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_49.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_49.release();
              }
          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(579,12);to=(583,0)]
              out.write("\n\n</table>\n\n");

          // end
          // HTML // begin [file="/do_Type_FullDisplay.jsp";from=(583,74);to=(586,0)]
              out.write("\n[[jsp:include page=\"/front/doFullDisplayCommonFields.jsp\" /]]\n</div>\n");

          // end
          // begin [file="/do_Type_FullDisplay.jsp";from=(586,0);to=(586,12)]
          } while (_jspx_th_jalios_if_47.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_47 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_47.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_47.release();
}
// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(586,12);to=(587,0)]
    out.write("\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(587,2);to=(587,5)]
     } 
// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(587,7);to=(589,0)]
    out.write("\n\n");

// end
// begin [file="/do_Type_FullDisplay.jsp";from=(589,2);to=(589,16)]
     out.flush(); 
// end
// HTML // begin [file="/do_Type_FullDisplay.jsp";from=(589,18);to=(590,0)]
    out.write("\n");

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
