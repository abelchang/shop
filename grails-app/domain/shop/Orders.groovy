package shop
import org.bson.types.ObjectId

enum OrderStatus {
	NEW,SHIPPED,CLOSE
}

class Orders {
	ObjectId id
	Cart cart
	String receiverName
	String address
	String phone
	BigDecimal price
	OrderStatus status
	Date orderDate
	Date shipDate
	static belongsTo = [user: User]

    static constraints = {
		receiverName(size:2..10,blank:false)
		address(maxSize:200,blank:false)
		price(min:0.0)
		shipDate(nullable:true)
		cart(validator: { cart ->
			if(cart && LineItem.countByCart(cart) > 0) {
				return true
			}
			return 'blank'
		})
    }
}
