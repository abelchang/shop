package shop

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.bson.types.ObjectId

@Transactional(readOnly = true)
class GoodsController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def orderService
	def GridFSService
	def springSecurityService
	static int largeSize = 1600
	static int mediumSize = 800
	static String LARGE = "large"
	static String MEDIUM = "medium"

	def index(Integer max) {
		log.info("show session:${session}")
		if(springSecurityService.currentUser) {
			session.userId = springSecurityService.currentUser.id
			log.info("currentUser: ${session.userId}")
		}
		params.max = Math.min(max ?: 10, 100)
		respond Goods.list(params), model:[goodsInstanceCount: Goods.count()]
	}

	def show(Goods goodsInstance) {
		respond goodsInstance
	}

	def create() {
		respond new Goods(params)
	}

	@Transactional
	def save() {
		log.info("save params:${params}")
		def goodsInstance = new Goods()
		goodsInstance.properties = params
		if (goodsInstance == null) {
			notFound()
			return
		}

		if (goodsInstance.hasErrors()) {
			respond goodsInstance.errors, view:'create'
			return
		}
		
		def file = params.myFile
		log.info("file:" + file.getOriginalFilename())
		ObjectId idU= new ObjectId()
		String extension = file.getOriginalFilename().split('\\.')[-1]
		String gridFSFilename= idU.toString() + '.' + extension
		//save medium photo
		goodsInstance.photoUrl = GridFSService.saveResizePhoto(file, MEDIUM+gridFSFilename, mediumSize)
		log.info("goodsInstance.photoUrl:"+goodsInstance.photoUrl)

		goodsInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'goodsInstance.label', default: 'Goods'),
					goodsInstance.id
				])
				redirect goodsInstance
			}
			'*' { respond goodsInstance, [status: CREATED] }
		}
	}

	def edit(Goods goodsInstance) {
		respond goodsInstance
	}

	@Transactional
	def update(Goods goodsInstance) {
		if (goodsInstance == null) {
			notFound()
			return
		}

		if (goodsInstance.hasErrors()) {
			respond goodsInstance.errors, view:'edit'
			return
		}

		goodsInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Goods.label', default: 'Goods'),
					goodsInstance.id
				])
				redirect goodsInstance
			}
			'*'{ respond goodsInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Goods goodsInstance) {

		if (goodsInstance == null) {
			notFound()
			return
		}

		goodsInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Goods.label', default: 'Goods'),
					goodsInstance.id
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
					message(code: 'goodsInstance.label', default: 'Goods'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def searchForm() {

	}
	def search() {
		if(!params.max) {
			params.max = 1
		}

		def searchClosure = {
			if(params.categoryName) {
				eq('categoryName', params.categoryName)
			}
			if(params.title) {
				like('title',"%${params.title}%")
			}
			if(params.priceLow) {
				ge('price',new BigDecimal (params.priceLow))
			}
			if(params.priceHigh) {
				le('price',new BigDecimal (params.priceHigh))
			}
			if(params.description) {
				like('description',"%${params.description}%")
			}
		}

		def c = Goods.createCriteria()
		def goodsList = c.list(params, searchClosure)

		render(view: 'index', model:[goodsInstanceList: goodsList, goodsInstanceCount:goodsList.totalCount])
	}

	def afterInterceptor = [action: this.&addCartToModel, only:['index', 'search']]

	private def addCartToModel(model) {
		model.cart = orderService.prepareCart(session)
		log.info("addCartToModel:${model.cart}")
	}

	def addToCart = {
		if(params.goodsId) {
			log.info("add to cart in controller!")
			orderService.addToCart(session, params.goodsId)
		} else {
			log.info("can not add to cart!")
		}
		redirect(action:"index")
	}
	
//	def addToCart = {
//		if(session.userId && params.goodsId) {
//			log.info("add to cart in controller!")
//			orderService.addToCart(session, params.goodsId)
//		} else {
//			log.info("can not add to cart!")
//		}
//		redirect(action:"index")
//	}

	def removeFromCart = {
		def lineItem = LineItem.get(params.id)
		log.info("lineItem:${lineItem.id}")
		log.info("lineItem.cart.id:${lineItem.cart.id}")
		log.info("session.cartId:${session}")
		if(lineItem && lineItem.cart.id == session.cartId) {
			log.info("delete lineItem:${lineItem.id}")
			lineItem.delete();
		}

		redirect(url : params.forwardURI-request.contextPath)
	}

	def changeItemNumber = {
		def lineItem = LineItem.get(params.id)
		if(lineItem && lineItem.cart.id == session.cartId) {
			lineItem.properties = params
			if(!lineItem.hasErrors() && lineItem.save()) {
				flash.message = message(code:'lineItem.itemNumber.update.success', default:'update item number success')
			} else {
				message(code:'lineItem.itemNumber.update.failed', default:'update item number failed')
			}
		}

		redirect(url : params.forwardURI-request.contextPath)
	}
	
	def chinkenP = {render (template: 'chickenP')}
	def aboutP = {render (template: 'aboutP')}
	def careP = {render (template: 'careP')}
	def home = {render (template: 'home')}
	def info = {render (template: 'info')}
}


