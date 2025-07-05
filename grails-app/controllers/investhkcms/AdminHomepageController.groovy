package investhkcms

import grails.plugin.springsecurity.annotation.Secured
import models.request.HomepageConfigRequest

class AdminHomepageController {
    static layout = "cms-layout"

    AdminHomepageService adminHomepageService

    @Secured(['ROLE_ADMIN'])
    def index() {
        def config = HomepageConfig.first() ?: new HomepageConfig(bannerSourceType: "news").save()
        def startItems = StartSectionItem.list(sort: "position")
        def sliders = HomepageSlider.list()
        def newsList = News.list(sort: 'title')

        [config: config, startItems: startItems, sliders: sliders, newsList: newsList]
    }

    @Secured(['ROLE_ADMIN'])
    def save(HomepageConfigRequest request) {
        if (!request.validate()) {
            respond request.errors, view: 'index'
            return
        }

        try {
            adminHomepageService.saveHomepageConfig(request)
            flash.success = "Homepage config saved successfully"
            redirect(action: 'save')
        } catch (Exception e) {
            flash.error = "Error saving homepage config: ${e.message}"
            respond request.errors, view: 'index'
        }
    }


}
