package backend

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ArticleControllerSpec extends Specification implements ControllerUnitTest<ArticleController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
