package investhkcms

class PanelSectionImage {
    String imageUrl
    Integer orderIndex
    Homepage layout

    static belongsTo = [layout: Homepage]

    static constraints = {
        imageUrl blank: false
        orderIndex nullable: true
    }
}
