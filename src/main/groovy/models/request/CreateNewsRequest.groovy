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
        title nullable: false
        imageCaption nullable: true
        subTitle nullable: true
        locationId nullable: true
        contentTypeId nullable: true
        industryId nullable: true
        content nullable: false
    }
}

