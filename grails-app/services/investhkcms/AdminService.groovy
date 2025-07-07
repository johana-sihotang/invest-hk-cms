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
    List<AdminResponse> getAllAdmins() {
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
        try{
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
        } catch (DataIntegrityViolationException e){
            log.error(e.getMessage(), e)
            throw new InvalidDataException('Invalid data provided')
        } catch (AlreadyExistsException e) {
            log.error(e.getMessage(), e)
            throw e
        } catch (InvalidDataException e) {
            log.error(e.getMessage(), e)
            throw e
        } catch (Exception e) {
            log.error(e.getMessage(), e)
            throw new RuntimeException("Registration failed due to server error.")
        }
    }

    @Secured(['ROLE_ADMIN'])
    void deleteAdminByUsername(String username) {
        try {
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
        } catch (DataIntegrityViolationException e) {
            throw new InvalidDataException("Admin cannot be deleted due to existing references")
        } catch (Exception e) {
            throw new RuntimeException("Admin deletion failed due to server error")
        }
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
