package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class DashbordControllerSpec extends Specification implements ControllerUnitTest<DashbordController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
