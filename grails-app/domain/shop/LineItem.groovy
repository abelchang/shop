package shop

class LineItem {
	
	Goods goods
	int itemNumber = 1
	static belongsTo = [cart: Cart]

    static constraints = {
		itemNumber min:1
    }
}
