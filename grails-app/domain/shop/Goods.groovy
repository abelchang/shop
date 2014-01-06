package shop
import org.bson.types.ObjectId

class Goods {
	ObjectId id
	String title
	String description
	BigDecimal price
	String photoUrl
	Category category

    static constraints = {
    }
	String toString() {
		return title
	}
}
