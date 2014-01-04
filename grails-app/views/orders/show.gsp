
<%@ page import="shop.Orders" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orders.label', default: 'Orders')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orders" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-orders" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orders">
			
				<g:if test="${ordersInstance?.receiverName}">
				<li class="fieldcontain">
					<span id="receiverName-label" class="property-label"><g:message code="orders.receiverName.label" default="Receiver Name" /></span>
					
						<span class="property-value" aria-labelledby="receiverName-label"><g:fieldValue bean="${ordersInstance}" field="receiverName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="orders.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${ordersInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="orders.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${ordersInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.shipDate}">
				<li class="fieldcontain">
					<span id="shipDate-label" class="property-label"><g:message code="orders.shipDate.label" default="Ship Date" /></span>
					
						<span class="property-value" aria-labelledby="shipDate-label"><g:formatDate date="${ordersInstance?.shipDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.cart}">
				<li class="fieldcontain">
					<span id="cart-label" class="property-label"><g:message code="orders.cart.label" default="Cart" /></span>
					
						<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${ordersInstance?.cart?.id}">${ordersInstance?.cart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.orderDate}">
				<li class="fieldcontain">
					<span id="orderDate-label" class="property-label"><g:message code="orders.orderDate.label" default="Order Date" /></span>
					
						<span class="property-value" aria-labelledby="orderDate-label"><g:formatDate date="${ordersInstance?.orderDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="orders.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${ordersInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="orders.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${ordersInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordersInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="orders.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${ordersInstance?.user?.id}">${ordersInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ordersInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ordersInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
