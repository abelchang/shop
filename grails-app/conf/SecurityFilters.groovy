
class SecurityFilters {
	def filters = {
		loginCheck(controller: 'user', action: '*') {
           before = {
              if (!session.userId && !actionName in ['login','loginCheck']) {
                  redirect(action: 'login')
                  return false
               }
           }
       }
	}

}
