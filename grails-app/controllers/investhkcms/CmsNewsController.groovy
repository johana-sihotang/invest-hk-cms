package investhkcms


import models.request.CreateNewsRequest
import models.request.UpdateNewsRequest


class CmsNewsController {
    static layout = "navbar-sidebar"

    NewsService newsService
    LocationService locationService

    def index() {
        List<News> news = newsService.getAllNews()
        [news: news]
    }

    def show(Long id) {
        News news = newsService.getNewsById(id)
        if (!news){
            flash.error = "News not found"
            redirect(action: 'index')
            return
        }
        [news: news]
    }

    def createNews(){
        def location = Location.list(sort: 'name', order: 'asc')
        def contentType = ContentType.list(sort: 'id', order: 'asc')
        def industry = Industry.list(sort: 'name', order: 'asc')
        [news: new News(), locations: location, contentType: contentType, industries: industry]
    }

    def save(CreateNewsRequest request) {
        if (!request.validate()) {
            respond request.errors, view: 'createNews'
            return
        }

        def imageFile = request.imageFile
        if (!imageFile || imageFile.empty) {
            flash.error = "Image file is required."
            respond request.errors, [view: 'createNews', model: [request: request]]
            return
        }

        if (!imageFile.contentType?.startsWith("image/")) {
            flash.error = "Uploaded file must be an image."
            respond request.errors, [view: 'createNews', model: [request: request]]
            return
        }

        if (imageFile.size > 2 * 1024 * 1024) {
            flash.error = "Image file is too large (max 2MB)."
            respond request.errors, [view: 'createNews', model: [request: request]]
            return
        }

        try {
            def fileName = UUID.randomUUID().toString() + "_" + imageFile.originalFilename
            def uploadDir = new File("${System.getProperty('user.dir')}/uploads/news")
            if (!uploadDir.exists()) {
                uploadDir.mkdirs()
            }

            def destination = new File(uploadDir, fileName)
            imageFile.transferTo(destination)
            def imagePath = "/uploads/news/${fileName}"

            newsService.createNews(request, imagePath)

            flash.success = "News created successfully"
            redirect(action: 'index')
        } catch (Exception e) {
            flash.error = "Error creating news: ${e.message}"
            respond request.errors, view: 'createNews'
        }
    }


    def edit(Long id){
        News news = newsService.getNewsById(id)
            if(!news) {
                flash.error = "News not found"
                redirect(action: "index")
                return
            }
        def location = Location.list(sort: 'name', order: 'asc')
        def contentType = ContentType.list(sort: 'id', order: 'asc')
        def industry = Industry.list(sort: 'name', order: 'asc')

        [news: news, locations: location, contentType: contentType, industries: industry]
    }

    def update(UpdateNewsRequest request) {
        if (!request.validate()) {
            News news = newsService.getNewsById(request.id)
            respond request.errors, view: 'edit', model: [news: news]
            return
        }

        try {
            def imageFile = request.imageFile
            def imagePath = null

            if (imageFile && !imageFile.empty) {
                // lakukan validasi file baru jika diperlukan
                def fileName = UUID.randomUUID().toString() + "_" + imageFile.originalFilename
                def uploadDir = new File("${System.getProperty('user.dir')}/uploads/news")
                if (!uploadDir.exists()) uploadDir.mkdirs()

                def destination = new File(uploadDir, fileName)
                imageFile.transferTo(destination)

                imagePath = "/uploads/news/${fileName}"
            }

            News news = newsService.updateNews(request, imagePath)
            flash.success = "News updated successfully"
            redirect(action: "show", id: news.id)

        } catch (Exception e) {
            flash.error = "Error updating news: ${e.message}"
            News news = newsService.getNewsById(request.id)
            respond request.errors, view: 'edit', model: [news: news]
        }
    }

    def delete(Long id){
        try {
            newsService.deleteNews(id)
            flash.success = "News deleted successfully"
        } catch (Exception e) {
            flash.error = "Error deleting news: ${e.message}"
        }
        redirect(action: 'index')
    }

}