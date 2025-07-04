package investhkcms

import grails.plugin.springsecurity.annotation.Secured
import models.request.CreateNewsRequest

class AdminDashboardController {
    class AdminNewsController {
        static layout = "cms-layout"

        NewsService newsService

        @Secured(['ROLE_ADMIN'])
        def index() {
            List<News> news = newsService.getAllNews()
            [news: news]
        }

        @Secured(['ROLE_ADMIN'])
        def show(Long id) {
            News news = newsService.getNewsById(id)
            if (!news) {
                flash.error = "News not found"
                redirect(action: 'index')
                return
            }
            [news: news]
        }

        @Secured(['ROLE_ADMIN'])
        def createNews() {
            def location = Location.list(sort: 'name', order: 'asc')
            def contentType = ContentType.list(sort: 'id', order: 'asc')
            def industry = Industry.list(sort: 'name', order: 'asc')
            [news: new News(), locations: location, contentType: contentType, industries: industry]
        }

        @Secured(['ROLE_ADMIN'])
        def save(CreateNewsRequest request) {
            if (!request.validate()) {
                respond request.errors, view: 'createNews'
                return
            }

            try {
                newsService.handleNewsCreation(request)
                flash.success = "News created successfully"
                redirect(action: 'index')
            } catch (Exception e) {
                flash.error = e.message
                respond request.errors, view: 'createNews', model: [request: request]
            }
        }
    }
}