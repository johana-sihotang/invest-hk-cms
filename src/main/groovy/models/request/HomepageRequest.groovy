package models.request

class HomepageRequest {
    List<BannerSectionRequest> bannerSectionRequests = []
    List<StartSectionRequest> startSectionRequestsst = []
    List<PanelSectionImageRequest> panelSectionImageRequests = []
    List<PanelSectionTextSliderRequest> panelSectionTextSliderRequests = []
}

class BannerSectionRequest {
    Long newsId
    Integer orderIndex
}

class StartSectionRequest {
    String imageUrl
    String caption
    Integer orderIndex
}

class PanelSectionImageRequest {
    String imageUrl
    Integer orderIndex
}

class PanelSectionTextSliderRequest{
    String text
    Integer orderIndex
}
