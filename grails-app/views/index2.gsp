<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>後頭厝</title>
</head>
<body>
	<div class="main" id="page-body" role="main">
		<div class="ui-grid-a">
			<div class="ui-block-a" id="blockButton" style="height: 400px;">
				<table>
					<tr>
						<td rowspan="4"><g:remoteLink controller="goods"
								action="home" update="content">
								<img
									src="${createLink(controller:'File', action:'show', params:[photoUrl:"GGbox.png"])}"
									id="homeButton" class="bigHB" title="滴雞精" />
							</g:remoteLink></td>

						<td class="pull_bottom"><g:remoteLink controller="goods"
								action="info" update="content">
								<div class="smailHBDiv">
									<img
										src="${createLink(controller:'File', action:'show', params:[photoUrl:"infoP24.png"])}"
										id="homeButton" class="smailHB" title="訂購資訊" />
								</div>
							</g:remoteLink></td>
					</tr>
					<tr>
						<td class="pull_bottom"><g:remoteLink controller="goods"
								action="aboutP" update="content">
								<div class="smailHBDiv">
									<img
										src="${createLink(controller:'File', action:'show', params:[photoUrl:"aboutPP.png"])}"
										id="homeButton" class="smailHB" title="關於我" />
								</div>
							</g:remoteLink></td>
					</tr>
					<tr>
						<td class="pull_bottom"><g:remoteLink controller="goods"
								action="careP" update="content">
								<div class="smailHBDiv">
									<img
										src="${createLink(controller:'File', action:'show', params:[photoUrl:"carePP.png"])}"
										id="homeButton" class="smailHB" title="關心我" />
								</div>
							</g:remoteLink></td>
					</tr>
					<tr>
						<td class="pull_bottom"><g:remoteLink controller="goods"
								action="chinkenP" update="content">
								<div class="smailHBDiv">
									<img
										src="${createLink(controller:'File', action:'show', params:[photoUrl:"chickenPP.png"])}"
										id="homeButton" class="smailHB" title="關於雞" />
								</div>
							</g:remoteLink></td>
					</tr>
				</table>
			</div>
			<div class="ui-block-b" id="content"
				style="height: 400px; overflow: auto;">
				<g:render template="/goods/home"></g:render>
			</div>
		</div>
		<div class="ui-grid-b">
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
		<div data-role="popup" id="productGY"
			style="width: 70%; margin: 0 auto;">
			<g:render template="/goods/productGY"></g:render>
		</div>
		<div data-role="popup" id="productGG"
			style="width: 70%; margin: 0 auto;">
			<g:render template="/goods/productGG"></g:render>
		</div>
		<div data-role="popup" id="productGT"
			style="width: 70%; margin: 0 auto;">
			<g:render template="/goods/productGT"></g:render>
		</div>
	</div>

</body>
</html>
