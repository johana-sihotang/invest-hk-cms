package investhkcms

class SliderContent {
    String caption
    String imageUrl

    static belongsTo = [homepageSlider: HomepageSlider]
}
