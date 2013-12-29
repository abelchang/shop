import shop.Category
import shop.Goods


class BootStrap {

	def init = { servletContext ->
		/*def category = new Category(categoryName:'book')
		if(category.save()) {
			log.info("new category save")
			def allgoods = [
				new Goods(title:'web design',description:'how to buld a beautiful web site',price:'100.0',photoUrl:'tmp'),
				new Goods(title:'web program',description:'how to write beautiful web process',price:'120.5',photoUrl:'tmp')
			]
			allgoods*.category = category
			if(!allgoods*.save()) {
				allgoods*.errors.allErrors.each { log.info(it) }
				return
			}
			log.info('all product save')
		}*/
	}
	def destroy = {
	}
}

