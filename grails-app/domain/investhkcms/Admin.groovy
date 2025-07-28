package investhkcms

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString


@GrailsCompileStatic
@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class Admin implements Serializable {

    private static  final long serialVersionUID = 1

    String name
    String email
    String status

    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [adminRoles: AdminRole]

    Set<Role> getAuthorities() {
        (AdminRole.findAllByAdmin(this) as List<AdminRole>)*.role as Set<Role>
    }

    static constraints = {
        username blank: false, unique: true, nullable: false
        password blank: false, password: true, nullable: false
    }

    static mapping = {
        table name: 'admin'
        password column: '`password`'
    }
}