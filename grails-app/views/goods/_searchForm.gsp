<%@ page import="shop.Goods" %>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="goods.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${goodsInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="goods.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="categoryName" optionValue="categoryName"
					from="${shop.Category.list()}" name="categoryName"
					noSelection="${['':''] }"></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="goods.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${goodsInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="goods.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" id="priceLow" name="priceLow" /> To: <input
					type="text" id="priceHigh" name="priceHeigh" />
</div>



