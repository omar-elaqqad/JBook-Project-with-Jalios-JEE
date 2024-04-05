import com.jalios.util.*;
import  java.io.*;
import  java.util.*;
import  java.text.*;
import  java.net.*;
import  org.jdom.*;
import  com.jalios.jcms.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jalios.jspengine.runtime.*;


public class edit_0005fType_0005fModal$jsp extends HttpJspBase {


    static {
    }
    public edit_0005fType_0005fModal$jsp( ) {
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

            // HTML // begin [file="/edit_Type_Modal.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/edit_Type_Modal.jsp";from=(1,42);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/edit_Type_Modal.jsp";from=(2,118);to=(3,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/edit_Type_Modal.jsp";from=(3,44);to=(4,0)]
                out.write("\n");

            // end
            // begin [file="/edit_Type_Modal.jsp";from=(4,2);to=(19,0)]
                
                  request.setCharacterEncoding("UTF-8");
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                List extendedTypeList = (List)session.getAttribute("extendedTypeList");
                String className = typeElt.getAttributeValue("name");
                Attribute categorizable = typeElt.getAttribute("categorizable");
                boolean classCategorizable = categorizable != null && categorizable.getBooleanValue();
                
                // Get the fields (and the inherited fields)                             
                ArrayList fieldList = new ArrayList();
                TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);
                String customFormHandler = Util.getString(typeElt.getAttributeValue("customformhandler"), "");
                String formHandler = Util.getString(customFormHandler, "generated.Edit" + className + "Handler");
                
            // end
            // HTML // begin [file="/edit_Type_Modal.jsp";from=(19,2);to=(22,12)]
                out.write("\n[[%-- This file was automatically generated. --%]][[%\n%]][[%--\n  @Summary: ");

            // end
            // begin [file="/edit_Type_Modal.jsp";from=(22,15);to=(22,26)]
                out.print( className );
            // end
            // HTML // begin [file="/edit_Type_Modal.jsp";from=(22,28);to=(31,0)]
                out.write(" editor\n  @Category: Generated\n  @Author: JCMS Type Processor\n  @Customizable: True\n  @Requestable: True\n--%]][[%\n%]][[%@ page contentType=\"text/html; charset=UTF-8\" %]][[%\n%]][[%@ include file='/jcore/doInitPage.jspf' %]][[%\n\n");

