<center>
<div id="cart" data-role="collapsible" data-mini="true" data-inset="true">
	<g:if test="${cart?.lineItems }">
		<h1>
			<g:message code="yourCart" default="Your Cart" /><span class="ui-li-count">${cart.totalCount() }</span>
		</h1>
		<table data-role="table" id="table-custom-2" class="ui-body-d ui-shadow table-stripe ui-responsive" 
		data-column-btn-theme="b" data-column-popup-theme="a" >
			<thead>
				<th><g:message code="goods.title" default="Product Title" /></th>
				<th><g:message code="goods.price" default="Product Price" /></th>
				<th><g:message code="lineItem.itemNumber" default="Item Number" /></th>
				<th>option</th>
				<th>option</th>
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
								<input type="submit" data-icon="delete" data-shadow="true" data-iconpos="notext"
									value="${message(code:'cart.remove', default:'remove') }"
									onClick="return confirm('${message(code:'onfirm.removeFromCArt', default:'onfirm remove') }')">
							</g:form></td>
					</tr>
				</g:each>
			</tbody>
			<tr>
				<td colspan="2"><g:message code="cart.totalPrice"
						default="Total Price" /> ${cart.totalPrice() }</td>
				<td></td>
				<td></td>
				<td><g:link class="create ui-btn ui-corner-all ui-shadow" controller="orders" action="create">
					<g:message code="orders.create" default="Create Order" /></g:link></td>
			</tr>
		</table>
		
	</g:if>
	<g:else>
		<h2>
			<g:message code="cart.empty" default="尚未選購任何產品" />
		</h2>
	</g:else>
</div>
</center>