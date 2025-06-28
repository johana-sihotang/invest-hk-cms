package models.request

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class UpdateNewsRequest implements Validateable {
    Long id
    String title
    String imageCaption
    String subTitle
    String content

    Long locationId
    Long contentTypeId
    Long industryId

    MultipartFile imageFile

    static constraints = {
        id nullable: false
        title blank: false
        content blank: false
        imageCaption nullable: true
        subTitle nullable: true
        locationId nullable: false
        contentTypeId nullable: false
        industryId nullable: false
        imageFile nullable: true
    }
}
