package investhkcms

import grails.plugin.springsecurity.annotation.Secured
import models.request.HomepageConfigRequest

class AdminHomepageController {
    static layout = "cms-layout"

    AdminHomepageService adminHomepageService

    @Secured(['ROLE_ADMIN'])
    def index() {

    }

    @Secured(['ROLE_ADMIN'])
    def save(HomepageConfigRequest request) {

    }


}
