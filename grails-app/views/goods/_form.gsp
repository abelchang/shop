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
	<g:select id="category" name="category.id" from="${shop.Category.list()}" optionKey="id" optionValue="categoryName" required="" value="${goodsInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="goods.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${goodsInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="goods.photoUrl.label" default="Photo Url" />
		
	</label>
	<input type="file" name="myFile" />
</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="goods.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: goodsInstance, field: 'price')}" required=""/>
</div>



