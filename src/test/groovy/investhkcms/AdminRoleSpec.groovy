package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class AdminRoleSpec extends Specification implements DomainUnitTest<AdminRole> {

     void "test domain constraints"() {
        when:
        AdminRole domain = new AdminRole()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
