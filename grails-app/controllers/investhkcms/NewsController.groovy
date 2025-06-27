package investhkcms

class NewsController {
    static layout = "main"

    NewsService newsService

    def index() {
        List<News> news = newsService.getAllNews()
        render view: "/news/index", model: [news: news]
    }

    def show(Long id) {
        News news = newsService.getNewsById(id)
        if (!news) {
            flash.error = "News not found"
            redirect(action: 'index')
            return
        }
        render view: "/news/show", model: [news: news]
    }
}
