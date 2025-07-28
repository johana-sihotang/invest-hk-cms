package investhkcms

import models.request.BannerSectionRequest
import models.request.HomepageRequest
import models.request.PanelSectionImageRequest
import models.request.PanelSectionTextSliderRequest
import models.request.StartSectionRequest

class AdminHomepageController {

    HomepageService homepageService

    def index(Long id){
        def dashboard = homepageService.getHomepageRequest(id)
        def news = News.list(sort: "title", order: "asc")
        if(!request){
            return
        }
        [dashoard: dashboard, news: news]
    }

    def update(Long id) {
        def json = request.JSON
        def homepageRequest = new HomepageRequest(
                banner: json.banner.collect { new BannerSectionRequest()},
                start: json.start.collect { new StartSectionRequest()},
                panelImage: json.panelImage.collect {new PanelSectionImageRequest()},
                panelTextSlider: json.panelTextSlider.collect { new PanelSectionTextSliderRequest()}
        )

        homepageRequest.start.each { section ->
            if (section.imageFile) {
                section.imageUrl = homepageService.handleImageUpload(section.imageFile)
            }
        }

        try {
            homepageService.saveHomepage(id, homepageRequest)
            flash.success = "Dashboard updated"
            redirect(action: 'index')
        } catch (Exception e) {
            flash.error = e.message
            redirect(action: 'index')
        }
    }
}
