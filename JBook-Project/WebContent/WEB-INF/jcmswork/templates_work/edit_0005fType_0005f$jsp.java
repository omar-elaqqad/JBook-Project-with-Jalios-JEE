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


public class edit_0005fType_0005f$jsp extends HttpJspBase {


    static {
    }
    public edit_0005fType_0005f$jsp( ) {
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

            // HTML // begin [file="/edit_Type_.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/edit_Type_.jsp";from=(1,42);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/edit_Type_.jsp";from=(2,118);to=(3,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/edit_Type_.jsp";from=(3,44);to=(4,0)]
                out.write("\n");

            // end
            // begin [file="/edit_Type_.jsp";from=(4,2);to=(19,0)]
                
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
            // HTML // begin [file="/edit_Type_.jsp";from=(19,2);to=(22,12)]
                out.write("\n[[%-- This file was automatically generated. --%]][[%\n%]][[%--\n  @Summary: ");

            // end
            // begin [file="/edit_Type_.jsp";from=(22,15);to=(22,26)]
                out.print( className );
            // end
            // HTML // begin [file="/edit_Type_.jsp";from=(22,28);to=(31,0)]
                out.write(" editor\n  @Category: Generated\n  @Author: JCMS Type Processor\n  @Customizable: True\n  @Requestable: True\n--%]][[%\n%]][[%@ page contentType=\"text/html; charset=UTF-8\" %]][[%\n%]][[%@ include file='/jcore/doInitPage.jspf' %]][[%\n\n");

            // end
            // begin [file="/edit_Type_.jsp";from=(31,0);to=(31,67)]
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
                          // HTML // begin [file="/edit_Type_.jsp";from=(31,67);to=(32,71)]
                              out.write("\n%]][[jsp:useBean id=\"extFormHandler\" scope=\"page\" class=\"generated.Edit");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(32,74);to=(32,85)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/edit_Type_.jsp";from=(32,87);to=(37,0)]
                              out.write("ExtensionHandler\"]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"request\" value=\"[[%= request %]]\"/]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"response\" value=\"[[%= response %]]\"/]][[%\n  %]][[jsp:setProperty name=\"extFormHandler\" property=\"*\" /]][[%\n%]][[/jsp:useBean]][[%\n");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(37,0);to=(37,12)]
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
          // HTML // begin [file="/edit_Type_.jsp";from=(37,12);to=(38,54)]
              out.write("\n%]][[jsp:useBean id='formHandler' scope='page' class='");

          // end
          // begin [file="/edit_Type_.jsp";from=(38,57);to=(38,70)]
              out.print( formHandler );
          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(38,72);to=(41,0)]
              out.write("']][[%\n  %]][[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]][[%\n  %]][[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]][[%\n");

          // end
          // begin [file="/edit_Type_.jsp";from=(41,0);to=(41,67)]
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
                          // HTML // begin [file="/edit_Type_.jsp";from=(41,67);to=(43,0)]
                              out.write("\n  %]][[jsp:setProperty name='formHandler' property='extFormHandler' value='[[%= extFormHandler %]]'/]][[%\n");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(43,0);to=(43,12)]
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
          // HTML // begin [file="/edit_Type_.jsp";from=(43,12);to=(48,0)]
              out.write("\n  %]][[jsp:setProperty name='formHandler' property='*' /]][[%\n%]][[/jsp:useBean]][[%\n\n%]][[% request.setAttribute(\"formHandler\", formHandler); %]][[%\n");

          // end
          // begin [file="/edit_Type_.jsp";from=(48,0);to=(48,67)]
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
                          // HTML // begin [file="/edit_Type_.jsp";from=(48,67);to=(50,0)]
                              out.write("\n  %]][[% request.setAttribute(\"extFormHandler\", extFormHandler); %]][[%\n");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(50,0);to=(50,12)]
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
          // HTML // begin [file="/edit_Type_.jsp";from=(50,12);to=(54,18)]
              out.write("\n\n%]][[%@ include file='/work/doEditPubHeader.jspf' %]]\n<div class=\"container-fluid\">\n  <div class=\"row ");

          // end
          // begin [file="/edit_Type_.jsp";from=(54,21);to=(54,32)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(54,34);to=(55,32)]
              out.write("\">\n    [[jalios:include jsp=\"types/");

          // end
          // begin [file="/edit_Type_.jsp";from=(55,35);to=(55,46)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(55,48);to=(55,55)]
              out.write("/doEdit");

          // end
          // begin [file="/edit_Type_.jsp";from=(55,58);to=(55,69)]
              out.print( className );
          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(55,71);to=(60,0)]
              out.write(".jsp\" /]]\n  </div>\n</div>\n\n\n");

          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(60,85);to=(61,0)]
              out.write("\n");

          // end
          // begin [file="/edit_Type_.jsp";from=(61,2);to=(65,0)]
              
              HashSet wysiwygSet = new HashSet();
              HashSet wysiwygArraySet = new HashSet();
              TreeSet catIdSet = new TreeSet();
          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(65,2);to=(66,0)]
              out.write("\n");

          // end
          // begin [file="/edit_Type_.jsp";from=(66,0);to=(66,85)]
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
                          // HTML // begin [file="/edit_Type_.jsp";from=(66,85);to=(67,0)]
                              out.write("\n");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(67,2);to=(79,0)]
                              
                                String type = itField.getAttributeValue("type");
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
                          // HTML // begin [file="/edit_Type_.jsp";from=(79,2);to=(80,0)]
                              out.write("\n");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(80,0);to=(80,17)]
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
          // HTML // begin [file="/edit_Type_.jsp";from=(80,17);to=(85,0)]
              out.write("\n\n[[% \n  TreeSet  removedCatSet = new TreeSet(); \n  Category itRemoveCat = null;\n");

          // end
          // begin [file="/edit_Type_.jsp";from=(85,0);to=(85,74)]
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
                          // HTML // begin [file="/edit_Type_.jsp";from=(85,74);to=(86,37)]
                              out.write("\n  itRemoveCat = channel.getCategory(\"");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(86,40);to=(86,49)]
                              out.print( itCatId );
                          // end
                          // HTML // begin [file="/edit_Type_.jsp";from=(86,51);to=(88,0)]
                              out.write("\");\n  if (itRemoveCat != null){\tremovedCatSet.add(itRemoveCat);  }\n");

                          // end
                          // begin [file="/edit_Type_.jsp";from=(88,0);to=(88,17)]
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
          // HTML // begin [file="/edit_Type_.jsp";from=(88,17);to=(93,0)]
              out.write("\n  request.setAttribute(\"removedCatSet\", removedCatSet);\n  %]]\n\n[[jalios:include jsp=\"work/edition/doEditPubFooter.jsp\" /]]\n");

          // end
          // begin [file="/edit_Type_.jsp";from=(93,2);to=(93,16)]
               out.flush(); 
          // end
          // HTML // begin [file="/edit_Type_.jsp";from=(93,18);to=(94,0)]
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
