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

    List<News> getAllNews(){
        return News.list(sort: "publicationDate")
    }

    List<News> searchNews(Map params) {
        def searchFields = ['title', 'contentType', 'location', 'publicationDate']
        def search = params.findAll {key, value -> searchFields.contains(key) && value }
        return News.findAllWhere(search)
    }

//    List<News> getAllNews(Map params) {
//        def criteria = News.createCriteria()
//        return criteria.list {
//            applySearch(delegate, params)
//            applySorting(delegate,params)
//        }
//    }
//     private void applySearch(def query, Map params) {
//         def search = params.search?.trim()
//         if (!search) return
//         query.or {
//             ilike('title', "%${search}%")
//             location{
//                 ilike('name', "%${search}%")
//             }
//             author{
//                 ilike('username', "%${search}%")
//             }
//         }
//     }
//
//     private void applySorting(def query, Map params) {
//        def sort = params.sort ?: 'id'
//        def order = params.order ?: 'asc'
//        query.order(sort,order)
//    }

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
    def handleNewsCreation(CreateNewsRequest request) {
        def imageFile = request.imageFile

        if (!imageFile || imageFile.empty) {
            throw new IllegalArgumentException("Image file is required.")
        }

        if (!imageFile.contentType?.startsWith("image/")) {
            throw new IllegalArgumentException("Uploaded file must be an image.")
        }

        if (imageFile.size > 5 * 1024 * 1024) {
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


    @Transactional
    List<News> getFilteredNews(Map params) {
        def criteria = News.createCriteria()

        List<News> newsList = (List<News>) criteria.list {
            if (params.contentType) {
                eq 'contentType', ContentType.get(params.contentType as Long)
            }
            if (params.industry) {
                eq 'industry', Industry.get(params.industry as Long)
            }
            if (params.location) {
                eq 'location', Location.get(params.location as Long)
            }

            if (params.dateRange) {
                Date startDate
                switch (params.dateRange) {
                    case 'latest':
                        startDate = Date.from(LocalDate.now().minusDays(7).atStartOfDay(ZoneId.systemDefault()).toInstant())
                        break
                    case 'past1month':
                        startDate = Date.from(LocalDate.now().minusMonths(1).atStartOfDay(ZoneId.systemDefault()).toInstant())
                        break
                    case 'past1year':
                        startDate = Date.from(LocalDate.now().minusYears(1).atStartOfDay(ZoneId.systemDefault()).toInstant())
                        break
                    case 'past2year':
                        startDate = Date.from(LocalDate.now().minusYears(2).atStartOfDay(ZoneId.systemDefault()).toInstant())
                        break
                }

                if (startDate) {
                    ge 'publicationDate', startDate
                }
            }

            order 'publicationDate', 'desc'
        }

        return newsList
    }
}