package models.request

import org.springframework.web.multipart.MultipartFile

class HomepageRequest {
    List<BannerSectionRequest> banner = []
    List<StartSectionRequest> start = []
    List<PanelSectionImageRequest> panelImage = []
    List<PanelSectionTextSliderRequest> panelTextSlider = []
}

class BannerSectionRequest {
    Long newsId
    Integer orderIndex
}

class StartSectionRequest {
    String imageUrl
    String caption
    Integer orderIndex
    MultipartFile imageFile
}

class PanelSectionImageRequest {
    String imageUrl
    Integer orderIndex
}

class PanelSectionTextSliderRequest{
    String text
    Integer orderIndex
}
