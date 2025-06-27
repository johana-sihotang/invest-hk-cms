package investhkcms

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ContinentSpec extends Specification implements DomainUnitTest<Continent> {

     void "test domain constraints"() {
        when:
        Continent domain = new Continent()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
