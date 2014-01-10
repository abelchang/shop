<%@ page import="shop.UserRole" %>



<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="userRole.role.label" default="Role" />
		
	</label>
	<g:select id="role" name="role.id" from="${shop.Role.list()}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="userRole.user.label" default="User" />
		
	</label>
	<g:select id="user" name="user.id" from="${shop.User.list()}" optionKey="id" required="" value="${userRoleInstance?.user?.id}" class="many-to-one"/>
</div>

