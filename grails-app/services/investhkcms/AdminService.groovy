package investhkcms

import grails.gorm.transactions.Transactional

@Transactional
class AdminService {
    def getAllAdmins() {
        List<Admin> adminlist = Admin.list()
        def adminServiceResponse = []

        adminlist.each { adminInfo ->
            def adminData = [
                    adminName : adminInfo.adminName
            ] as LinkedHashMap
        }
    }

}
