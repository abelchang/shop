package shop

import java.util.Date;

import org.bson.types.ObjectId

class User {

	transient springSecurityService
	ObjectId id
	String username
	String password
	String email
	String phone
	String address
	
	Date dateCreated
	Date lastUpdated
	
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password size:6..12, blank: false
		email(email:true, unique:true, blank:false)
		phone(blank:true, nullable: true)
		address(blank:true,nullable:true)
	}

	static mapping = {
		password column: '`password`'
		autoTimeStamp true
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	String toString() {
		return "${username}"
	}
}



