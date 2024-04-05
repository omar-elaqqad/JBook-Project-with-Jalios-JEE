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


public class do_0005fType_0005fResultDisplay$jsp extends HttpJspBase {


    static {
    }
    public do_0005fType_0005fResultDisplay$jsp( ) {
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

            // HTML // begin [file="/do_Type_ResultDisplay.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/do_Type_ResultDisplay.jsp";from=(1,118);to=(2,0)]
                out.write("\n");

            // end
            // begin [file="/do_Type_ResultDisplay.jsp";from=(2,2);to=(8,0)]
                
                  request.setCharacterEncoding("UTF-8");
                
                  Element typeElt = (Element)session.getAttribute("typeElt");
                  String className = typeElt.getAttributeValue("name");
                  boolean isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
            // end
            // HTML // begin [file="/do_Type_ResultDisplay.jsp";from=(8,2);to=(11,12)]
                out.write("\n[[%-- This file was automatically generated. --%]][[%\n%]][[%--\n  @Summary: ");

            // end
            // begin [file="/do_Type_ResultDisplay.jsp";from=(11,15);to=(11,26)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_ResultDisplay.jsp";from=(11,28);to=(17,0)]
                out.write(" result display page\n  @Category: Generated\n  @Author: JCMS Type Processor\n  @Customizable: True\n  @Requestable: False\n--%]][[%\n");

            // end
            // begin [file="/do_Type_ResultDisplay.jsp";from=(17,2);to=(17,25)]
                 if (isFileDocument) { 
            // end
            // HTML // begin [file="/do_Type_ResultDisplay.jsp";from=(17,27);to=(19,0)]
                out.write("\n%]][[%@ include file='/types/FileDocument/doFileDocumentResultDisplay.jsp' %]]\n");

            // end
            // begin [file="/do_Type_ResultDisplay.jsp";from=(19,2);to=(19,12)]
                 } else { 
            // end
            // HTML // begin [file="/do_Type_ResultDisplay.jsp";from=(19,14);to=(21,0)]
                out.write("\n%]][[%@ include file='/custom/jcms/doResultDisplay.jsp' %]]\n");

            // end
            // begin [file="/do_Type_ResultDisplay.jsp";from=(21,2);to=(21,5)]
                 } 
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
