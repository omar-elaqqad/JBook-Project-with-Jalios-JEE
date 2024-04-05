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


public class editForm_0005fType_0005f$jsp extends HttpJspBase {


    static {
    }
    public editForm_0005fType_0005f$jsp( ) {
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

            // HTML // begin [file="/editForm_Type_.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(1,42);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(2,118);to=(3,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(3,44);to=(4,0)]
                out.write("\n");

            // end
            // begin [file="/editForm_Type_.jsp";from=(4,2);to=(16,0)]
                
                  request.setCharacterEncoding("UTF-8");
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                String className = typeElt.getAttributeValue("name");
                String author = Util.getString(typeElt.getAttributeValue("formAuthor"), "j_2");
                String ws = Util.getString(typeElt.getAttributeValue("formWorkspace"), "");
                String formRedirectMode = Util.getString(typeElt.getAttributeValue("formRedirectMode"), "display");
                String formRedirectValue = Util.getString(typeElt.getAttributeValue("formRedirectValue"), "");
                String customFormHandler = Util.getString(typeElt.getAttributeValue("customformhandler"), "");
                String formHandler = Util.getString(customFormHandler, "generated.Edit" + className + "Handler");
                
            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(16,2);to=(19,12)]
                out.write("\n[[%-- This file was automatically generated. --%]]\n[[%--\n  @Summary: ");