            // end
            // begin [file="/edit_Type_Modal.jsp";from=(31,0);to=(31,67)]
                /* ----  jalios:if ---- */
                com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                _jspx_th_jalios_if_0.setPageContext(pageContext);
                _jspx_th_jalios_if_0.setParent(null);
                _jspx_th_jalios_if_0.setPredicate( extendedTypeList.contains(className) );
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
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(31,67);to=(32,71)]
                              out.write("\n%]][[jsp:useBean id=\"extFormHandler\" scope=\"page\" class=\"generated.Edit");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(32,74);to=(32,85)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(32,87);to=(38,0)]
                              out.write("ExtensionHandler\"]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"request\" value=\"[[%= request %]]\"/]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"response\" value=\"[[%= response %]]\"/]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"noRedirect\" value=\"true\" /]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"*\" /]][[%\n%]][[/jsp:useBean]][[%\n");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(38,0);to=(38,12)]
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
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(38,12);to=(39,54)]
              out.write("\n%]][[jsp:useBean id='formHandler' scope='page' class='");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(39,57);to=(39,70)]
              out.print( formHandler );
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(39,72);to=(42,0)]
              out.write("']][[%\n  %]][[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]][[%\n  %]][[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]][[%\n");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(42,0);to=(42,67)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_1.setPageContext(pageContext);
              _jspx_th_jalios_if_1.setParent(null);
              _jspx_th_jalios_if_1.setPredicate( extendedTypeList.contains(className) );
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
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(42,67);to=(44,0)]
                              out.write("\n  %]][[jsp:setProperty name='formHandler' property='extFormHandler' value='[[%= extFormHandler %]]'/]][[%\n");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(44,0);to=(44,12)]
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
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(44,12);to=(50,0)]
              out.write("\n  %]][[jsp:setProperty name=\"formHandler\" property=\"noRedirect\" value=\"true\" /]][[%\n  %]][[jsp:setProperty name='formHandler' property='*' /]][[%\n%]][[/jsp:useBean]][[%\n\n%]][[% request.setAttribute(\"formHandler\", formHandler); %]][[%\n");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(50,0);to=(50,67)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_2.setPageContext(pageContext);
              _jspx_th_jalios_if_2.setParent(null);
              _jspx_th_jalios_if_2.setPredicate( extendedTypeList.contains(className) );
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
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(50,67);to=(52,0)]
                              out.write("\n%]][[% request.setAttribute(\"extFormHandler\", extFormHandler); %]][[%\n");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(52,0);to=(52,12)]
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
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(52,12);to=(54,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(54,18);to=(60,0)]
              out.write("\n%]][[% if (formHandler.validate()) {\n  request.setAttribute(\"modal.redirect\", formHandler.getModalRedirect()); %]][[%\n%]][[%@ include file=\"/jcore/modal/modalRedirect.jspf\" %]][[% return; } %]][[%\n%]][[% formHandler.prepare(); %]]\n\n");

          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(60,15);to=(61,61)]
              out.write("\n[[jalios:modal formHandler=\"[[%= formHandler %]]\" url=\"types/");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(61,64);to=(61,75)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(61,77);to=(61,82)]
              out.write("/edit");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(61,85);to=(61,96)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(61,98);to=(62,16)]
              out.write("Modal.jsp\"]]\n<div class=\"row ");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(62,19);to=(62,30)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(62,32);to=(70,1)]
              out.write("\">\n  \n  [[%-- Workspace -------------------------------------------------------- --%]]\n  [[%@ include file=\"/jcore/doWorkspaceField.jspf\" %]]\n  \n\t[[%-- Title ------------------------------------------------------------ --%]]\n\t[[% if (formHandler.isFieldEdition(\"title\")) { %]]\n\n\t");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(70,3);to=(70,50)]
               Element titleElt = typeElt.getChild("title"); 
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(70,52);to=(77,29)]
              out.write("\n    [[% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %]]\n    [[jalios:field name=\"title\" css=\"focus\" formHandler=\"[[%= formHandler %]]\"]]\n      [[jalios:control /]] \n    [[/jalios:field]]\n\n\t[[% } %]]\n\t[[jalios:include jsp=\"types/");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(77,32);to=(77,43)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(77,45);to=(77,52)]
              out.write("/doEdit");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(77,55);to=(77,66)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(77,68);to=(81,0)]
              out.write("Modal.jsp\" /]]\n</div>\n[[/jalios:modal]]\n\n");

          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(81,85);to=(82,0)]
              out.write("\n");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(82,2);to=(86,0)]
              
              HashSet wysiwygSet = new HashSet();
              HashSet wysiwygArraySet = new HashSet();
              TreeSet catIdSet = new TreeSet();
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(86,2);to=(87,0)]
              out.write("\n");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(87,0);to=(87,85)]
              /* ----  jalios:foreach ---- */
              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
              _jspx_th_jalios_foreach_0.setPageContext(pageContext);
              _jspx_th_jalios_foreach_0.setParent(null);
              _jspx_th_jalios_foreach_0.setCollection( fieldList );
              _jspx_th_jalios_foreach_0.setName("itField");
              _jspx_th_jalios_foreach_0.setType("org.jdom.Element");
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
                              org.jdom.Element itField = null;
                              itField = (org.jdom.Element) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(87,85);to=(88,0)]
                              out.write("\n");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(88,2);to=(100,0)]
                              
                                String type   = itField.getAttributeValue("type");
                                String editor = itField.getAttributeValue("editor");
                                if (editor.equals("wysiwyg")) {
                                  if (type.equals("String[]")) {
                                    wysiwygArraySet.add(itField);	
                                  } else {
                                    wysiwygSet.add(itField);
                                  }
                                } else if (editor.equals("category")) {
                                  catIdSet.add(itField.getAttributeValue("root"));
                                }
                          // end
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(100,2);to=(101,0)]
                              out.write("\n");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(101,0);to=(101,17)]
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
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(101,17);to=(106,0)]
              out.write("\n\n[[% \n  TreeSet  removedCatSet = new TreeSet(); \n  Category itRemoveCat = null;\n");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(106,0);to=(106,74)]
              /* ----  jalios:foreach ---- */
              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_1 = new com.jalios.jtaglib.ForeachTag();
              _jspx_th_jalios_foreach_1.setPageContext(pageContext);
              _jspx_th_jalios_foreach_1.setParent(null);
              _jspx_th_jalios_foreach_1.setCollection( catIdSet );
              _jspx_th_jalios_foreach_1.setType("String");
              _jspx_th_jalios_foreach_1.setName("itCatId");
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
                              String itCatId = null;
                              itCatId = (String) pageContext.findAttribute("itCatId");
                          // end
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(106,74);to=(107,37)]
                              out.write("\n  itRemoveCat = channel.getCategory(\"");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(107,40);to=(107,49)]
                              out.print( itCatId );
                          // end
                          // HTML // begin [file="/edit_Type_Modal.jsp";from=(107,51);to=(109,0)]
                              out.write("\");\n  if (itRemoveCat != null){\tremovedCatSet.add(itRemoveCat);  }\n");

                          // end
                          // begin [file="/edit_Type_Modal.jsp";from=(109,0);to=(109,17)]
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
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(109,17);to=(113,0)]
              out.write("\n  request.setAttribute(\"removedCatSet\", removedCatSet);\n%]]\n  \n");

          // end
          // begin [file="/edit_Type_Modal.jsp";from=(113,2);to=(113,16)]
               out.flush(); 
          // end
          // HTML // begin [file="/edit_Type_Modal.jsp";from=(113,18);to=(114,0)]
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
