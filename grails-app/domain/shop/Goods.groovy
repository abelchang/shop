package shop
import org.bson.types.ObjectId

class Goods {
	ObjectId id
	String title
	String description
	BigDecimal price
	String photoUrl
	Category category
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
    }
	
	static mapping = {
		autoTimeStamp true
		cache true
	}
	
	String toString() {
		return title
	}
}
