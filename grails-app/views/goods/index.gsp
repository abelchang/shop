
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
	<a href="#list-goods" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="cart">
		<g:if test="${cart?.lineItems }">
			<h1>
				<g:message code="yourCart" default="Your Cart" />
			</h1>
			<table>
				<thead>
					<th><g:message code="goods.title" default="Product Title" /></th>
					<th><g:message code="goods.price" default="Product Price" /></th>
					<th><g:message code="lineItem.itemNumber"
							default="Item Number" /></th>
					<th></th>
					<th></th>
				</thead>
				<tbody>
					<g:each in="${cart?.lineItems }" var="lineItem">
						<tr>
							<td>
								${lineItem.goods?.title }
							</td>
							<td>
								${lineItem.goods?.price }
							</td>
							<td>
								${lineItem.itemNumber }
							</td>
							<td><g:form action="changeItemNumber" method="post">
									<input type="hidden" name="id" value="${lineItem.id }">
									<input type="text" size="2" name="itemNumber"
										value="${lineItem.itemNumber }">
									<input type="submit"
										value="${message(code:'cart.changeItemNumber',default:'Modify Number') }">
								</g:form></td>
							<td><g:form action="removeFromCart" method="post">
									<input type="hidden" name="id" value="${lineItem.id }">
									<input type="submit"
										value="${message(code:'cart.remove', default:'remove') }"
										onClick="return confirm('${message(code:'onfirm.removeFromCArt', default:'onfirm remove') }')">
								</g:form></td>
						</tr>
					</g:each>
				</tbody>
				<tr>
					<td colspan="2"><g:message code="cart.totalPrice"
							default="Total Price" /> ${cart.totalPrice() }</td>

				</tr>
			</table>
		</g:if>
		<g:else>
			<h2>
				<g:message code="cart.empty" default="Cart Empty" />
			</h2>
		</g:else>
	</div>
	<div id="list-goods" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><img alt=""
							src="${fieldValue(bean: goodsInstance, field: "photoUrl")}"
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
