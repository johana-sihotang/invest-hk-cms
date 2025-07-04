package models.request

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class CreateNewsRequest implements Validateable {
    String title
    String imageCaption
    String subTitle
    String content

    Long locationId
    Long contentTypeId
    Long industryId

    MultipartFile imageFile

    static constraints = {
        title blank: false
        content blank: false
        imageCaption nullable: false
        subTitle nullable: false
        locationId nullable: false
        contentTypeId nullable: true
        industryId nullable: false
    }
}
