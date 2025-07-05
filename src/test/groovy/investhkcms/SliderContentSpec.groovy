package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class SliderContentSpec extends Specification implements DomainUnitTest<SliderContent> {

     void "test domain constraints"() {
        when:
        SliderContent domain = new SliderContent()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
