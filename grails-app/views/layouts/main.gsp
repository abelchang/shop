<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Shop"/></title>
		<link rel="shortcut icon" href="${resource(dir: 'images/gg', file: 'Slogo8.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images/gg', file: 'Slogo8.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images/gg', file: 'Slogo8.png')}">
		<%--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		--%>
		
		<!-- my css -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'my.css')}" type="text/css">
		<!-- jqueryMobile -->
		<link rel="stylesheet" href="${resource(dir: 'jqueryMobile', file: 'jquery.mobile.theme-1.4.0.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'jqueryMobile', file: 'jquery.mobile-1.4.0.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'mmenu', file: 'jquery.mmenu.all.css')}" type="text/css">
		<g:javascript src="jquery_1.10.2.js" />
		<g:javascript library="application"/>		
		<g:javascript src="jquery.mobile-1.4.0.js" />
		<g:javascript src="jquery.mmenu.js" />
		<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu();
			});
		</script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div data-role="page" data-theme="e">
		
		<div class="ui-grid-a ui-responsive">
		<div class="ui-block-a" style="width:250px;">
		<g:render template="/status" ></g:render>
		</div>
		<div class="ui-block-b" style="width:75%;">
		<div data-role="content">
		<g:layoutBody/>
		</div>
		</div>
		</div>
		<div class="footer" role="contentinfo" data-role="footer" data-position="fixed" data-fullscreen="true" style="display:none;">
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		</div>
		<r:layoutResources />
		</div>
	</body>
</html>
