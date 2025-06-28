package investhkcms

class Location {
    String name
    Continent continent
    static constraints = {
        name blank: false
    }

    String toString() {
        return name
        continent nullable: false
    }
}
