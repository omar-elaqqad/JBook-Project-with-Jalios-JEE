import com.jalios.util.*;
import  java.io.*;
import  java.util.*;
import  java.text.*;
import  java.net.*;
import  org.jdom.*;
import  com.jalios.jcms.*;
import  com.jalios.jcms.widget.*;
import  com.jalios.jcms.taglib.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jalios.jspengine.runtime.*;


public class doEdit_0005fType_0005f$jsp extends HttpJspBase {


    static {
    }
    public doEdit_0005fType_0005f$jsp( ) {
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
            			"", true, 0, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/doEdit_Type_.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(1,42);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(2,170);to=(3,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(3,44);to=(4,0)]
                out.write("\n");

            // end
            // begin [file="/doEdit_Type_.jsp";from=(4,2);to=(48,0)]
                  request.setCharacterEncoding("UTF-8");
                
                final Channel channel = Channel.getChannel();
                
                Element typeElt       = (Element) session.getAttribute("typeElt");
                List    exTypeList    = (List)    session.getAttribute("extendedTypeList");
                boolean isExtension   = typeElt == null;
                        typeElt       = isExtension ? (Element)session.getAttribute("extensionElt") : typeElt;
                String  superclass    = Util.getString(typeElt.getAttributeValue("superclass"), "");
                boolean isForm        = typeElt.getAttribute("formAuthor") != null;
                boolean isFileDocument= TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
                String  className     = isExtension ? Util.getClassShortName(typeElt.getAttributeValue("type")) + "Extension" : typeElt.getAttributeValue("name");
                String  formHandler   = isExtension ? "extFormHandler" : "formHandler";
                String  currentTab    = null;
                
                // EXTENSION
                String  extensionTab  = isExtension ? Util.getString(typeElt.getAttributeValue("tab"),"") : null;
                String  getPubClass   = isExtension ? "extFormHandler.getExtensionClass()" : "formHandler.getPublicationClass()";
                
                // UNUSED
                String  getAuthor     = formHandler + (isForm ? ".getAvailableAuthor()" : ".getLoggedMember()");
                boolean categorizable = Util.toBoolean(typeElt.getAttributeValue("categorizable"), false);
                
                
                // ALL FIELDS (filtered)
                TreeSet catIdSet = new TreeSet();
                List fieldEntryList = new ArrayList(Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next(); 
                  if ("sqlresult".equals(fieldEntry.getEditor())) { 
                    it.remove(); 
                  }
                }
                
                //ALL INHERITED FIELDS
                ArrayList<org.jdom.Element> fieldList = new ArrayList<org.jdom.Element>();
                TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);
                for(org.jdom.Element itField: fieldList) {
                  String editor = itField.getAttributeValue("editor"); 
                  if (editor.equals("category")) { 
                    catIdSet.add(itField.getAttributeValue("root")); 
                  }  
                }
                
            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(48,2);to=(51,12)]
                out.write("\n[[%-- This file has been automatically generated. --%]]\n[[%--\n  @Summary: ");

            // end
            // begin [file="/doEdit_Type_.jsp";from=(51,15);to=(51,26)]
                out.print( className );
            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(51,28);to=(60,0)]
                out.write(" content editor\n  @Category: Generated\n  @Author: JCMS Type Processor \n  @Customizable: True\n  @Requestable: False \n--%]]\n[[%@ page contentType=\"text/html; charset=UTF-8\" %]]\n\n\n");

            // end
            // begin [file="/doEdit_Type_.jsp";from=(60,2);to=(60,23)]
                 if (!isExtension) { 
            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(60,25);to=(63,6)]
                out.write("\n[[%@ include file='/jcore/doInitPage.jspf' %]]\n[[% \n  Edit");

            // end
            // begin [file="/doEdit_Type_.jsp";from=(63,9);to=(63,20)]
                out.print( className );
            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(63,22);to=(63,49)]
                out.write("Handler formHandler = (Edit");

            // end
            // begin [file="/doEdit_Type_.jsp";from=(63,52);to=(63,63)]
                out.print( className );
            // end
            // HTML // begin [file="/doEdit_Type_.jsp";from=(63,65);to=(64,0)]
                out.write("Handler)request.getAttribute(\"formHandler\");\n");

            // end
            // begin [file="/doEdit_Type_.jsp";from=(64,0);to=(64,61)]
                /* ----  jalios:if ---- */
                com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                _jspx_th_jalios_if_0.setPageContext(pageContext);
                _jspx_th_jalios_if_0.setParent(null);
                _jspx_th_jalios_if_0.setPredicate( exTypeList.contains(className) );
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
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(64,61);to=(65,6)]
                              out.write("\n  Edit");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(65,9);to=(65,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(65,22);to=(65,61)]
                              out.write("ExtensionHandler extFormHandler = (Edit");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(65,64);to=(65,75)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(65,77);to=(66,0)]
                              out.write("ExtensionHandler)request.getAttribute(\"extFormHandler\");\n");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(66,0);to=(66,12)]
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
          // HTML // begin [file="/doEdit_Type_.jsp";from=(66,12);to=(68,56)]
              out.write("\n  ServletUtil.backupAttribute(pageContext, \"classBeingProcessed\");\n  request.setAttribute(\"classBeingProcessed\", generated.");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(68,59);to=(68,70)]
              out.print( className );
          // end
          // HTML // begin [file="/doEdit_Type_.jsp";from=(68,72);to=(70,0)]
              out.write(".class);\n%]]\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(70,2);to=(70,5)]
               } 
          // end
          // HTML // begin [file="/doEdit_Type_.jsp";from=(70,7);to=(72,0)]
              out.write("\n\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(72,2);to=(72,65)]
               if (isFileDocument && !superclass.startsWith("generated.")) { 
          // end
          // HTML // begin [file="/doEdit_Type_.jsp";from=(72,67);to=(74,0)]
              out.write("\n[[jsp:include page=\"/types/FileDocument/doEditFileDocument.jsp\" /]]\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(74,2);to=(74,5)]
               } 
          // end
          // HTML // begin [file="/doEdit_Type_.jsp";from=(74,7);to=(75,0)]
              out.write("\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(75,2);to=(83,0)]
               
                String previousTab = null;
                Set tabSet = new LinkedHashSet();
                for (Iterator it = fieldEntryList.iterator() ; it.hasNext() ; ){
                  String tab = ((TypeFieldEntry)it.next()).getTab();
                  if (Util.notEmpty(tab)){ tabSet.add(tab); }
                  if (Util.isEmpty(currentTab)){ currentTab = tab; }
                }
          // end
          // HTML // begin [file="/doEdit_Type_.jsp";from=(83,2);to=(84,0)]
              out.write("\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(84,0);to=(84,32)]
              /* ----  jalios:buffer ---- */
              com.jalios.jtaglib.BufferTag _jspx_th_jalios_buffer_0 = new com.jalios.jtaglib.BufferTag();
              _jspx_th_jalios_buffer_0.setPageContext(pageContext);
              _jspx_th_jalios_buffer_0.setParent(null);
              _jspx_th_jalios_buffer_0.setName("tabheader");
              try {
                  int _jspx_eval_jalios_buffer_0 = _jspx_th_jalios_buffer_0.doStartTag();
                  if (_jspx_eval_jalios_buffer_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_buffer_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_buffer_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_buffer_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(84,32);to=(85,0)]
                              out.write("\n");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(85,2);to=(85,32)]
                               if (Util.notEmpty(tabSet)) { 
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(85,34);to=(88,4)]
                              out.write("\n[[% if(!formHandler.isPartialFieldEdition()) { %]]\n  <ul class=\"nav nav-tabs nav-tabs-underlined is-left-aligned\">\n    ");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(88,4);to=(88,74)]
                              /* ----  jalios:foreach ---- */
                              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                              _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                              _jspx_th_jalios_foreach_0.setParent(_jspx_th_jalios_buffer_0);
                              _jspx_th_jalios_foreach_0.setCollection( tabSet );
                              _jspx_th_jalios_foreach_0.setName("itTab");
                              _jspx_th_jalios_foreach_0.setType("String");
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
                              String itTab = null;
                              itTab = (String) pageContext.findAttribute("itTab");
                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(88,76);to=(89,4)]
                              
                                  
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(89,6);to=(89,9)]
                              out.write("<li");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(89,12);to=(89,63)]
                              out.print( currentTab.equals(itTab) ? " class='active'" : "" );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(89,65);to=(89,76)]
                              out.write("><a href=\"#");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(89,79);to=(89,90)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(89,92);to=(89,93)]
                              out.write("_");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(89,96);to=(89,103)]
                              out.print( itTab );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(89,105);to=(89,140)]
                              out.write("_tab\" onclick=\"return false;\">[[%= ");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(89,143);to=(89,156)]
                              out.print( formHandler );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(89,158);to=(89,172)]
                              out.write(".getTabLabel(\"");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(89,175);to=(89,182)]
                              out.print( itTab );
                          // end
                          // HTML // begin [file="/doEdit_Type_.jsp";from=(89,184);to=(90,4)]
                              out.write("\") %]]</a></li>\n    ");

                          // end
                          // begin [file="/doEdit_Type_.jsp";from=(90,4);to=(90,21)]
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
          // HTML // begin [file="/doEdit_Type_.jsp";from=(90,21);to=(93,0)]
              out.write("\n  </ul>\n[[% } %]]\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(93,2);to=(93,5)]
               } 
          // end
          // HTML // begin [file="/doEdit_Type_.jsp";from=(93,7);to=(94,0)]
              out.write("\n");

          // end
          // begin [file="/doEdit_Type_.jsp";from=(94,0);to=(94,16)]
          } while (_jspx_th_jalios_buffer_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_buffer_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_buffer_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_buffer_0.release();
}
String tabheader = null;
tabheader = (String) pageContext.findAttribute("tabheader");
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(94,16);to=(95,0)]
    out.write("\n");

