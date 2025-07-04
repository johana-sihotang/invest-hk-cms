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
    Admin author

    static belongsTo = [author:Admin]

    static constraints = {
        title nullable: false, maxSize: 10000
        image nullable: true
        imageCaption nullable: true, maxSize: 2000
        subTitle nullable: true, maxSize: 10000
        location nullable: true
        contentType nullable: true
        industry nullable: true
        content nullable: false, maxSize: 10000



    }

    static mapping = {
        table 'news'
        title type: 'text'
        subTitle type: 'text'
        content type: 'text'
    }

    String toString(){
        return title
    }
}
