package investhkcms.cms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class AdminArticlesControllerSpec extends Specification implements ControllerUnitTest<AdminArticlesController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