// end
// begin [file="/doEdit_Type_.jsp";from=(95,2);to=(95,28)]
     boolean isSuper = false; 
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(95,30);to=(96,0)]
    out.write("\n");

// end
// begin [file="/doEdit_Type_.jsp";from=(96,0);to=(96,93)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_1 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_1.setPageContext(pageContext);
    _jspx_th_jalios_foreach_1.setParent(null);
    _jspx_th_jalios_foreach_1.setCollection( fieldEntryList );
    _jspx_th_jalios_foreach_1.setName("itFieldEntry");
    _jspx_th_jalios_foreach_1.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_1 = _jspx_th_jalios_foreach_1.doStartTag();
        if (_jspx_eval_jalios_foreach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_1.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(96,93);to=(97,0)]
                    out.write("\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(97,2);to=(111,0)]
                     
                      String name         = itFieldEntry.getName();
                      String nameCap      = itFieldEntry.getNameCap();
                      String editor       = itFieldEntry.getEditor();
                      String catFieldName = isExtension ? name : "cids" + (itFieldEntry.isExclusive() ? itFieldEntry.getNameCap() : "");
                      String fieldName   = name;
                      String type         = itFieldEntry.getType();  
                      String tab          = itFieldEntry.getTab();
                      
                      if (Util.notEmpty(tab) && tabheader != null) {
                        out.println(tabheader);
                        tabheader = null;
                      }
                      
                // end
                // begin [file="/doEdit_Type_.jsp";from=(111,4);to=(113,9)]
                     if (Util.notEmpty(tab) && !tab.equals(previousTab)) {
                           if (previousTab == null) {
                             
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(113,11);to=(113,120)]
                    out.write("<div[[%= !formHandler.isPartialFieldEdition() ? \" class='tab-content jalios-tab-template clearfix'\" : \"\" %]]>");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(113,122);to=(116,9)]
                    
                           }
                           if (previousTab != null) {
                             
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(116,11);to=(116,17)]
                    out.write("</div>");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(116,19);to=(117,9)]
                    
                           } 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(117,11);to=(117,20)]
                    out.write("<div id=\"");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(117,23);to=(117,34)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(117,36);to=(117,37)]
                    out.write("_");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(117,40);to=(117,45)]
                    out.print( tab );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(117,47);to=(117,113)]
                    out.write("_tab\"[[%= !formHandler.isPartialFieldEdition() ? \" class='tab-pane");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(117,116);to=(117,157)]
                    out.print( currentTab.equals(tab) ? " active" : "" );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(117,159);to=(117,171)]
                    out.write("'\" : \"\" %]]>");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(117,173);to=(120,7)]
                    
                           previousTab = tab;
                         } else if(Util.isEmpty(tab) && previousTab != null) {
                           
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(120,9);to=(120,15)]
                    out.write("</div>");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(120,17);to=(122,7)]
                    
                           previousTab = null;
                         } 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(122,9);to=(124,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(124,61);to=(125,0)]
                    out.write("\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(125,2);to=(125,33)]
                     if (itFieldEntry.isSuper()) { 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(125,35);to=(126,0)]
                    out.write("\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(126,2);to=(126,18)]
                     isSuper = true;
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(126,20);to=(128,40)]
                    out.write("\n[[%-- SUPER ------------------------------------------------------------ --%]]\n[[% request.setAttribute(\"formHandler\", ");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(128,43);to=(128,56)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(128,58);to=(129,27)]
                    out.write("); %]]\n[[jsp:include page=\"/types/");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(129,30);to=(129,66)]
                    out.print( Util.getClassShortName(superclass) );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(129,68);to=(129,75)]
                    out.write("/doEdit");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(129,78);to=(129,114)]
                    out.print( Util.getClassShortName(superclass) );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(129,116);to=(131,0)]
                    out.write(".jsp\" /]]\n\n");

                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(131,61);to=(132,0)]
                    out.write("\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(132,2);to=(132,29)]
                     } else if (isExtension) { 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(132,31);to=(134,6)]
                    out.write("\n\n[[%-- ");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(134,9);to=(134,18)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(134,20);to=(135,21)]
                    out.write(" ------------------------------------------------------------ --%]]\n[[jalios:field name=\"");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(135,24);to=(135,35)]
                    out.print( fieldName );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(135,37);to=(135,57)]
                    out.write("\" formHandler=\"[[%= ");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(135,60);to=(135,73)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(135,75);to=(139,0)]
                    out.write(" %]]\"]]\n  [[jalios:control /]]\n[[/jalios:field]]\n\n");

                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(139,61);to=(140,0)]
                    out.write("\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(140,2);to=(140,41)]
                     } else if (itFieldEntry.isWidget()) { 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(140,43);to=(142,6)]
                    out.write("\n\n[[%-- ");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(142,9);to=(142,18)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(142,20);to=(143,21)]
                    out.write(" ------------------------------------------------------------ --%]]\n[[jalios:field name=\"");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(143,24);to=(143,35)]
                    out.print( fieldName );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(143,37);to=(143,57)]
                    out.write("\" formHandler=\"[[%= ");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(143,60);to=(143,73)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(143,75);to=(147,0)]
                    out.write(" %]]\"]]\n  [[jalios:control /]]\n[[/jalios:field]]\n\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(147,2);to=(147,5)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(147,7);to=(148,0)]
                    out.write(" \n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(148,0);to=(148,17)]
                } while (_jspx_th_jalios_foreach_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_1.release();
    }
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(148,17);to=(149,0)]
    out.write("\n");

