package investhkcms

class Location {
    String name

    static constraints = {
        name blank: false
    }

    String toString() {
        return name
    }
}
