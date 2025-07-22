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
                bannerSectionRequests: json.bannerSectionRequests.collect { new BannerSectionRequest(it)},
                startSectionRequestsst: json.startSectionRequestsst.collect { new StartSectionRequest(it)},
                panelSectionImageRequests: json.panelSectionImageRequests.collect {new PanelSectionImageRequest(it)},
                panelSectionTextSliderRequests: json.panelSectionTextSliderRequests.collect { new PanelSectionTextSliderRequest(it)}
        )

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