// end
// begin [file="/doEdit_Type_.jsp";from=(149,2);to=(149,29)]
     if (previousTab != null){ 
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(149,31);to=(149,61)]
    out.write("</div>[[%-- End last tab --%]]");

// end
// begin [file="/doEdit_Type_.jsp";from=(149,63);to=(149,66)]
     } 
// end
// begin [file="/doEdit_Type_.jsp";from=(149,70);to=(149,100)]
     if (Util.notEmpty(tabSet)) { 
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(149,102);to=(149,137)]
    out.write("</div>[[%-- End 'tab-content' --%]]");

// end
// begin [file="/doEdit_Type_.jsp";from=(149,139);to=(149,142)]
     } 
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(149,144);to=(156,0)]
    out.write("\n\n\n[[%\n{ \n  TreeSet  removedCatSet = new TreeSet(); \n  Category itRemoveCat = null;\n");

// end
// begin [file="/doEdit_Type_.jsp";from=(156,0);to=(156,74)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_2 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_2.setPageContext(pageContext);
    _jspx_th_jalios_foreach_2.setParent(null);
    _jspx_th_jalios_foreach_2.setCollection( catIdSet );
    _jspx_th_jalios_foreach_2.setType("String");
    _jspx_th_jalios_foreach_2.setName("itCatId");
    try {
        int _jspx_eval_jalios_foreach_2 = _jspx_th_jalios_foreach_2.doStartTag();
        if (_jspx_eval_jalios_foreach_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_2.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itCatId = null;
                    itCatId = (String) pageContext.findAttribute("itCatId");
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(156,74);to=(157,37)]
                    out.write("\n  itRemoveCat = channel.getCategory(\"");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(157,40);to=(157,49)]
                    out.print( itCatId );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(157,51);to=(159,0)]
                    out.write("\");\n  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(159,0);to=(159,17)]
                } while (_jspx_th_jalios_foreach_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_2.release();
    }
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(159,17);to=(160,24)]
    out.write("\n  request.setAttribute(\"");

