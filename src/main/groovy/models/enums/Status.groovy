package models.enums

enum Status {
    ACTIVE("active"),
    INACTIVE("inactive")

    String value

    Status(String value) {
        this.value = value
    }

    static Status fromValue(String value) {
        values().find { it.value.equalsIgnoreCase(value) }
    }
}
