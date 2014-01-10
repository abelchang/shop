
<%@ page import="shop.Goods"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'goods.label', default: 'Goods')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<nav data-role="navbar" data-grid="a">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</nav>
	<g:render template="/showCart" model="${[cart:cart] }"></g:render>
	<div id="list-goods" class="content scaffold-list" role="main">
		<h1>
			<g:message code="goods.list.label" default="Product List" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table >
			<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><img alt=""
							src="${createLink(controller:'File', action:'show', params:[photoUrl:"${goodsInstance?.photoUrl}"])}"
							style="width: 200px" /></td>

						<td style="width: 500px"><g:link action="show"
								id="${goodsInstance.id}">
								${fieldValue(bean: goodsInstance, field: "title")}
							</g:link><br /> Category: ${fieldValue(bean: goodsInstance, field: "category")}<br />
							${fieldValue(bean: goodsInstance, field: "description")}<br />
							Price: ${fieldValue(bean: goodsInstance, field: "price")}</td>
						<td><g:form method="post">
								<input type="hidden" name="goodsId" value="${goodsInstance.id}">
								<g:actionSubmit action="addToCart"
									value="${message(code:'cart.addToCart', default:"Add To Cart") }" />
							</g:form></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${goodsInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