// end
// begin [file="/doEdit_Type_.jsp";from=(160,27);to=(160,38)]
    out.print( className );
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(160,40);to=(164,0)]
    out.write(".removedCatSet\", removedCatSet);\n}  \n%]]\n\n");

// end
// begin [file="/doEdit_Type_.jsp";from=(164,0);to=(164,43)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_1.setPageContext(pageContext);
    _jspx_th_jalios_if_1.setParent(null);
    _jspx_th_jalios_if_1.setPredicate( !isExtension );
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
                // HTML // begin [file="/doEdit_Type_.jsp";from=(164,43);to=(165,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(165,59);to=(166,0)]
                    out.write("\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(166,2);to=(166,69)]
                     if (Util.isEmpty(currentTab) && exTypeList.contains(className)) { 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(166,71);to=(167,26)]
                    out.write("\n[[%@ include file=\"/types/");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(167,29);to=(167,40)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(167,42);to=(167,58)]
                    out.write("Extension/doEdit");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(167,61);to=(167,72)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(167,74);to=(168,0)]
                    out.write("Extension.jspf\" %]]\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(168,2);to=(168,5)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(168,7);to=(170,0)]
                    out.write("\n\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(170,2);to=(170,74)]
                     if ( ! isSuper) {  // already rendered in super import, some line above
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(170,76);to=(171,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(171,59);to=(173,0)]
                    out.write("\n[[jalios:include target=\"EDIT_PUB_MAINTAB\" targetContext=\"div\" /]]\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(173,2);to=(173,5)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(173,7);to=(175,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/doEdit_Type_.jsp";from=(175,59);to=(177,0)]
                    out.write("\n[[jalios:include jsp=\"/jcore/doEditExtraData.jsp\" /]]\n");

                // end
                // begin [file="/doEdit_Type_.jsp";from=(177,0);to=(177,12)]
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
// HTML // begin [file="/doEdit_Type_.jsp";from=(177,12);to=(180,0)]
    out.write("\n\n[[% ServletUtil.restoreAttribute(pageContext , \"classBeingProcessed\"); %]]\n");

// end
// begin [file="/doEdit_Type_.jsp";from=(180,2);to=(180,16)]
     out.flush(); 
// end
// HTML // begin [file="/doEdit_Type_.jsp";from=(180,18);to=(181,0)]
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
