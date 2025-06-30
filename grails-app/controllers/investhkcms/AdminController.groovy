package investhkcms

class AdminController {

    AdminService adminService

    def login() {
        {
            render(view: 'login') //
        }
    }

    def authenticate() {
        def username = params.username
        def password = params.password

        def admin = adminService.authenticate(username, password)

        if (admin) {
            session.admin = admin.username
            flash.message = "Welcome, ${admin.username}!"
            redirect(controller: 'dashboard', action: 'index')
        } else {
            flash.message = "Invalid username or password"
            redirect(action: 'login')
        }
    }

    def logout() {
        session.invalidate()
        flash.message = "You have been logged out."
        redirect(action: 'login')
    }
}

