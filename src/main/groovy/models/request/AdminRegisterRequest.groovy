package models.request

import grails.validation.Validateable

class AdminRegisterRequest implements Validateable{
    String name
    String email
    String username
    String password
    String status

    static constrains = {
        name blank: false
        email blank: false
        username blank: false, unique: true
        password blank: false, minSize: 6
        status nullable: false
    }
}
