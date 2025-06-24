package investhkcms.cms


class AdminArticlesController {
    static namespace = "cms"
    def index() {
        render(view: '/cms/articles/index')
    }
    def article(){
        render(view: '/cms/articles/article')
    }
}