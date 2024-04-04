<%@ include file="/admin/properties/doCommonProp.jspf" %>  

<div class="row">
  <div class="col-md-6">
  
  <%-- --- SITE INFO ------------------------------ --%>
  
		<fieldset class="col-md-12">
		  <legend><% /* %>Channe Info<% */ %><%= glp("ui.adm.prop.ch.lgd.info") %></legend>
		
			<jalios:field  label="ui.adm.prop.ch.name" name='<%= "channel_name" %>' value='<%= formHandler.getChannel_name() %>' disabled='<%= formHandler.isDisabled(formHandler.getChannel_name()) %>'>
			  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
			</jalios:field>
			
			<jalios:field  label="ui.adm.prop.ch.desc" name='<%= "channel_description" %>' value='<%= formHandler.getChannel_description() %>' disabled='<%= formHandler.isDisabled("channel.description") %>'>
			  <jalios:control settings='<%= new TextAreaSettings().rows(5) %>' />
			</jalios:field>
			
			<jalios:field  label="ui.adm.prop.ch.kwd" name='<%= "channel_keywords" %>' value='<%= formHandler.getChannel_keywords() %>' disabled='<%= formHandler.isDisabled("channel.keywords") %>'>
			  <jalios:control settings='<%= new TextAreaSettings().rows(5) %>' />
			</jalios:field>
			
			<jalios:field  label="ui.adm.prop.ch.url" name='<%= "channel_url" %>' tooltip='ui.adm.prop.ch.url.h' value='<%= formHandler.getChannel_url() %>' disabled='<%= formHandler.isDisabled("channel.url") %>'>
			  <jalios:control type="<%= ControlType.URL %>" />
			</jalios:field>
		
		</fieldset>
  
  <%-- --- SITE LANGUAGE ------------------------------ --%>
  </div><div class="col-md-6">

		<fieldset class="col-md-12">
		  <legend><% /* %>Languages<% */ %><%= glp("ui.adm.prop.ch.lgd.lang") %></legend>

          <jalios:field  label="ui.adm.prop.ch.default-lang" tooltip='ui.adm.prop.ch.default-lang.h' value='<%= glp("lang." + channel.getLanguage()) %>' disabled='<%= true %>'>
            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          </jalios:field>

          <script type="text/javascript">
            window.updateChannelLangs = function(selectedLang) {
              var $inputChannelLanguages = jQuery('INPUT[name="channel_languages"]');
              var channelLanguages = $inputChannelLanguages.val();
              if (channelLanguages !== '' && channelLanguages !== " ") {
                channelLanguages += ",";
              }
              $inputChannelLanguages.val(channelLanguages + selectedLang);
            }
          </script>
          <jalios:field  label="ui.adm.prop.ch.languages" name="channel_languages" tooltip='ui.adm.prop.ch.languages.h' value='<%= formHandler.getChannel_languages() %>'>
            <jalios:control settings='<%= new LanguageSettings().chooser().addChooserOption("multiple", "false").addChooserOption("all", "true").addChooserOption("jsCallback", "updateChannelLangs") %>' />
          </jalios:field>

          <jalios:field label="ui.com.lbl.country" name="channel_default_country"  value='<%= formHandler.getChannel_default_country() %>'>
            <jalios:control type="<%= ControlType.COUNTRY %>" />
          </jalios:field>

          <% if (channel.isTimeZoneEnabled()) { %>
          <jalios:field label="ui.com.lbl.timezone" name="channel_default_timezone"  value='<%= formHandler.getChannel_default_timezone() %>'>
            <jalios:control type="<%= ControlType.TIMEZONE %>" />
          </jalios:field>
          <% } %>

		</fieldset>

  </div>
</div>
