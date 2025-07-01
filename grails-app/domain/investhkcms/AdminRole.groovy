package investhkcms

import grails.compiler.GrailsCompileStatic
import grails.gorm.DetachedCriteria
import groovy.transform.ToString
import org.codehaus.groovy.util.HashCodeHelper

@GrailsCompileStatic
@ToString(cache =true, includeNames = true, includePackage = false)
class AdminRole implements Serializable{

    private static final long serialVersionUID = 1

    Admin admin
    Role role

    @Override
    boolean equals(other) {
        if (other instanceof AdminRole) {
            other.adminId == admin?.id && other.roleId == role?.id
        }
    }

    @Override
    int hashCode(){
        int hashCode = HashCodeHelper.initHash()
        if (admin) {
            hashCode = HashCodeHelper.updateHash(hashCode, admin.id)
        }
        if (role) {
            hashCode = HashCodeHelper.updateHash(hashCode, role.id)
        }
        hashCode
    }

    static AdminRole get(long adminId, long roleId) {
        criteriaFor(adminId, roleId).get()
    }

    static boolean  exists(long adminId, long roleId){
        criteriaFor(adminId, roleId).count()
    }

    private static DetachedCriteria<AdminRole> criteriaFor(long adminId, long roleId){
        AdminRole.where {
            admin == Admin.load(adminId) &&
                    role == Role.load(roleId)
        }
    }

    static  AdminRole create(Admin admin, Role role, boolean  flush = false){
        def instance = new  AdminRole(admin: admin, role: role)
        instance.save(flush: flush)
        instance
    }

    static boolean remove(Admin a, Role r){
        if(a != null && r != null) {
            AdminRole.where { admin == a && role == r }.deleteAll()
        }
    }

    static int removeAll(Admin a){
        a == null ? 0: AdminRole.where {admin == a}.deleteAll() as int
    }

    static int removeAll(Role r){
        r == null ? 0: AdminRole.where {role == r}.deleteAll() as int
    }

    static constraints = {
        admin nullable: false
        role nullable: false, validator: { Role r,AdminRole ar ->
            if (ar.admin?.id) {
                if (AdminRole.exists(ar.admin.id, r.id)) {
                    return ['adminRole.exists']
                }
            }
        }

    }

    static mapping = {
        id composite: ['admin', 'role']
        version false
    }
}