package investhkcms

class Industry {
    String name

    static constraints = {
        name blank: false
    }

    String toString() {
        return name
    }
}