package investhkcms

class Homepage {
    String name

    static hasMany = [
            section1Items: BannerSection,
            section2Images: StartSection,
            section3Images: PanelSectionImage,
            section3Texts: PanelSectionTextSlider
    ]

    static constraints = {
        name blank: false
    }
}
