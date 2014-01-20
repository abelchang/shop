class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
		"/2"(view:"/index2")
        "500"(view:'/error')
		"/j_spring_security_check"(view:"/goods/index")
	}
}
