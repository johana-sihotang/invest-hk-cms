package models.request

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class SliderRequest implements Validateable {
    String type  // "image" or "slider"

    // Untuk type == "image"
    List<MultipartFile> sliderImages

    // Untuk type == "slider"
    String sliderName
    List<String> sliderContents
    List<MultipartFile> sliderItemImages

    static constraints = {
        type nullable: false
        sliderImages nullable: true
        sliderName nullable: true
        sliderContents nullable: true
        sliderItemImages nullable: true
    }
}

