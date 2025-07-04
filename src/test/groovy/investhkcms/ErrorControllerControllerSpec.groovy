package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ErrorControllerControllerSpec extends Specification implements ControllerUnitTest<ErrorControllerController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
