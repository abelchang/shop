package shop

import org.imgscalr.Scalr
import java.awt.image.BufferedImage
import javax.imageio.ImageIO

class FileController {
	def GridFSService
    def show() {
		def file = GridFSService.retrieveFile(params.photoUrl)
		if(file != null) {
			response.outputStream << file.getInputStream()
			response.contentType = file.getContentType()
		} else {log.info("File not Found!")}
	}
}
