<%@ page import="shop.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categoryName', 'error')} ">
	<label for="categoryName">
		<g:message code="category.categoryName.label" default="Category Name" />
		
	</label>
	<g:textField name="categoryName" value="${categoryInstance?.categoryName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'goods', 'error')} ">
	<label for="goods">
		<g:message code="category.goods.label" default="Goods" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.goods?}" var="g">
    <li><g:link controller="goods" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="goods" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'goods.label', default: 'Goods')])}</g:link>
</li>
</ul>

</div>

