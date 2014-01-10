package shop



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.context.SecurityContextHolder

@Transactional(readOnly = true)
class UserController {

	def springSecurityService
	def orderService

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond User.list(params), model:[userInstanceCount: User.count()]
	}

	def show(User userInstance) {
		respond userInstance
	}

	def create() {
		respond new User(params)
	}

	@Transactional
	def save(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}

		userInstance.save flush:true
		def roleUser = Role.findByAuthority('ROLE_CUSTOMER')
		log.info("roleUser:${roleUser}")
		UserRole.create(userInstance, roleUser, true)
		log.info("userInstance id: ${userInstance.id}")

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'userInstance.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*' { respond userInstance, [status: CREATED] }
		}
	}

	def edit(User userInstance) {
		respond userInstance
	}

	@Transactional
	def update(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'edit'
			return
		}

		userInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*'{ respond userInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(User userInstance) {

		log.info("userInstance: ${userInstance}")
		log.info("params: ${params}")

		if (userInstance == null) {
			log.info("not found")
			notFound()
			return
		}

		userInstance.delete flush:true
		log.info("delete susscess")
		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'userInstance.label', default: 'User'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def register() {
	}

	def registerSave(User userInstance) {

		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}

		userInstance.save flush:true
		def roleUser = Role.findByAuthority('ROLE_CUSTOMER')
		UserRole.create(userInstance, roleUser, true)
		autoLogin(userInstance.username)

		redirect(controller:'goods', action:'index')

		/*request.withFormat {
		 form {
		 flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
		 redirect userInstance
		 }
		 '*' { respond userInstance, [status: CREATED] }
		 }*/
	}

	def autoLogin(String username) {
		springSecurityService.reauthenticate username
		session['SPRING_SECURITY_CONTEXT'] = SecurityContextHolder.context
		log.info("session:${session}")
	}
}