            // end
            // begin [file="/editForm_Type_.jsp";from=(19,15);to=(19,26)]
                out.print( className );
            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(19,28);to=(28,73)]
                out.write(" editor\n  @Category: Generated\n  @Author: JCMS Type Processor\n  @Customizable: True\n  @Requestable: True\n--%]][[%\n%]][[%@ page contentType=\"text/html; charset=UTF-8\" %]][[%\n%]][[%@ include file='/jcore/doInitPage.jspf' %]]\n\n[[% String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(");

            // end
            // begin [file="/editForm_Type_.jsp";from=(28,76);to=(28,87)]
                out.print( className );
            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(28,89);to=(29,51)]
                out.write(".class).getLabelMap()); %]]\n[[jsp:useBean id='formHandler' scope='page' class='");

            // end
            // begin [file="/editForm_Type_.jsp";from=(29,54);to=(29,67)]
                out.print( formHandler );
            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(29,69);to=(33,64)]
                out.write("']]\n  [[jsp:setProperty name='formHandler' property='request' value='[[%= request %]]'/]]\n  [[jsp:setProperty name='formHandler' property='response' value='[[%= response %]]'/]]\n  [[jsp:setProperty name='formHandler' property='*' /]]\n  [[jsp:setProperty name='formHandler' property='author' value='");

            // end
            // begin [file="/editForm_Type_.jsp";from=(33,67);to=(33,75)]
                out.print( author );
            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(33,77);to=(56,26)]
                out.write("'/]]\n  [[jsp:setProperty name='formHandler' property='title' value='[[%= formTitles %]]'/]]\n[[/jsp:useBean]]\n[[%\n  if (formHandler.validate()) {\n    return;\n  }\n  boolean formInPortal = jcmsContext.isInFrontOffice(); \n%]]   \n\n[[jalios:if predicate='[[%= !formInPortal %]]']]\n[[%@ include file='/jcore/doHeader.jspf' %]]\n[[/jalios:if]]\n\n[[jalios:if predicate='[[%= formHandler.isOneSubmit() && formHandler.isSubmitted() %]]']]\n  [[% setWarningMsg(glp(\"msg.edit.already-one-submit\"), request); %]]\n[[/jalios:if]]\n\n[[%@ include file='/jcore/doMessageBox.jspf' %]]\n[[jalios:if predicate='[[%= channel.isDataWriteEnabled() %]]']]\n\n[[%@ include file='/work/doEditPubFormHeader.jspf' %]]\n\n[[jsp:include page=\"doEdit");

            // end
            // begin [file="/editForm_Type_.jsp";from=(56,29);to=(56,40)]
                out.print( className );
            // end
            // HTML // begin [file="/editForm_Type_.jsp";from=(56,42);to=(60,4)]
                out.write(".jsp\" /]]\n\n<tr>\n  <td style='display: none;'>\n    ");

            // end
            // begin [file="/editForm_Type_.jsp";from=(60,4);to=(60,19)]
                /* ----  jalios:select ---- */
                com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_0 = new com.jalios.jtaglib.SelectTag();
                _jspx_th_jalios_select_0.setPageContext(pageContext);
                _jspx_th_jalios_select_0.setParent(null);
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
                          // HTML // begin [file="/editForm_Type_.jsp";from=(60,19);to=(61,4)]
                              out.write("\n    ");

                          // end
                          // HTML // begin [file="/editForm_Type_.jsp";from=(61,27);to=(62,4)]
                              out.write("\n    ");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(62,4);to=(62,66)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_0.setPageContext(pageContext);
                              _jspx_th_jalios_if_0.setParent(_jspx_th_jalios_select_0);
                              _jspx_th_jalios_if_0.setPredicate( formRedirectMode.equals("home") );
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
                          // HTML // begin [file="/editForm_Type_.jsp";from=(62,66);to=(64,4)]
                              out.write("\n    <input type='hidden' name='redirect' value='index.jsp' />\n    ");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(64,4);to=(64,16)]
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
          // HTML // begin [file="/editForm_Type_.jsp";from=(64,16);to=(65,4)]
              out.write("\n    ");

          // end
          // HTML // begin [file="/editForm_Type_.jsp";from=(65,26);to=(66,4)]
              out.write("\n    ");

          // end
          // begin [file="/editForm_Type_.jsp";from=(66,4);to=(66,65)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_1.setPageContext(pageContext);
              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_1.setPredicate( formRedirectMode.equals("url") );
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
                          // HTML // begin [file="/editForm_Type_.jsp";from=(66,65);to=(67,48)]
                              out.write("\n    <input type='hidden' name='redirect' value='");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(67,51);to=(67,70)]
                              out.print( formRedirectValue );
                          // end
                          // HTML // begin [file="/editForm_Type_.jsp";from=(67,72);to=(68,4)]
                              out.write("' />\n    ");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(68,4);to=(68,16)]
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
          // HTML // begin [file="/editForm_Type_.jsp";from=(68,16);to=(69,4)]
              out.write("\n    ");

          // end
          // HTML // begin [file="/editForm_Type_.jsp";from=(69,39);to=(70,4)]
              out.write("\n    ");

          // end
          // begin [file="/editForm_Type_.jsp";from=(70,4);to=(70,108)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_2.setPageContext(pageContext);
              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_2.setPredicate( formRedirectMode.equals("content") || formRedirectMode.equals("category") );
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
                          // HTML // begin [file="/editForm_Type_.jsp";from=(70,108);to=(71,89)]
                              out.write("\n    <input type='hidden' name='redirect' value='[[jalios:url data='[[%= channel.getData(\"");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(71,92);to=(71,111)]
                              out.print( formRedirectValue );
                          // end
                          // HTML // begin [file="/editForm_Type_.jsp";from=(71,113);to=(72,4)]
                              out.write("\") %]]'/]]' />\n    ");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(72,4);to=(72,16)]
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
          // HTML // begin [file="/editForm_Type_.jsp";from=(72,16);to=(73,4)]
              out.write("\n    ");

          // end
          // HTML // begin [file="/editForm_Type_.jsp";from=(73,39);to=(74,4)]
              out.write("\n    ");

          // end
          // begin [file="/editForm_Type_.jsp";from=(74,4);to=(74,77)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_3.setPageContext(pageContext);
              _jspx_th_jalios_if_3.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_3.setPredicate( formRedirectMode.equals("currentCategory") );
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
                          // HTML // begin [file="/editForm_Type_.jsp";from=(74,77);to=(76,4)]
                              out.write("\n    <input type='hidden' name='redirect' value='[[jalios:url data='[[%= currentCategory %]]'/]]' />\n    ");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(76,4);to=(76,16)]
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
          // HTML // begin [file="/editForm_Type_.jsp";from=(76,16);to=(77,4)]
              out.write("\n    ");

          // end
          // HTML // begin [file="/editForm_Type_.jsp";from=(77,30);to=(78,4)]
              out.write("\n    ");

          // end
          // begin [file="/editForm_Type_.jsp";from=(78,4);to=(78,69)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_4.setPageContext(pageContext);
              _jspx_th_jalios_if_4.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_4.setPredicate( formRedirectMode.equals("display") );
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
                          // HTML // begin [file="/editForm_Type_.jsp";from=(78,69);to=(80,4)]
                              out.write("\n    <input type='hidden' name='redirect' value='$DISPLAY_URL$?portal=[[%= jcmsContext.getPortal().getId() %]]' />\n    ");

                          // end
                          // begin [file="/editForm_Type_.jsp";from=(80,4);to=(80,16)]
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
          // HTML // begin [file="/editForm_Type_.jsp";from=(80,16);to=(81,4)]
              out.write("\n    ");

          // end
          // begin [file="/editForm_Type_.jsp";from=(81,4);to=(81,20)]
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
// HTML // begin [file="/editForm_Type_.jsp";from=(81,20);to=(83,42)]
    out.write("\n    \n    <input type='hidden' name='ws' value='");

// end
// begin [file="/editForm_Type_.jsp";from=(83,45);to=(83,123)]
    out.print( Util.notEmpty(ws) ? ws : ("<"+"%= formHandler.getWorkspace().getId() %"+">") );
// end
// HTML // begin [file="/editForm_Type_.jsp";from=(83,125);to=(95,0)]
    out.write("' />\n  </td>\n</tr>\n\n[[%@ include file='/work/doEditPubFormFooter.jspf' %]]\n\n[[/jalios:if]]\n\n[[jalios:if predicate='[[%= !formInPortal %]]']]\n[[%@ include file='/jcore/doFooter.jspf' %]]\n[[/jalios:if]]\n\n");

// end
// begin [file="/editForm_Type_.jsp";from=(95,2);to=(95,16)]
     out.flush(); 
// end
// HTML // begin [file="/editForm_Type_.jsp";from=(95,18);to=(96,0)]
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
