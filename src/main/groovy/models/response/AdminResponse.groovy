package models.response

class AdminResponse {
    String email
    String name
    String username
    String status

    AdminResponse(LinkedHashMap<String, Object> data){
        this.name = data.name as String
        this.username = data.username as String
        this.email = data.email as String
        this.status = data.status as String
    }
}
