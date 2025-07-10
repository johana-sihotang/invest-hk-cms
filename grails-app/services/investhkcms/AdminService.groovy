package investhkcms

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import models.exception.AlreadyExistsException
import models.exception.InvalidDataException
import models.request.AdminRegisterRequest
import models.response.AdminAuthResponse
import models.response.AdminResponse
import org.springframework.dao.DataIntegrityViolationException

import javax.persistence.EntityNotFoundException
import models.enums.Status

@Transactional
class AdminService {

    @Secured(['ROLE_ADMIN'])
    List<AdminResponse> getAllAdmins(Map params) {
        List<Admin> adminList = Admin.list()
        def adminResponse = []

        adminList.each { adminInfo ->
            def adminData = [
                    name : adminInfo.name,
                    username: adminInfo.username,
                    email: adminInfo.email,
                    status: adminInfo.status
            ] as LinkedHashMap

            adminResponse << new AdminResponse(adminData)
        }
        return adminResponse
    }

    private void applySearch(def query, Map params) {
        def search = params.search?.trims()
        if(!search) return
        query.or{
            ilike("title", "%${search}%")
            ilike("username", "%${search}")
            ilike("email", "%${search}%")
        }
    }

    private void applySort(def query, Map params){
        def sort = params.sort ?: "id"
        def order =  params.order ?: "asc"
        query.order(sort, order)
    }

    @Secured(['ROLE_ADMIN'])
    List<AdminAuthResponse> getAllAdminAuth() {
        List<AdminRole> adminAuthList = AdminRole.list()
        def AdminAuthResponse = []

        adminAuthList.each { adminInfo ->
            def admin = adminInfo.admin
            def role = adminInfo.role

            def adminData = [
                    name: admin.name,
                    username: admin.username,
                    password: admin.password,
                    status: admin.status,
                    role: role.authority
            ] as LinkedHashMap

            AdminAuthResponse << new AdminAuthResponse(adminData)
        }
        return  AdminAuthResponse
    }


    @Secured(['ROLE_ADMIN'])
    @Transactional
    def registerAdmin(AdminRegisterRequest request){
            log.debug("Registering admin with status: '${request.status}'")
            Status adminStatus = Status.fromValue(request.status as String)
            if (adminStatus == null) {
                throw new InvalidDataException("Invalid status value provided")
            }

            if (Admin.findByUsername(request.username)){
                throw new AlreadyExistsException("Username is already taken.")
            }

            Admin admin = new Admin(
                    name: request.name,
                    email: request.email,
                    username: request.username,
                    password: request.password,
                    status: adminStatus
            )

            if(!admin.save(flus:true)) {
                throw new InvalidDataException("Failed to save user: ${admin.errors}")
            }
    }

    @Secured(['ROLE_ADMIN'])
    void deleteAdminByUsername(String username) {
            Admin admin

            if (username != null && !username.isEmpty()) {
                admin = Admin.findByUsername(username)
                if (admin == null) {
                    throw new EntityNotFoundException("Admin  not found with username: " + username)
                }
            } else {
                throw new IllegalArgumentException("username must be provided")
            }

            deleteAdminRoles(admin)

            admin.delete(flush: true)

    }
    private void deleteAdminRoles(Admin admin) {
        def adminRoles = AdminRole.findAllByAdmin(admin)
        if (adminRoles) {
            adminRoles.each { adminRole ->
                adminRole.delete(flush: true)
            }
        }
    }

}
