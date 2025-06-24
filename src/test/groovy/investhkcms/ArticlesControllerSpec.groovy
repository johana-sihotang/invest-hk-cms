package investhkcms

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ArticlesControllerSpec extends Specification implements ControllerUnitTest<ArticlesController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
