package investhkcms

import grails.plugin.springsecurity.annotation.Secured
import models.request.CreateNewsRequest
import models.request.UpdateNewsRequest


class AdminNewsController {
    static layout = "cms-layout"

    NewsService newsService

    @Secured(['ROLE_ADMIN'])
    def index() {
        def result = newsService.getAllNews(params)
        def news = result.toList()
        def total = result.totalCount
        [news: news, total: total, params: params]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Long id) {
        News news = newsService.getNewsById(id)
        if (!news){
            flash.error = "News with ID ${id} not found"
            redirect(controller: 'error', action: 'notFound')
            return
        }
        [news: news]
    }

    @Secured(['ROLE_ADMIN'])
    def createNews(){
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
            newsService.handleNewsCreate(request)
            flash.success = "News created successfully"
            redirect(action: 'index')
        } catch (Exception e) {
            flash.error = e.message
            respond request.errors, view: 'createNews', model: [request: request]
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
            newsService.handleNewsUpdate(request)
            flash.success = "News update successfully"
            redirect(action: 'index')
        } catch (Exception e) {
            flash.error = e.message
            respond request.errors, view: 'createNews', model: [request: request]
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