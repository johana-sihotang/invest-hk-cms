package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ContactUsControllerSpec extends Specification implements ControllerUnitTest<ContactUsController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
