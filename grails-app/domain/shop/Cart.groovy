package shop
import org.bson.types.ObjectId
public enum CartStatus {
	NEW, ORDERED
}

class Cart {
	ObjectId id
	static hasMany = [lineItems: LineItem]
	static belongsTo = [user: User]
	CartStatus status = CartStatus.NEW

    static constraints = {
		status blank: false 
    }
	
	public def totalPrice() {
		def price = 0
		lineItems.each {
			price += it.goods?.price * it.itemNumber
		}
		return price
	}
}
