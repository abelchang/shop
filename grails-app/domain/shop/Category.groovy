package shop

class Category {
	
	String categoryName
	static hasMany = [goods: Goods]

    static constraints = { 
		categoryName (unique:true)
    }
	String toString() {
		return categoryName
	}
}
