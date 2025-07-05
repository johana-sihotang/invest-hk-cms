package models.request

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class HomepageConfigRequest implements Validateable {
    String bannerSourceType
    List<Long> selectedNewsIds

    String customBannerCaption
    String customBannerLink
    Integer customBannerPosition
    MultipartFile customBannerImage

    List<String> startCaptions
    List<MultipartFile> startImages

    List<SliderRequest> sliders  // 👈 Tambahkan ini

    static constraints = {
        bannerSourceType nullable: false
        selectedNewsIds nullable: true
        customBannerCaption nullable: true
        customBannerLink nullable: true
        customBannerPosition nullable: true
        customBannerImage nullable: true
        startCaptions nullable: true
        startImages nullable: true
        sliders nullable: true // allow no sliders
    }
}
