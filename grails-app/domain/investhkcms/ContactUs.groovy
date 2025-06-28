package investhkcms

class ContactUs {
    String lastName
    String firstName
    String email
    String tel
    String city
    String enquiry
    Date dateCreated

    Location location

    static constraints = {
        lastName nullable: true
        firstName nullable: false
        email nullable: true
        tel nullable: true
        location nullable: true
        city nullable: true
        enquiry nullable: true
    }

    static mapping = {
        table 'contact_us'
    }

    String toString(){
        return firstName
    }
}