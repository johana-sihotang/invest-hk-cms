package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class HomepageConfigSpec extends Specification implements DomainUnitTest<HomepageConfig> {

     void "test domain constraints"() {
        when:
        HomepageConfig domain = new HomepageConfig()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
