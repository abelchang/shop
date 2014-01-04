
<%@ page import="shop.Orders" %>
<%@ page import="shop.OrderStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orders.label', default: 'Orders')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-orders" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="new" action="index" params="[status:'new']"><g:message code="orders.status.new" default="New Order" /></g:link></li>
				<li><g:link class="shipped" action="index" params="[status:'old']"><g:message code="orders.status.new" default="Shipped" /></g:link></li>
				<li><g:link class="all" action="index" ><g:message code="orders.status.all" default="All order" /></g:link></li>
			</ul>
		</div>
		<div id="list-orders" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<th><g:message code="orders.goods" default="Product Name" /></th>
						<th><g:message code="orders.receiver.address" default="Receiver Detail" /></th>
						<g:sortableColumn property="price" title="${message(code: 'orders.price.label', default: 'Price')}" params="${[status:params.status] }"/>
						<g:sortableColumn property="orderDate" title="${message(code: 'orders.orderDate.label', default: 'Order Date')}" params="${[status:params.status] }"/>					
						<g:sortableColumn property="shipDate" title="${message(code: 'orders.shipDate.label', default: 'Ship Date')}" params="${[status:params.status] }"/>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordersInstanceList}" status="i" var="ordersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
						<p><g:message code="orders.id" default="Order ID"/>:${fieldValue(bean: ordersInstance, field: "id")}</p>
						<p><g:message code="orders.containsGoods" default="Orders Contains"/>:</p>
						<p><ul><g:each in="${ordersInstance.cart?.lineItems }" var="lineItem">
						<li>
						<g:link controller="goods" action="show" id="${lineItem.goods?.id }">
						${lineItem.goods?.title }
						</g:link>
						*
						${lineItem.itemNumber }
						</li>
						</g:each>
						</ul></p>
						</td>
						<td>
						<g:message code="orders.receiver" default="Receiver Name"/>:
						${fieldValue(bean: ordersInstance, field: "receiverName")}</br>
						<g:message code="orders.phone" default="Receiver Phone"/>:
						${fieldValue(bean: ordersInstance, field: "phone")}</br>
						<g:message code="orders.address" default="Receiver Address"/>:
						${fieldValue(bean: ordersInstance, field: "address")}</br>
						</td>
						<td>${fieldValue(bean: ordersInstance, field: "price")}</td>					
						<td><g:formatDate date="${ordersInstance.orderDate}" /></td>
						<td><g:formatDate date="${ordersInstance.shipDate}" /></td>
						<td>
						<g:if test="${ordersInstance.status == OrderStatus.NEW }">
						<g:message code="orders.status.new" default="NEW"/>
						</g:if>
						<g:elseif test="${ordersInstance.status == OrderStatus.SHIPPED }">
						<g:message code="orders.status.shipped" default="SHIPPED"/>
						<g:form action="markAsReceived" method="post">
						<g:hiddenField name="id" value="${ordersInstance.id }"/>
						<g:submitButton name="${message(code:'orders.received', default:'Received') }"/>
						</g:form>
						</g:elseif>
						<g:elseif test="${ordersInstance.status == OrderStatus.CLOSE }">
						<g:message code="orders.status.close" default="Close"/>
						</g:elseif>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ordersInstanceListTotal}" params="${[status:params.status]}"/>
			</div>
		</div>
	</body>
</html>
