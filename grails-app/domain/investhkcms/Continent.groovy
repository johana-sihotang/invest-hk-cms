package investhkcms

class Continent {
    String name
    static hasMany = [location: Location]
    static constraints = {
        name blank: false
    }

    String toString() {
        return name
    }
}