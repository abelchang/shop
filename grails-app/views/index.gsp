<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="layout2" />
<title>後頭厝</title>
</head>
<body>
	<div class="main" id="page-body" role="main">
		<div id="homeBD" class="text-center">
			<a href="#homeB" class="" data-rel="popup" data-transition="slideup"
				data-position-to="window"> <img
				src="${createLink(controller:'File', action:'show', params:[photoUrl:"GGbox2.png"])}"
				id="homeButton" class="bigHB text-center" />
			</a>
		</div>
		<div class="text-center">
		<figure id="homeSB">
			<a href="#aboutP" data-rel="popup" data-transition="slideup"
				data-position-to="window"> <img
				src="${createLink(controller:'File', action:'show', params:[photoUrl:"aboutP0.png"])}"
				id="homeButton" class="smailHB" />
			<figcaption>品牌緣起</figcaption> </a>
			</figure>
			<figure id="homeSB">
			<a href="#chickenP" data-rel="popup" data-transition="slideup"
				data-position-to="window"> <img
				src="${createLink(controller:'File', action:'show', params:[photoUrl:"chickenP0.png"])}"
				id="homeButton" class="smailHB" />
			<figcaption>生產履歷</figcaption>
			</a> 
			</figure>
			<figure id="homeSB">
			<a href="#careP" data-rel="popup" data-transition="slideup"
				data-position-to="window"> <img
				src="${createLink(controller:'File', action:'show', params:[photoUrl:"careP0.png"])}"
				id="homeButton" class="smailHB" />
			<figcaption>檢驗保障</figcaption> 
			</a>
			</figure>
			<figure id="homeSB">
			<a href="#info" data-rel="popup" data-transition="slideup"
				data-position-to="window"> <img
				src="${createLink(controller:'File', action:'show', params:[photoUrl:"infoP0.png"])}"
				id="homeButton" class="smailHB" />
			<figcaption>訂購資訊</figcaption>
			</a>
			</figure>
			<figure id="homeSB">
			<a href="#productGG" data-rel="popup" data-transition="slideup"
				data-position-to="window"> <img
				src="${createLink(controller:'File', action:'show', params:[photoUrl:"ggP0.png"])}"
				id="homeButton" class="smailHB" />
			<figcaption>我是雞精</figcaption>
			</a>
			</figure>
			<figure id="homeSB">
				<a href="#productGY" data-rel="popup" data-transition="slideup"
					data-position-to="window"> <img
					src="${createLink(controller:'File', action:'show', params:[photoUrl:"gyP0.png"])}"
					id="homeButton" class="smailHB" />
				<figcaption>妳是雞油</figcaption>
					</a>
			</figure>
			<figure id="homeSB">
				<a href="#productGT" data-rel="popup" data-transition="slideup"
					data-position-to="window"> <img
					src="${createLink(controller:'File', action:'show', params:[photoUrl:"gtP0.png"])}"
					id="homeButton" class="smailHB" />
				<figcaption>他是雞湯</figcaption>
					</a>
			</figure>

		</div>
		<%--<div class="ui-block-b" id="content" overflow:auto;">
				<g:render template="/goods/home"></g:render>
			</div>
		--%>
		<%--<div class="ui-grid-b">
			<div class="ui-block-a">
				<a href="#productGY" class="ui-btn" id="buyit" data-rel="popup"
					data-transition="slideup" data-position-to="window"><span>雞油</span></a>
			</div>
			<div class="ui-block-b">
				<a href="#productGG" class="ui-btn" id="buyit" data-rel="popup"
					data-transition="slideup" data-position-to="window"><span>雞精</span></a>
			</div>
			<div class="ui-block-c">
				<a href="#productGT" class="ui-btn" id="buyit" data-rel="popup"
					data-transition="slideup" data-position-to="window"><span>雞湯</span></a>
			</div>
		</div>
		--%>
		<div data-role="popup" id="productGY" class="popupDG">
			<g:render template="/goods/productGY"></g:render>
		</div>
		<div data-role="popup" id="productGG" class="popupDG">
			<g:render template="/goods/productGG"></g:render>
		</div>
		<div data-role="popup" id="productGT" class="popupDG">
			<g:render template="/goods/productGT"></g:render>
		</div>
		<div data-role="popup" id="aboutP" class="popupDG">
			<g:render template="/goods/aboutP"></g:render>
		</div>
		<div data-role="popup" id="careP" class="popupDG">
			<g:render template="/goods/careP"></g:render>
		</div>
		<div data-role="popup" id="chickenP" class="popupDG">
			<g:render template="/goods/chickenP"></g:render>
		</div>
		<div data-role="popup" id="homeB" class="popupDG">
			<g:render template="/goods/home"></g:render>
		</div>
		<div data-role="popup" id="info" class="popupDG">
			<g:render template="/goods/info"></g:render>
		</div>
	</div>

</body>
</html>
