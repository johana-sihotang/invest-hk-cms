package models.exception

class InvalidDataException extends  RuntimeException{
    public InvalidDataException(String message) {
        super(message)
    }
}
