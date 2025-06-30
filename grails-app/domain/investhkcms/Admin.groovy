package investhkcms

import ch.qos.logback.core.status.Status

class Admin {
    String username
    String password
    static hasMany = [roles: Role]



    static constraints = {
        username blank: false, unique: true
        password blank: false
    }
}