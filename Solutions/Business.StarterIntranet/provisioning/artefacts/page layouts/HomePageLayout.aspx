<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@Register Tagprefix="PageFieldTaxonomyFieldControl" Namespace="Microsoft.SharePoint.Taxonomy" Assembly="Microsoft.SharePoint.Taxonomy, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldRadioButtonChoiceField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldUserField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldUserField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@Register Tagprefix="PageFieldBooleanField" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
	<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>

	<!-- Custom styles are loaded only on display mode -->
	<PublishingWebControls:EditModePanel runat="server" id="DisplayModeControl" SuppressTag="true" PageDisplayMode="display">
		<SharePointWebControls:CssRegistration runat="server" ID="PortalCss" Name="&lt;% $SPUrl:~sitecollection/Style Library/PnP/layouts.css %&gt;" After="corev15.css"/>
	</PublishingWebControls:EditModePanel>

	<PublishingWebControls:EditModePanel runat="server">
		<!-- Styles for edit mode only-->
		<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %>"
			After="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
					
		<!-- Custom styles are loaded only on edit mode -->
	    <SharePointWebControls:CssRegistration runat="server" ID="PortalLayoutEditCss" Name="&lt;% $SPUrl:~sitecollection/Style Library/PnP/layouts-edit.css %&gt;" After="corev15.css"/>	
			
	</PublishingWebControls:EditModePanel>
	<SharePointWebControls:FieldValue id="PageStylesField" FieldName="HeaderStyleDefinitions" runat="server"/>

	<style type="text/css">
	
		/* Medium and large devices (Desktop) */
	  	@media (min-width: 768px) {
	  	
	    	/* Only for the home page */
	    	#intranet-header {
				height: 664px!important;
			}
			
			#intranet-topnav {
				display:none;
			}
			
			#welcome-overlay {
				display:block!important;
			
			}
			
			#overlay {
				position: absolute;
			    height: 88px;
			    width: 100%;
			    bottom: 0;
			}
			
			#overlay .blank {
				background-color: #fff;
				height: 100%;
				position:absolute;
			}
			
			/* Center links in the top nav menu */
			.menu-content {
				text-align: center;
			}
			
			#navbar ul.nav {
	
				float: none;
			    display: inline-block;
			    vertical-align: middle;
			}
			
			#navbar ul.dropdown-menu {
				margin-left: 0px!important;
			}
		}
	</style>
		
	<script type="text/javascript">
	
		// If we are not in the mobile view (display: none), we add dynamically the welcome overlay control
		Intranet.Main.initWelcomePage();
		
	</script>

</asp:Content>

