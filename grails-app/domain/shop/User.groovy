package shop
import org.bson.types.ObjectId

class User {
	ObjectId id
	String userName
	String password
	//transient password2
	String email
	String phone
	String address

	static constraints = {
		userName(size:2..10, blank:false)
		password(size:6..12, blank:false)
		email(email:true, unique:true, blank:false)
		phone(blank:true, nullable: true)
		address(blank:true,nullable:true)
		/*password2(validator: {val, obj ->
			if(val != obj.password)
				return ['different.password']
		})*/
	}
	
}
