package investhkcms

import grails.gorm.transactions.Transactional
import models.request.BannerSectionRequest
import models.request.CreateNewsRequest
import models.request.HomepageRequest
import models.request.PanelSectionImageRequest
import models.request.PanelSectionTextSliderRequest
import models.request.StartSectionRequest
import models.request.UpdateNewsRequest
import org.springframework.web.multipart.MultipartFile

@Transactional
class HomepageService {

    Homepage getHomepage(Long id) {
        return Homepage.get(id)
    }

    HomepageRequest getHomepageRequest(Long id){
        def Homepage = getHomepage(id)
        if (!Homepage) return null

        def request =  new HomepageRequest()

        request.banner = Homepage.section1Items.collect {
            new BannerSectionRequest(newsId: it.news.id, orderIndex: it.orderIndex)
        }

        request.start = Homepage.section2Images.collect {
            new StartSectionRequest(imageUrl: it.imageUrl, caption: it.caption, orderIndex: it.orderIndex)
        }

        request.panelImage = Homepage.section3Images.collect{
            new PanelSectionImageRequest(imageUrl: it.imageUrl, orderIndex: it.orderIndex)
        }

        request.panelTextSlider = Homepage.section3Texts.collect{
            new PanelSectionTextSliderRequest(text: it.text, orderIndex: it.orderIndex)
        }

        return request
    }

    void saveHomepage(Long homepageId, HomepageRequest request) {
        def homepage = Homepage.get(homepageId)
        if(!homepage) {
            homepage = new Homepage(id: homepageId, name: "Default Homepage")
            homepage.save(failOnError: true)

        }

        homepage.section1Items*.delete()
        homepage.section2Images*.delete()
        homepage.section3Images*.delete()
        homepage.section3Texts*.delete()

        request.banner?.each {
            homepage.addToSection1Items(new BannerSection(
                    news: News.get(it.newsId),
                    orderIndex: it.orderIndex
            ))
        }
        request.start?.each {
            homepage.addToSection2Images(new StartSection(
                    caption: it.caption,
                    imageUrl: it.imageUrl,
                    orderIndex: it.orderIndex
            ))
        }
        request.panelImage?.each {
            homepage.addToSection3Images(new PanelSectionImage(
                    imageUrl: it.imageUrl,
                    orderIndex: it.orderIndex
            ))
        }
        request.panelTextSlider?.each {
            homepage.addToSection3Texts(new PanelSectionTextSlider(
                    text: it.text,
                    orderIndex: it.orderIndex
            ))
        }
        homepage.save(flush: true, failOnError: true)
    }

    @Transactional
     String handleImageUpload(MultipartFile imageFile){
        if (!imageFile || imageFile.empty) {
            throw new IllegalAccessException("Image file is required")
        }
        if(!imageFile.contentType?.startsWith("image/")){
            throw new IllegalArgumentException("Uploaded file must be an image")
        }
        final long MAX_IMAGE_SIZE = 5 * 1024 * 1024
        if (imageFile.size > MAX_IMAGE_SIZE) {
            throw new IllegalArgumentException("Image file is too large (Max 5MB)")
        }
        def fileName = UUID.randomUUID().toString() + "_" + imageFile.originalFilename
        def uploadDir = new File("${System.getProperty('user.dir')}/uploads/homepage/start")
        if (!uploadDir.exists()) uploadDir.mkdir()

        def destination = new File(uploadDir, fileName)
        imageFile.transferTo(destination)

        return "/uploads/homepage/start/${fileName}"
    }
}
