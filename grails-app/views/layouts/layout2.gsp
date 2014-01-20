<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/js/html5shiv.js"></script>
<![endif]-->



<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Shop" /></title>
<link rel="shortcut icon"
	href="${resource(dir: 'images/gg', file: 'Slogo80.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images/gg', file: 'Slogo8W.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images/gg', file: 'Slogo8W.png')}">
<%--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		--%>


<!-- jqueryMobile -->
<link rel="stylesheet"
	href="${resource(dir: 'jqueryMobile', file: 'mabel.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'jqueryMobile', file: 'jquery.mobile.icons.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'jqueryMobile', file: 'jquery.mobile.structure-1.4.0.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'mmenu', file: 'jquery.mmenu.all.css')}"
	type="text/css">
<g:javascript src="jquery_1.10.2.js" />
<g:javascript library="application" />
<g:javascript src="jquery.mobile-1.4.0.js" />
<g:javascript src="jquery.mmenu.js" />

<!-- CustomScrollbar -->
<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.min.js"></script>
<!-- JQuery rotate -->
<%--<script src="<%=request.getContextPath()%>/js/jQueryRotateCompressed.js"></script>

--%>
<!-- my css -->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'my.css')}"
	type="text/css">

<script type="text/javascript">
	$(document).on("pageinit", "#homePage", function() {

		var myScroll;
		function loaded() {
			setTimeout(function() {
				myScroll = $("#content").niceScroll({
					cursorcolor : "#F86387"
				});

			}, 100);
		}
		window.addEventListener('load', loaded, false);

		//$( document ).on( "swipeleft swiperight", "#homePage", function( e ) {
		//We check if there is no open panel on the page because otherwise
		//a swipe to close the left panel would also open the right panel (and v.v.).
		//We do this by checking the data that the framework stores on the page element (panel: open).
		//if ( $.mobile.activePage.jqmData( "panel" ) !== "open" ) {
		//  if ( e.type === "swipeleft"  ) {
		//    $( "#right-panel" ).panel( "open" );
		// } else if ( e.type === "swiperight" ) {
		//    $( "#left-panel" ).panel( "open" );
		// }
		// }
		//});
	});
</script>



<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div data-role="page" id="homePage" data-theme="e">
		<div data-role="header" data-position="fixed">
			<h1>
				<img id="headerLogoPng"
					src="${createLink(controller:'File', action:'show', params:[photoUrl:"logoALL.png"])}" /><span
					id="headerLogo">廚房滴雞精</span>
			</h1>
			<%--<div id="narbarList">
				<a href="#contectMe" data-role="button" class="ui-btn-right"
					data-icon="home" data-rel="popup" data-transition="slideup"
					data-inline="true" data-position-to="origin" >聯絡我</a>
			</div>
			<a id="navbarCollapsible" href="#left-panel" data-role="button"
				data-rel="popup" class="ui-btn-left" data-icon="home"
				data-iconpos="notext" data-transition="slideup"
				data-position-to="origin"></a>
		--%>
		</div>

		<div data-role="content" id="in-content">
			<g:layoutBody />
		</div>

		<div data-role="panel" id="left-panel" class="nav-panel"
			data-theme="a" data-position="left">
			<g:render template="/panelNav"></g:render>
		</div>
		<!-- /panel -->

		<%--<div data-role="panel" id="right-panel" class="nav-panel" data-display="reveal" data-position="right" data-theme="a" data-position-fixed="true">
    <g:render template="/panelNav" ></g:render>
    </div><!-- /panel -->
    
		--%>
		<div data-role="popup" id="contectMe">
			<p>施工中，請稍後點選！</p>
		</div>
		<%--<div data-role="footer" data-position="fixed"></div>
		

		--%>
		<r:layoutResources />
	</div>
</body>
</html>
