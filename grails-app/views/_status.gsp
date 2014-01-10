<div id="status" role="complementary"  >
<div id="grailsLogo" role="banner"><a href="#"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a>
		</div>
<sec:ifLoggedIn>Hi <sec:username/></sec:ifLoggedIn>
<ul data-role="listview" data-inset="true">
<li data-icon="false">
	<g:link controller="goods" action="index">
			<g:message code="goods.list.label" default="Product List" />
	</g:link>
</li>
<li data-icon="false">
	<g:link controller="orders" action="index">

			<g:message code="goods.list.label" default="Orders List" />

	</g:link>
</li>
<li data-icon="false">
	<g:link controller="user" action="index">

			<g:message code="goods.list.label" default="User List" />

	</g:link>
</li>
<sec:ifNotLoggedIn>
<li data-icon="false">
	<g:link controller="login">

			<g:message code="login.list.label" default="Login" />

	</g:link>
</li>
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
<li data-icon="false">
<g:link controller="logout">

			<g:message code="logout.list.label" default="Logout" />

	</g:link>
</li>
</sec:ifLoggedIn>
</ul>
</div>
<script type="text/javascript">
<!--

//-->

$(function() {
	$('nav#menu').mmenu();
	// 先取得 #cart 及其 top 值
    var $cart = $('#navmenu');
    if ($cart != null && $cart.offset() != null) {
        _top = $cart.offset().top;

        // 當網頁捲軸捲動時
        var $win = $(window).scroll(function () {
            // 如果現在的 scrollTop 大於原本 #cart 的 top 時
            if ($win.scrollTop() >= _top) {
                // 如果 $cart 的座標系統不是 fixed 的話
                if ($cart.css('position') != 'fixed') {
                    // 設定 #cart 的座標系統為 fixed
                    $cart.css({
                        position: 'fixed',
                        top: 0
                    });
                }
            } else {
                // 還原 #cart 的座標系統為 absolute
                $cart.css({
                    position: 'absolute',
                    top: _top
                });
            }
        });
    }
	
});
</script>
