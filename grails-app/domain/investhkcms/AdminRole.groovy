package investhkcms

import grails.compiler.GrailsCompileStatic
import groovy.transform.ToString

@GrailsCompileStatic
@ToString(cache =true, includeNames = true, includePackage = false)
class AdminRole implements Serializable{
    Admin admin
    Role role

    static  mapping = {
        id composite: ['admin',  'role']
        version false
    }
    static constraints = {
        admin nullable: false
        role nullable: false
    }

    boolean  equals(other) {
        if (!(other instanceof  AdminRole)) {
            return  false
        }
        other.adminId == admin?.id && other.roleId == role?.id
    }
}