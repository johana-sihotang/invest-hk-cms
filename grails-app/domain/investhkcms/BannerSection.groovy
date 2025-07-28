package investhkcms

class BannerSection {
    News news
    Integer orderIndex
    Homepage layout

    static belongsTo = [layout: Homepage]

    static constraints = {
        orderIndex nullable: true
    }
}
