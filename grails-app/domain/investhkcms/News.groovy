package investhkcms

class News {
    String title
    String image
    String imageCaption
    String subTitle
    String content
    Date publicationDate

    Location location
    ContentType contentType
    Industry industry

    static constraints = {
        title nullable: false
        image nullable: true
        imageCaption nullable: true, maxSize: 2000
        subTitle nullable: true
        location nullable: true
        contentType nullable: true
        industry nullable: true
    }

    static mapping = {
        table 'news'
    }

    String toString(){
        return title
    }
}
