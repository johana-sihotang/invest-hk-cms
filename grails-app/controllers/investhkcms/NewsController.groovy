package investhkcms

class NewsController {
    static layout = "main"

    NewsService newsService

    def index(){
        def news = newsService.getAllNews(params)
        def location = Location.list(sort: "name", order: "asc")
        def contentType = ContentType.list(sort: "name", order: "asc")
        def industry = Industry.list(sort: "name", order: "asc")
        [news: news, search: params.search, locations: location, industries: industry, contentTypes: contentType]
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
