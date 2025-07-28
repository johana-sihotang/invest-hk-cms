package investhkcms

class PanelSectionTextSlider {
    String text
    Integer orderIndex
    Homepage layout

    static belongsTo = [layout: Homepage]

    static constraints = {
        text blank: false
        orderIndex nullable: true
    }
}
