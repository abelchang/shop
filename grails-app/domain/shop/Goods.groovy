package shop

class Goods {
	
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
