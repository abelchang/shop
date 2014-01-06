package shop
import org.bson.types.ObjectId

class Category {
	ObjectId id
	String categoryName
	static hasMany = [goods: Goods]

    static constraints = { 
		categoryName (unique:true)
    }
	String toString() {
		return categoryName
	}
}
