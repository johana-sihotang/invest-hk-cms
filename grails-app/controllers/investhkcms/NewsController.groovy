package investhkcms

class NewsController {
    static layout = "main"

    NewsService newsService

    def index() {
        List<News> news = newsService.getAllNews()
        render view: "/news/index", model: [news: news]
    }

    def show(Long id) {
        try {
            News news = newsService.getNewsById(id)
            if (!news) {
                flash.error = "News not found"
                redirect(action: 'index')
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
