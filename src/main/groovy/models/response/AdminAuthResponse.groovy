package models.response

class AdminAuthResponse {
    String name
    String username
    String password
    String status
    String role

    AdminAuthResponse(LinkedHashMap<String, Object> data){
        this.name = data.name as String
        this.username = data.username as String
        this.password = data.password as String
        this.status = data.status as String
        this.role = data.role as String
    }
}
