<div id="cart">
	<g:if test="${cart?.lineItems }">
		<h1>
			<g:message code="yourCart" default="Your Cart" />
		</h1>
		<table>
			<thead>
				<th><g:message code="goods.title" default="Product Title" /></th>
				<th><g:message code="goods.price" default="Product Price" /></th>
				<th><g:message code="lineItem.itemNumber" default="Item Number" /></th>
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
						<td><g:form controller="goods" action="changeItemNumber" method="post">
								<input type="hidden" name="id" value="${lineItem.id }">
								<input type="hidden" name="forwardURI" value="${request.forwardURI }">
								<input type="text" size="2" name="itemNumber"
									value="${lineItem.itemNumber }">
								<input type="submit"
									value="${message(code:'cart.changeItemNumber',default:'Modify Number') }">
							</g:form></td>
						<td><g:form controller="goods" action="removeFromCart" method="post">
								<input type="hidden" name="id" value="${lineItem.id }">
								<input type="hidden" name="forwardURI" value="${request.forwardURI }">
								<input type="submit"
									value="${message(code:'cart.remove', default:'remove') }"
									onClick="return confirm('${message(code:'onfirm.removeFromCArt', default:'onfirm remove') }')">
							</g:form></td>
					</tr>
				</g:each>
				<tr><li><g:link class="create" controller="orders" action="create">
					<g:message code="orders.create" default="Create Order" />
				</g:link></li></tr>
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