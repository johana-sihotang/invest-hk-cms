package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class AdminSpec extends Specification implements DomainUnitTest<Admin> {

     void "test domain constraints"() {
        when:
        Admin domain = new Admin()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
