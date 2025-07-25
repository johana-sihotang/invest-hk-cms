package investhkcms

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.SpringSecurityService
import models.request.CreateNewsRequest
import models.request.UpdateNewsRequest

import java.time.LocalDate
import java.time.ZoneId

@Transactional
class NewsService {

    SpringSecurityService springSecurityService

    List<News> getAllNews(Map params) {
        def criteria = News.createCriteria()
        def max = params.int('max') ?: 10
        def offset = params.int('offset') ?: 0
        def results = criteria.list (max: max, offset: offset) {
            applyFilterSearch(delegate, params)
            applySorting(delegate, params)
        } as List<News>
        return results
    }
     private void applyFilterSearch(def query, Map params) {
         def search = params.search?.trim()
         if (search) {
             query.or {
                 ilike('title', "%${search}%")
                 location {
                     ilike('name', "%${search}%")
                 }
                 author {
                     ilike('username', "%${search}%")
                 }
             }
         }
         if (params.contentType) {
             query.or {
                 contentType {
                     ilike('name', "%${params.contentType}%")
                 }
             }
         }
         if (params.location) {
             query.or {
                 location {
                     ilike('name', "%${params.location}%")
                 }
             }
         }
         if (params.industry) {
             query.or {
                 industry {
                     ilike('name', "%${params.industry}%")
                 }
             }
         }
     }

     static void applySorting(def query, Map params) {
        def sort = params.sort ?: 'id'
        def order = params.order ?: 'asc'

         if (sort == 'location.name'){
             query.createAlias('location', 'loc')
             query.order('loc.name', order)
         } else if (sort == 'contentType.name'){
             query.createAlias('contentType', 'ct')
             query.order('ct.name', order)
         } else if (sort == 'industry.name'){
             query.createAlias('industry', 'i')
             query.order('i.name', order)
         } else {
             query.order(sort, order)
         }
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

        def currentAdmin = springSecurityService.currentUser as Admin
        news.author = currentAdmin


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
    def handleNewsCreate(CreateNewsRequest request) {
        def imagePath = saveImage(request.imageFile)
        createNews(request, imagePath)
    }

    @Transactional
    def handleNewsUpdate(UpdateNewsRequest request) {
        def imagePath = saveImage(request.imageFile)
        updateNews(request, imagePath)
    }

    private String saveImage(def imageFile){
        def fileName = UUID.randomUUID().toString() + "_" + imageFile.originalFilename
        def uploadDir = new File("${System.getProperty('user.dir')}/uploads/news")
        if (!uploadDir.exists()) uploadDir.mkdir()

        def destination = new File(uploadDir, fileName)
        imageFile.transferTo(destination)

        return "/uploads/news/${fileName}"
    }

}