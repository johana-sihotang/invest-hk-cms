package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ContactUsSpec extends Specification implements DomainUnitTest<ContactUs> {

     void "test domain constraints"() {
        when:
        ContactUs domain = new ContactUs()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
