<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
	<g:form action="loginCheck">
		<fieldset class="form">
			email:
			<g:textField name="email" />
			password:
			<g:passwordField name="password" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="login" class="login"
				value="${message(code: 'default.button.create.label', default: 'login')}" />
		</fieldset>
	</g:form>
</body>
</html>
