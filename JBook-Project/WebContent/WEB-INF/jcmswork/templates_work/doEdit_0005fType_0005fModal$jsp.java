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


public class doEdit_0005fType_0005fModal$jsp extends HttpJspBase {


    static {
    }
    public doEdit_0005fType_0005fModal$jsp( ) {
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

            // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(0,50);to=(1,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(1,42);to=(2,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(2,170);to=(3,0)]
                out.write("\r\n");

            // end
            // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(3,44);to=(4,0)]
                out.write("\r\n");

            // end
            // begin [file="/doEdit_Type_Modal.jsp";from=(4,2);to=(34,0)]
                 request.setCharacterEncoding("UTF-8");
                
                final Channel channel = Channel.getChannel();
                
                Element typeElt       = (Element) session.getAttribute("typeElt");
                List    exTypeList    = (List)    session.getAttribute("extendedTypeList");
                boolean isExtension   = typeElt == null;
                        typeElt       = isExtension ? (Element)session.getAttribute("extensionElt") : typeElt;
                String  superclass    = Util.getString(typeElt.getAttributeValue("superclass"), "");
                boolean isForm        = typeElt.getAttribute("formAuthor") != null;
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
                List fieldEntryList = new ArrayList(Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
                  if ("sqlresult".equals(fieldEntry.getEditor())) { it.remove(); }
                }
                
            // end
            // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(34,2);to=(37,12)]
                out.write("\r\n[[%-- This file has been automatically generated. --%]]\r\n[[%--\r\n  @Summary: ");

            // end
            // begin [file="/doEdit_Type_Modal.jsp";from=(37,15);to=(37,26)]
                out.print( className );
            // end
            // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(37,28);to=(46,0)]
                out.write(" modal content editor\r\n  @Category: Generated\r\n  @Author: JCMS Type Processor\r\n  @Customizable: True\r\n  @Requestable: False\r\n--%]]\r\n[[%@ page contentType=\"text/html; charset=UTF-8\" %]]\r\n\r\n\r\n");

            // end
            // begin [file="/doEdit_Type_Modal.jsp";from=(46,0);to=(46,43)]
                /* ----  jalios:if ---- */
                com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                _jspx_th_jalios_if_0.setPageContext(pageContext);
                _jspx_th_jalios_if_0.setParent(null);
                _jspx_th_jalios_if_0.setPredicate( !isExtension );
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
                          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(46,43);to=(49,6)]
                              out.write("\r\n[[%@ include file='/jcore/doInitPage.jspf' %]]\r\n[[%\r\n  Edit");

                          // end
                          // begin [file="/doEdit_Type_Modal.jsp";from=(49,9);to=(49,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(49,22);to=(49,49)]
                              out.write("Handler formHandler = (Edit");

                          // end
                          // begin [file="/doEdit_Type_Modal.jsp";from=(49,52);to=(49,63)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(49,65);to=(50,0)]
                              out.write("Handler)request.getAttribute(\"formHandler\");\r\n");

