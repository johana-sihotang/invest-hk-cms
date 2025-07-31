package models.response

class AdminResponse {
    String email
    String name
    String username
    String status

    AdminResponse(LinkedHashMap<String, Object> data){
        name = data.name
        username = data.username
        email = data.email
        status = data.status
    }
}
