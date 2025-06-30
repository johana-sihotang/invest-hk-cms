package investhkcms

import ch.qos.logback.core.status.Status

class Admin {
    String username
    String password
    String role = "ADMIN"



    static constraints = {
        username blank: false, unique: true
        password blank: false
        role inList: ["ADMIN"]
    }
}