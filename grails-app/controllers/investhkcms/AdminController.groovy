package investhkcms
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import models.exception.AlreadyExistsException
import models.exception.InvalidDataException
import models.request.AdminDeleteRequest
import models.request.AdminRegisterRequest
import models.response.AdminAuthResponse
import models.response.AdminResponse
import models.response.RoleResponse

class AdminController {

    AdminService adminService
    SpringSecurityService springSecurityService


    @Secured(['ROLE_ADMIN'])
    def getAllAdmins() {
        List<AdminResponse> adminList = adminService.getAllAdmins()
        def currentAdmin = springSecurityService.currentUser
        [adminList: adminList, currentAdmin: currentAdmin]
    }

    @Secured(['ROLE_ADMIN'])
    def register(AdminRegisterRequest request){
        try {
            adminService.registerAdmin(request)
            flash.message = "Admin registered successfully."
            redirect(action: 'getAllAdmins')
        } catch (AlreadyExistsException e) {
            flash.error = e.message
            redirect(action: 'getAllAdmins')
        } catch (Exception e) {
            flash.error = "An unexpected error occurred. Please try again."
            redirect(action: 'getAllAdmins')
        }
    }

    @Secured(['ROLE_ADMIN'])
    def deleteAdmin(AdminDeleteRequest request){
        try {
            adminService.deleteAdminByUsername(request.username)
            flash.message = "Admin  deleted successfully!"
        } catch (InvalidDataException e) {
            flash.message = e.message
        } catch (Exception e) {
            flash.message = "An unexpected error occurred: " + e.message
        }
        redirect(action: "getAllAdmins")
    }
}

