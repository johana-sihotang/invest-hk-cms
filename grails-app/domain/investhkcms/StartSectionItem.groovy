package investhkcms

class StartSectionItem {
    String imageUrl
    String caption
    Integer position

    static constraints = {
        imageUrl blank: false
        caption blank: false
        position nullable: true
    }
}
