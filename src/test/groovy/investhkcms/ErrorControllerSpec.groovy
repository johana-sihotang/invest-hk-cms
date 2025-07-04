package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ErrorControllerSpec extends Specification implements ControllerUnitTest<ErrorController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
