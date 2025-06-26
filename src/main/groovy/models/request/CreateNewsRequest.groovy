package models.request

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class CreateNewsRequest implements Validateable {
    String title
    String imageCaption
    String subTitle
    String content
    String visitedLink

    Long locationId
    Long contentTypeId
    Long industryId

    MultipartFile imageFile

    static constraints = {
        title blank: false
        content blank: false
        imageCaption nullable: true
        subTitle nullable: true
        visitedLink nullable: true
        locationId nullable: false
        contentTypeId nullable: false
        industryId nullable: false
    }
}
