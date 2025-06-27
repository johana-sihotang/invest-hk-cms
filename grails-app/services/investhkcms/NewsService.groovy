package investhkcms

import grails.gorm.transactions.Transactional
import models.request.CreateNewsRequest
import models.request.UpdateNewsRequest

@Transactional
class NewsService {

    List<News> getAllNews() {
        return News.list(short: "title")
    }

    News getNewsById(Long id){
        return News.get(id)
    }

    @Transactional
    News createNews(CreateNewsRequest request, String imagePath){
        News news = new News()
        news.title = request.title
        news.imageCaption = request.imageCaption
        news.subTitle = request.subTitle
        news.content = request.content
        news.location = Location.get(request.locationId)
        news.contentType = ContentType.get(request.contentTypeId)
        news.industry = Industry.get(request.industryId)
        news.publicationDate = new Date()

        if (imagePath) {
            news.image = imagePath
        }

        if (!news.save(flush:true)){
            throw new RuntimeException("Failed to save data")
        }

        return news
    }

    @Transactional
    News updateNews(UpdateNewsRequest request, String imagePath){
        News news = News.get(request.id)
        if (!news) {
            throw new RuntimeException("News not found with id: ${request.id}")
        }

        news.title = request.title
        news.imageCaption = request.imageCaption
        news.subTitle = request.subTitle
        news.content = request.content
        news.location = Location.get(request.locationId)
        news.contentType = ContentType.get(request.contentTypeId)
        news.industry = Industry.get(request.industryId)
        news.publicationDate = new Date()

        if (imagePath) {
            news.image = imagePath
        }

        if (!news.save(flush:true)){
            throw new RuntimeException("Failed to save data")
        }

        return news
    }

    @Transactional
    void deleteNews(Long id) {
        News news = News.get(id)
        if (!news){
            throw new RuntimeException("News not found with id: ${id}")
        }

        if (news.image) {
            def imagePath = new File("${System.getProperty('user.dir')}${news.image}")
            if (imagePath.exists()) {
                imagePath.delete()
            }
        }

        news.delete(flush: true)
    }

    @Transactional
    def handleNewsCreation(CreateNewsRequest request) {
        def imageFile = request.imageFile

        if (!imageFile || imageFile.empty) {
            throw new IllegalArgumentException("Image file is required.")
        }

        if (!imageFile.contentType?.startsWith("image/")) {
            throw new IllegalArgumentException("Uploaded file must be an image.")
        }

        if (imageFile.size > 2 * 1024 * 1024) {
            throw new IllegalArgumentException("Image file is too large (max 2MB).")
        }

        def fileName = UUID.randomUUID().toString() + "_" + imageFile.originalFilename
        def uploadDir = new File("${System.getProperty('user.dir')}/uploads/news")
        if (!uploadDir.exists()) uploadDir.mkdirs()

        def destination = new File(uploadDir, fileName)
        imageFile.transferTo(destination)

        def imagePath = "/uploads/news/${fileName}"
        createNews(request, imagePath)
    }
}