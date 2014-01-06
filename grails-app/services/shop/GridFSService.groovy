package shop

import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.gridfs.GridFS
import com.mongodb.gridfs.GridFSFile
import org.springframework.beans.factory.InitializingBean
import org.imgscalr.Scalr
import java.awt.image.BufferedImage
import javax.imageio.ImageIO

class GridFSService implements InitializingBean {

	GridFS gridFS
	def grailsApplication

	void afterPropertiesSet() {
		def mongoSettings = grailsApplication.config.grails.mongo
		def mongo = new Mongo(mongoSettings.host.toString(), mongoSettings.port.intValue())
		def db = mongo.getDB(mongoSettings.databaseName.toString())
		boolean auth = db.authenticate(mongoSettings.username.toString(),mongoSettings.password.toCharArray())
		gridFS = new GridFS(db)
	}

	String saveFile(file, filename) {
		afterPropertiesSet()
		def inputStream = file.getInputStream()
		def contentType = file.getContentType()
		def gridFSFilename = null
		gridFSFilename=  save(inputStream, contentType, filename)
		return gridFSFilename
	}
	
	String saveResizePhoto(file, filename, photoSize) {
		afterPropertiesSet()
		def inputStream = file.getInputStream()
		def contentType = file.getContentType()
		def originalFilename = file.getOriginalFilename()
		def gridFSFilename = null
		def imageIn = ImageIO.read(inputStream)
		ByteArrayOutputStream os = new ByteArrayOutputStream()
		String extension = filename.split('\\.')[-1]
		BufferedImage scaledImage = Scalr.resize(imageIn, photoSize)
		ImageIO.write(scaledImage, extension, os)
		gridFSFilename=  save(os.toByteArray(), contentType, filename)
		return gridFSFilename
	}

	boolean delFile(filename) {
		afterPropertiesSet()

		try {
			if (gridFS.findOne(filename) == null) {
				log.info('File not exit')
				return false
			} else {
				log.info('Removing file ' + filename)
				gridFS.remove(filename)
			}
		}catch (Exception ex){
			throw ex
		}
		return true
	}

	def save(inputStream, contentType, originalFilename) {
		def inputFile = gridFS.createFile(inputStream)
		inputFile.setFilename(originalFilename)
		inputFile.save()
		return inputFile.filename
	}
	/*def saveMutilPhoto(inputStream, contentType, originalFilename) {
		def mediumInputStream = inputStream
		//save origin file
		
		def inputFile = gridFS.createFile(inputStream)
		String extension = originalFilename.split('\\.')[-1]
		String gridFSFilename=inputFile.id.toString() + '.' + extension
		inputFile.setFilename(gridFSFilename)
		inputFile.save()
		
		//save resize file
		def imageIn = ImageIO.read(mediumInputStream)
		ByteArrayOutputStream os = new ByteArrayOutputStream()
		BufferedImage scaledImage = Scalr.resize(imageIn, 800)
		ImageIO.write(scaledImage, contentType, os)
		def inputMediumFile = gridFS.createFile(os.toByteArray())
		String gridFSMediumFilename= MEDIUM + inputFile.id.toString() + '.' + extension
		inputMediumFile.setFilename(gridFSMediumFilename)
		inputMediumFile.save()
		return inputFile.filename
	}*/

	def retrieveFile(String filename) {
		return gridFS.findOne(filename)
	}
}