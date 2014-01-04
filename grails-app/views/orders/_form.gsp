<%@ page import="shop.Orders" %>

<div class="fieldcontain ${hasErrors(bean: ordersInstance, field: 'receiverName', 'error')} required">
	<label for="receiverName">
		<g:message code="orders.receiverName.label" default="Receiver Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="receiverName" maxlength="10" required="" value="${ordersInstance?.receiverName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordersInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="orders.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="address" maxlength="200" required="" value="${ordersInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordersInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="orders.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${ordersInstance?.phone}"/>
</div>

