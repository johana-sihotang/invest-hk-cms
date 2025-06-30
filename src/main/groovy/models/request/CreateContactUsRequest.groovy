package models.request

import grails.validation.Validateable

class CreateContactUsRequest implements Validateable {
    String lastName
    String firstName
    String email
    String tel
    String city
    String enquiry

    Long locationId

    static constraints = {
        lastName blank: false
        firstName blank: false
        email nullable: false
        tel nullable: false
        locationId nullable: false
        enquiry nullable: false
        city nullable: false
    }
}
