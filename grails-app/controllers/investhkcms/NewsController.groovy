package investhkcms

class NewsController {
    static layout = "main"

    NewsService newsService

    def index(){ def result = newsService.getAllNews(params)
        def news = result.toList()
        def total = result.totalCount
        def newsSlider = News.list( sort: "publicationDate",order: "asc", max: 5)
        def location = Location.list(sort: "name", order: "asc")
        def contentType = ContentType.list(sort: "name", order: "asc")
        def industry = Industry.list(sort: "name", order: "asc")
        [news: news, newsSlider: newsSlider, locations: location, industries: industry, contentTypes: contentType, total: total, params: params]
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