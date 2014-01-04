package shop



import static org.springframework.http.HttpStatus.*

import javax.media.jai.operator.OrDescriptor;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrdersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def orderService

    def index = {
        if(!params.max) params.max = 10
		def user = User.get(session.userId)
		log.info("user:${user?.userName}")
		if(user) {
			def orderList
			def orderCount
			params.order = 'desc'
			params.sort = 'orderDate'
			if(params.status == 'new') {
				log.info("new")
				orderList = Orders.findAllByUserAndStatus(user, OrderStatus.NEW, params)
				orderCount = Orders.countByUserAndStatus(user,OrderStatus.NEW)
			} else if(params.status == 'old'){
				log.info("old order")
				params.sort = 'shipDate'
				orderList = Orders.findAllByUserAndStatusNotEqual(user, OrderStatus.NEW, params)
				orderCount = Orders.countByUserAndStatusNotEqual(user, OrderStatus.NEW)
			} else {
				log.info("else")
				orderList = Orders.findAllByUser(user, params)
				orderCount = Orders.countByUser(user)
				log.info("${orderList}")
				log.info("${orderCount}")
			}
			[ordersInstanceList: orderList, ordersInstanceListTotal:orderCount]
		}
    }

    def show(Orders ordersInstance) {
        respond ordersInstance
    }

    def create() {
		def orders = new Orders(params)
		def cart = orderService.prepareCart(session)
		def user = cart.user
		log.info("${user.userName}")
		orders.receiverName = user.userName
		orders.phone = user.phone
		orders.address = user.address
		
		[ordersInstance:orders, cart: cart]
    }
	
    def save = {
        
		def orders = new Orders(params)
		
		try {
			orderService.saveOrder(session, orders)
			flash.message = message(code:"order.save.success", default:"save sucess")
			redirect(acton:'index')
		} catch(Exception ex) {
			flash.message = message(code:"order.save.failed", default:"save failed")
			def cart = orderService.prepareCart(session)
			render(view:'create', model:[orders:orders, cart:cart])
		}

       /* if (ordersInstance.hasErrors()) {
            respond ordersInstance.errors, view:'create'
            return
        }

        ordersInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ordersInstance.label', default: 'Orders'), ordersInstance.id])
                redirect ordersInstance
            }
            '*' { respond ordersInstance, [status: CREATED] }
        }*/
    }

    def edit(Orders ordersInstance) {
        respond ordersInstance
    }

    @Transactional
    def update(Orders ordersInstance) {
        if (ordersInstance == null) {
            notFound()
            return
        }


        if (ordersInstance.hasErrors()) {
            respond ordersInstance.errors, view:'edit'
            return
        }

        ordersInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Orders.label', default: 'Orders'), ordersInstance.id])
                redirect ordersInstance
            }
            '*'{ respond ordersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Orders ordersInstance) {

        if (ordersInstance == null) {
            notFound()
            return
        }

        ordersInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Orders.label', default: 'Orders'), ordersInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordersInstance.label', default: 'Orders'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def markAsReceived = {
		def orders = Orders.get(params.id)
		log.info("markAsReceived order id: ${orders.id}")
		if(orders && orders.user.id == session.userId && orders.status == OrderStatus.SHIPPED) {
			orders.status = OrderStatus.CLOSE
			log.info("change order status: ${orders.status}")
			orders.save()
		}
		redirect(action:'index' ,params:[status:'old'])
	}
}
