
class SecurityFilters {
	def filters = {
		loginCheck(controller: 'user', action: '*') {
           before = {
              if (!session.user && !actionName in ['login','loginCheck']) {
                  redirect(action: 'login')
                  return false
               }
           }
       }
	}

}
