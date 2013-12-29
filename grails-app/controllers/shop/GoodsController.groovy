package shop



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GoodsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Goods.list(params), model:[goodsInstanceCount: Goods.count()]
    }

    def show(Goods goodsInstance) {
        respond goodsInstance
    }

    def create() {
        respond new Goods(params)
    }

    @Transactional
    def save(Goods goodsInstance) {
        if (goodsInstance == null) {
            notFound()
            return
        }

        if (goodsInstance.hasErrors()) {
            respond goodsInstance.errors, view:'create'
            return
        }

        goodsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'goodsInstance.label', default: 'Goods'), goodsInstance.id])
                redirect goodsInstance
            }
            '*' { respond goodsInstance, [status: CREATED] }
        }
    }

    def edit(Goods goodsInstance) {
        respond goodsInstance
    }

    @Transactional
    def update(Goods goodsInstance) {
        if (goodsInstance == null) {
            notFound()
            return
        }

        if (goodsInstance.hasErrors()) {
            respond goodsInstance.errors, view:'edit'
            return
        }

        goodsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Goods.label', default: 'Goods'), goodsInstance.id])
                redirect goodsInstance
            }
            '*'{ respond goodsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Goods goodsInstance) {

        if (goodsInstance == null) {
            notFound()
            return
        }

        goodsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Goods.label', default: 'Goods'), goodsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'goodsInstance.label', default: 'Goods'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def searchForm() {}
	def search() {
		def c = Goods.createCriteria()
		def goodsList = c.list {
			if(params.categoryName) {
				eq('categoryName', params.categoryNames)
			}
		}
	}
}
