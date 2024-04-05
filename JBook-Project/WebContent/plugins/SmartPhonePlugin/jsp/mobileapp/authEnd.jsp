<%@ include file="/plugins/SmartPhonePlugin/jsp/mobileapp/skipWaffle.jspf" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/header.jspf" %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
String encodeRedirectUrl = getUntrustedStringParameter("redirectUrl", "");
%>
<div class="jmobile-auth-end" data-role="page"></div>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/footer.jspf" %>
<script>
  !function($) {
    let redirectUrl = "<%= encodeRedirectUrl %>";
	const getRedirectUrl = function(jmobileInfo) {
	  if (redirectUrl != "") {
	    return redirectUrl;
	  }
	  return jmobileInfo.indexPage;
	}
	
    var register = function() {

      var passToken = function(jmobileInfo) {

        $(".ui-loader").loader("show"); //show loader

        //Handle token generation redirections / errors
        var tokenCallback = function(result, status) {

          if (status === 'success') {
            //token generated and already sent to native app
            window.location.href = getRedirectUrl(jmobileInfo);
          }
          else if (status === 'message-not-sent') {
            //token generated but failed to send to native app
            $.jalios.smartPhone.MobileApp.saveAction(
              "sendTokenApp",
              function sendTokenApp(msg) {
                this.onTokenReceive(msg.data);
              },
              {
                data : result
              }
            );

            window.location.href = getRedirectUrl(jmobileInfo);

          } else { // other errors, could not generate token
            window.location.href = jmobileInfo.errorPage + '?code=' + status;
          }
        };


        // Calls jwt token generation and pass to JMobile App.
        var tokenQuery = { };
        $.ajax({
          async : true,
          cache : false,
          //global: false,
          timeout: 0,
          contentType: "application/x-www-form-urlencoded;charset=UTF-8",
          url : "rest/smartphone/auth/addjwtoken",
          type : "get",
          dataType : "json",
          data : tokenQuery,
          headers: {
            "Content-Length": tokenQuery.length
          },
          success : function(result) {
            $.jalios.smartPhone.postMessageApp(JSON.stringify({"type" : "auth-token", "status": "success", "msg" : result}), { onSuccess: function() { tokenCallback(result, "success"); }, onError: function() { tokenCallback(result, "message-not-sent"); } } );
          },
          error : function(xhr) {
            $.jalios.smartPhone.postMessageApp(JSON.stringify({"type" : "auth-token", "status": "error", "msg" : xhr}), { onSuccess: function() { tokenCallback(xhr, "error-sent"); }, onError: function() { tokenCallback(xhr, "error"); } } );
          },
          complete: function(data) {
            $(".ui-loader").loader("hide");
          }
        });

      };


      //Retrieve customisable page urls
      $.ajax({
        async : true,
        cache : false,
        timeout: 0,
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        url : "rest/smartphone/info",
        type : "get",
        dataType : "json",
        headers: {
        },
        success : function(jmobileInfo) {

          passToken(jmobileInfo);

        },
        error : function(xhr) {
          window.location.href = '<%=channel.getProperty("jcmsplugin.smartphone.mobileapp.info.errorPage", "plugins/SmartPhonePlugin/jsp/mobileapp/error-page.jsp")%>';
        },
        complete: function(data) {

        }
      })
      ;


    };

    $(document).ready(function() {
      register();
    });

  }(window.jQuery);
</script>