                          // end
                          // begin [file="/doEdit_Type_Modal.jsp";from=(50,0);to=(50,61)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_1.setPageContext(pageContext);
                              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_if_0);
                              _jspx_th_jalios_if_1.setPredicate( exTypeList.contains(className) );
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
                          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(50,61);to=(51,6)]
                              out.write("\r\n  Edit");

                          // end
                          // begin [file="/doEdit_Type_Modal.jsp";from=(51,9);to=(51,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(51,22);to=(51,61)]
                              out.write("ExtensionHandler extFormHandler = (Edit");

                          // end
                          // begin [file="/doEdit_Type_Modal.jsp";from=(51,64);to=(51,75)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(51,77);to=(52,0)]
                              out.write("ExtensionHandler)request.getAttribute(\"extFormHandler\");\r\n");

                          // end
                          // begin [file="/doEdit_Type_Modal.jsp";from=(52,0);to=(52,12)]
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
          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(52,12);to=(54,56)]
              out.write("\r\n  ServletUtil.backupAttribute(pageContext, \"classBeingProcessed\");\r\n  request.setAttribute(\"classBeingProcessed\", generated.");

          // end
          // begin [file="/doEdit_Type_Modal.jsp";from=(54,59);to=(54,70)]
              out.print( className );
          // end
          // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(54,72);to=(56,0)]
              out.write(".class);\r\n%]]\r\n");

          // end
          // begin [file="/doEdit_Type_Modal.jsp";from=(56,0);to=(56,12)]
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
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(56,12);to=(58,0)]
    out.write("\r\n\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(58,2);to=(67,0)]
    
      String previousTab = null;
      Set tabSet = new LinkedHashSet();
      for (Iterator it = fieldEntryList.iterator() ; it.hasNext() ; ){
        String tab = ((TypeFieldEntry)it.next()).getTab();
        if (Util.notEmpty(tab)){ tabSet.add(tab); }
        if (currentTab == null){ currentTab = tab; }
      }
      if (Util.notEmpty(tabSet)) {
// end
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(67,2);to=(69,0)]
    out.write("\r\n<ul class=\"nav nav-tabs\">\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(69,0);to=(69,70)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_0.setPageContext(pageContext);
    _jspx_th_jalios_foreach_0.setParent(null);
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
                // begin [file="/doEdit_Type_Modal.jsp";from=(69,72);to=(70,0)]
                    
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(70,2);to=(70,6)]
                    out.write("<li ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(70,9);to=(70,54)]
                    out.print( currentTab == itTab ? "class='active'" : "" );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(70,56);to=(70,67)]
                    out.write("><a href=\"#");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(70,70);to=(70,81)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(70,83);to=(70,84)]
                    out.write("_");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(70,87);to=(70,94)]
                    out.print( itTab );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(70,96);to=(70,131)]
                    out.write("_tab\" onclick=\"return false;\">[[%= ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(70,134);to=(70,147)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(70,149);to=(70,163)]
                    out.write(".getTabLabel(\"");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(70,166);to=(70,173)]
                    out.print( itTab );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(70,175);to=(71,0)]
                    out.write("\") %]]</a></li>\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(71,0);to=(71,17)]
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
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(71,17);to=(73,0)]
    out.write("\r\n</ul>\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(73,2);to=(73,5)]
     } 
// end
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(73,7);to=(75,0)]
    out.write("\r\n\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(75,0);to=(75,93)]
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
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(75,93);to=(76,0)]
                    out.write("\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(76,2);to=(84,0)]
                    
                      String name         = itFieldEntry.getName();
                      String nameCap      = itFieldEntry.getNameCap();
                      String editor       = itFieldEntry.getEditor();
                      String fieldName    = name;
                      String type         = itFieldEntry.getType();
                      String tab          = itFieldEntry.getTab();
                    
                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(84,4);to=(85,31)]
                     if (Util.notEmpty(tab) && !tab.equals(previousTab)){
                         if (previousTab == null){ 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(85,33);to=(85,87)]
                    out.write("<div class=\"tab-content jalios-tab-template clearfix\">");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(85,89);to=(86,31)]
                     }
                         if (previousTab != null){ 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(86,33);to=(86,39)]
                    out.write("</div>");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(86,41);to=(86,44)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(86,46);to=(86,55)]
                    out.write("<div id=\"");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(86,58);to=(86,69)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(86,71);to=(86,72)]
                    out.write("_");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(86,75);to=(86,80)]
                    out.print( tab );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(86,82);to=(86,104)]
                    out.write("_tab\" class='tab-pane ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(86,107);to=(86,142)]
                    out.print( currentTab == tab ? "active" : "" );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(86,144);to=(86,146)]
                    out.write("'>");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(86,148);to=(86,170)]
                     previousTab = tab; } 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(86,172);to=(88,0)]
                    out.write("\r\n\r\n");

                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(88,61);to=(89,0)]
                    out.write("\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(89,2);to=(89,33)]
                     if (itFieldEntry.isSuper()) { 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(89,35);to=(91,0)]
                    out.write("\r\n\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(91,2);to=(91,49)]
                     if (previousTab != null){ previousTab = null; 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(91,51);to=(91,57)]
                    out.write("</div>");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(91,59);to=(91,62)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(91,64);to=(92,15)]
                    out.write("\r\n</div><div id=\"");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(92,18);to=(92,29)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(92,31);to=(93,40)]
                    out.write("_super_tab\" class=\"clearfix separator\">\r\n[[% request.setAttribute(\"formHandler\", ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(93,43);to=(93,56)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(93,58);to=(94,27)]
                    out.write("); %]]\r\n[[jsp:include page=\"/types/");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(94,30);to=(94,66)]
                    out.print( Util.getClassShortName(superclass) );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(94,68);to=(94,75)]
                    out.write("/doEdit");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(94,78);to=(94,114)]
                    out.print( Util.getClassShortName(superclass) );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(94,116);to=(97,0)]
                    out.write("Modal.jsp\" /]]\r\n</div>\r\n\r\n");

                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(97,61);to=(98,0)]
                    out.write("\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(98,2);to=(98,29)]
                     } else if (isExtension) { 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(98,31);to=(100,6)]
                    out.write("\r\n\r\n[[%-- ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(100,9);to=(100,18)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(100,20);to=(101,21)]
                    out.write(" ------------------------------------------------------------ --%]]\r\n[[jalios:field name=\"");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(101,24);to=(101,35)]
                    out.print( fieldName );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(101,37);to=(101,57)]
                    out.write("\" formHandler=\"[[%= ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(101,60);to=(101,73)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(101,75);to=(105,0)]
                    out.write(" %]]\"]]\r\n  [[jalios:control /]]\r\n[[/jalios:field]]\r\n\r\n");

                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(105,61);to=(106,0)]
                    out.write("\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(106,2);to=(106,41)]
                     } else if (itFieldEntry.isWidget()) { 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(106,43);to=(108,6)]
                    out.write("\r\n\r\n[[%-- ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(108,9);to=(108,18)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(108,20);to=(109,21)]
                    out.write(" ------------------------------------------------------------ --%]]\r\n[[jalios:field name=\"");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(109,24);to=(109,35)]
                    out.print( fieldName );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(109,37);to=(109,57)]
                    out.write("\" formHandler=\"[[%= ");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(109,60);to=(109,73)]
                    out.print( formHandler );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(109,75);to=(113,0)]
                    out.write(" %]]\"]]\r\n  [[jalios:control /]]\r\n[[/jalios:field]]\r\n\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(113,2);to=(113,5)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(113,7);to=(114,0)]
                    out.write("\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(114,0);to=(114,17)]
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
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(114,17);to=(115,0)]
    out.write("\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(115,2);to=(115,29)]
     if (previousTab != null){ 
// end
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(115,31);to=(115,37)]
    out.write("</div>");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(115,39);to=(115,69)]
     if (Util.notEmpty(tabSet)) { 
// end
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(115,71);to=(115,77)]
    out.write("</div>");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(115,79);to=(115,82)]
     } 
