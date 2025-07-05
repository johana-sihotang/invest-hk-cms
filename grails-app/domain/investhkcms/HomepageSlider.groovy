package investhkcms

class HomepageSlider {
    String type
    String name

    static hasMany = [contents: SliderContent]
}
