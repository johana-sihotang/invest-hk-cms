package investhkcms

class StartSection {
    String imageUrl
    String caption
    Integer orderIndex
    Homepage layout

    static belongsTo = [layout: Homepage]

    static constraints = {
        imageUrl blank: false
        caption nullable: true
        orderIndex nullable: true
    }
}