<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:FieldValue id="PageTitle" FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitleInTitleArea" runat="server">
    <SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
	<div class="page-layout intranet-hp-content">
				<div class="row">
					<div class="col-md-12">
						<PublishingWebControls:EditModePanel runat="server" CssClass="edit-mode-panel title-edit">
						
							<div id="title" class="field">
								<SharePointWebControls:TextField runat="server" FieldName="Title"/>            
							</div>
			
							<div id="contact" class="field">
								<PageFieldUserField:UserField FieldName="IntranetContact" runat="server"/>    
							</div>
							
							<div id="sitemap-position" class="field">
								<PageFieldTaxonomyFieldControl:TaxonomyFieldControl FieldName="IntranetSiteMapPosition" runat="server" CssClass="jambon"/>
							</div>
							
							<div id="language" class="field">
							<PageFieldRadioButtonChoiceField:RadioButtonChoiceField FieldName="IntranetContentLanguage" runat="server"/>
							</div>
			
							<div id="translation" class="field">
								<component-translationcontrol params='languageFieldName:"IntranetContentLanguage", associationKeyFieldName:"IntranetContentAssociationKey"'></component-translationcontrol>
							</div>
							
							<div id="hide-side-bar" class="field">
								<PageFieldBooleanField:BooleanField FieldName="HideSideBar" runat="server"/>
								<SharePointWebControls:FieldProperty FieldName="HideSideBar" PropertyName="Description" runat="server" />
							</div>
									
						</PublishingWebControls:EditModePanel>
					</div>
				</div>

				<div class="row">			
					<div class="col-md-12">
						<WebPartPages:WebPartZone id="x6d9f4dc74a1340709b2f778dcced876a" runat="server" title="Main 100 1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
					</div>
				</div>

				<div class="row">			
					<div class="col-md-8">
						<WebPartPages:WebPartZone id="x7bd250ccc7fa476ab976f3b3d3af90d1" runat="server" title="Main 75 1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
					</div>
					<div class="col-md-4">
					
						<WebPartPages:WebPartZone id="x21dc62eabe984ac293d40fad41358a04" runat="server" title="Main 25 1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
						
						<div id="intranet-tabs">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active">
									<a href="#events" aria-controls="home" role="tab" data-toggle="tab" data-bind="getResource: 'events', click: function() { Intranet.Main.truncate('#events') }">
									</a>
								</li>
								<li role="presentation">
									<a href="#posts" aria-controls="profile" role="tab" data-toggle="tab" data-bind="getResource: 'posts', click: function() { Intranet.Main.truncate('#posts') }">
									</a>
								</li>
							</ul>
							
							<!-- Tab panes from Bootstrap -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="events">
									<WebPartPages:WebPartZone id="x23fac36e4966472caad60a7647c29725" runat="server" title="Main 25 2"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
								</div>
								<div role="tabpanel" class="tab-pane" id="posts">
									<WebPartPages:WebPartZone id="x66ab969b8dd44c2a8acc98e498affbb7" runat="server" title="Main 25 3"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
								</div>
							</div>	
						</div>
					
					</div>
				</div>
				<div class="row">			
					<div class="col-md-8">
						<WebPartPages:WebPartZone id="x169dc1e73e8748a1a4fa1df9cbd64938" runat="server" title="Main 75 1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
					</div>
					<div class="col-md-4">
						<WebPartPages:WebPartZone id="xc41dbd2073154acfbcf8b6f1b28cf499" runat="server" title="Main 25 1"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>

					</div>
				</div>
				<div class="row">	
					<div class="col-md-12">
						<WebPartPages:WebPartZone id="x64a28a78d50f41a4bcd4654f7bb1f090" runat="server" title="Main 25 3"><ZoneTemplate><WebPartPages:WikiContentWebpart runat="server" Directive="&lt;%@ Register TagPrefix=&quot;SharePoint&quot; Namespace=&quot;Microsoft.Sharepoint.WebControls&quot; Assembly=&quot;Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c&quot; %&gt;" Title="" FrameType="None" SuppressWebPartChrome="False" Description="" IsIncluded="True" ZoneID="x64a28a78d50f41a4bcd4654f7bb1f090" PartOrder="1" FrameState="Normal" AllowRemove="True" AllowZoneChange="True" AllowMinimize="True" AllowConnect="True" AllowEdit="True" AllowHide="True" IsVisible="True" DetailLink="" HelpLink="" HelpMode="Modeless" Dir="Default" PartImageSmall="" MissingAssembly="Cannot import this Web Part." PartImageLarge="" IsIncludedFilter="" ExportControlledProperties="True" ConnectionID="00000000-0000-0000-0000-000000000000" ID="g_9a563d04_f6a9_4362_926c_8b6dcd7439e9" ChromeType="None" ExportMode="All" __MarkupType="vsattributemarkup" __WebPartId="{9A563D04-F6A9-4362-926C-8B6DCD7439E9}" WebPart="true" Height="" Width=""><Content>


							<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td valign="top"><div id="WebPart" width="100%"><div id="WebPartContent">
								<div style="border: 1px solid #add1ff; height: 50px; background-color: #ebeef2">
								</div>
								</div></div></td></tr></table>
							</Content>
</WebPartPages:WikiContentWebpart>

						</ZoneTemplate></WebPartPages:WebPartZone>
					</div>	
				</div>				
	</div>
</asp:Content>
