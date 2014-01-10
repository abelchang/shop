import shop.Category
import shop.Goods
import shop.User
import shop.Role
import shop.UserRole


class BootStrap {

	def init = { servletContext ->
		User user = new User(username:"abel",password:"2uiiggii",email:"ccabel42@gmail.com", phone:"0918624807", address:"台北市中山北路七段一百九巷一樓",enabled:true,passwordExpired:false, accountExpired:false,accountLocked:false).save()
		Role role = new Role(authority:'ROLE_ADMIN').save()
		new UserRole(user:user, role:role).save()
		new Role(authority:'ROLE_CUSTOMER').save()
		new Role(authority:'ROLE_MANAGER').save()
	}
	def destroy = {
	}
}

