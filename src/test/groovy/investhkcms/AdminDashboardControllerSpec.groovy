package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class AdminDashboardControllerSpec extends Specification implements ControllerUnitTest<AdminDashboardController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
