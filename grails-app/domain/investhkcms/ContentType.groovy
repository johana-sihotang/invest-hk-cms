package investhkcms

class ContentType {
    String name

    static constraints = {
        name blank: false
    }

    String toString() {
        return name
    }
}