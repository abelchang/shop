package shop
import org.bson.types.ObjectId

class LineItem {
	ObjectId id
	Goods goods
	int itemNumber = 1
	static belongsTo = [cart: Cart]

    static constraints = {
		itemNumber min:1
    }
}
