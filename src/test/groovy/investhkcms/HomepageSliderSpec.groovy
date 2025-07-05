package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class HomepageSliderSpec extends Specification implements DomainUnitTest<HomepageSlider> {

     void "test domain constraints"() {
        when:
        HomepageSlider domain = new HomepageSlider()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
