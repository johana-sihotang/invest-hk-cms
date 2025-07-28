package investhkcms


class HomepageController {

    def index() {
        def newsSlider = News.list( sort: "publicationDate",order: "asc", max: 5)
        render(view: "/index", model: [newsSlider: newsSlider])
    }
}