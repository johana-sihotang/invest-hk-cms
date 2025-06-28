package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class AdminContactUsControllerSpec extends Specification implements ControllerUnitTest<AdminContactUsController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