// end
// begin [file="/doEdit_Type_Modal.jsp";from=(115,86);to=(115,89)]
     } 
// end
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(115,91);to=(118,0)]
    out.write("\r\n\r\n\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(118,0);to=(118,43)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_2.setPageContext(pageContext);
    _jspx_th_jalios_if_2.setParent(null);
    _jspx_th_jalios_if_2.setPredicate( !isExtension );
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
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(118,43);to=(119,0)]
                    out.write("\r\n");

                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(119,59);to=(120,0)]
                    out.write("\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(120,2);to=(120,69)]
                     if (Util.isEmpty(currentTab) && exTypeList.contains(className)) { 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(120,71);to=(121,26)]
                    out.write("\r\n[[%@ include file=\"/types/");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(121,29);to=(121,40)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(121,42);to=(121,58)]
                    out.write("Extension/doEdit");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(121,61);to=(121,72)]
                    out.print( className );
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(121,74);to=(122,0)]
                    out.write("Extension.jspf\" %]]\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(122,2);to=(122,5)]
                     } 
                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(122,7);to=(128,0)]
                    out.write("\r\n\r\n[[% if (formHandler.getPublication() != null) { %]]\r\n<input type=\"hidden\" name=\"id\" value=\"[[%= formHandler.getPublication().getId() %]]\" />\r\n[[% } %]]\r\n\r\n");

                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(128,59);to=(131,0)]
                    out.write("\r\n[[jalios:include target=\"EDIT_PUB_MAINTAB\" targetContext=\"div\" /]]\r\n\r\n");

                // end
                // HTML // begin [file="/doEdit_Type_Modal.jsp";from=(131,59);to=(135,0)]
                    out.write("\r\n[[jalios:include jsp=\"/jcore/doEditExtraData.jsp\" /]]\r\n\r\n[[% ServletUtil.restoreAttribute(pageContext , \"classBeingProcessed\"); %]]\r\n");

                // end
                // begin [file="/doEdit_Type_Modal.jsp";from=(135,0);to=(135,12)]
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
// HTML // begin [file="/doEdit_Type_Modal.jsp";from=(135,12);to=(136,0)]
    out.write("\r\n");

// end
// begin [file="/doEdit_Type_Modal.jsp";from=(136,2);to=(136,16)]
     out.flush(); 
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
