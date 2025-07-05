package investhkcms

class HomepageConfig {
    String bannerSourceType

    static hasMany = [bannerNews: News]
    static mapping = {
        bannerNews joinTable: [name: 'homepage_banner_news']
    }
}

