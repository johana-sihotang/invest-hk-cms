package investhkcms

class NewsController {
    static layout = "main"

    NewsService newsService

    def index() {
        Map paramsMap = [
                contentType: params.contentType,
                industry: params.industry,
                location: params.location,
                dateRange: params.dateRange
        ].findAll {it.value}

        List<News> filteredNews
        if (paramsMap){
            filteredNews = newsService.getFilteredNews(paramsMap)
        } else {
            filteredNews = News.list(sort: "publicationDate", order: 'desc')
        }
        List<ContentType> contentTypes = ContentType.list(sort: "name", order: "asc")
        List<Industry> industries = Industry.list(sort: "name", order: "asc")
        List<Location> locations = Location.list(sort: "name", order: "asc")

        respond filteredNews, model: [
                newsList: filteredNews,
                contentTypes: contentTypes,
                industries: industries,
                locations: locations
        ]
    }

    def show(Long id) {
        try {
            News news = newsService.getNewsById(id)
            if (!news) {
                redirect(controller: 'error', action: 'notFound')
                return
            }

            render view: "/news/show", model: [news: news]

        } catch (Exception e) {
            log.error("Error fetching news with ID ${id}: ${e.message}", e)
            flash.error = "An error occurred while trying to display the news."
            redirect(action: 'index')
        }
    }

}
