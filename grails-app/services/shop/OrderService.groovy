package shop

import grails.transaction.Transactional
import org.springframework.transaction.annotation.*

@Transactional
class OrderService {

    def prepareCart(session) {
		def cart = null
		if(session.cartId) {
			cart = Cart.get(session.cartId)
			if(cart && cart.status == CartStatus.NEW) {
				log.info("current Cart return!")
				return cart
			}
		}
		
		if(session.userId) {
			def user = User.get(session.userId)
			log.info("session user:${user}")
			cart = Cart.findByUserAndStatus(user, CartStatus.NEW)
			
			if(cart) {
				session.cartId = cart.id
				log.info("session.cartId:${session.cartId}")
				return cart
			} else {
				cart = new Cart(user:user, status:CartStatus.NEW)
				if(cart.save()) {
					session.cartId = cart.id
					log.info("new session.cartId:${session.cartId}")
					return cart
				}
			}
		}
		log.info("return null cart!")
		return cart
    }
	
	def addToCart(session, goodsId) {
		def cart = prepareCart(session)
		if(cart) {
			def goods = Goods.get(goodsId)
			if(goods) {
				def lineItem = null
				lineItem = LineItem.findByCartAndGoods(cart, goods)
				if(lineItem) {
					log.info("add the product +1!")
					lineItem.itemNumber = lineItem.itemNumber + 1
					lineItem.save()
				} else {
					log.info("add the new one to cart!")
					lineItem = new LineItem(cart:cart, goods:goods, itemNumber:1)
					lineItem.save()
				}
				return lineItem
			}
		}
		log.info("no cart!!")
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW )
	def saveOrder(session, orders) {
		def cart = prepareCart(session)
		if(cart) {
			orders.cart = cart
			orders.user = cart.user
			orders.orderDate = new Date()
			orders.price = cart.totalPrice()
			orders.status = OrderStatus.NEW
			orders.properties.each {
				log.info("orders:${it}")
			}
			
			if(!orders.hasErrors() && orders.save()) {
				cart.status = CartStatus.ORDERED
				if(cart.save()) {
					session.cardId = null
					return orders
				}
			} else {
				orders.errors.each {
					log.info("error orders:${it}")
				}
			}
		}
		throw new RuntimeException('Save order failed!')
	}
}
