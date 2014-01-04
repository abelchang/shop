package shop

class RegisterCommand {
	String password
	String passwordAgain
	
	static constratints = {
		passwordAgain(validator: {
			val ->
			if(obj.password != val)
				return 'differentPassword'
		})
	}

}
