package investhkcms

import grails.gorm.transactions.Transactional
import models.request.HomepageConfigRequest
import org.springframework.web.multipart.MultipartFile

@Transactional
class AdminHomepageService {

    def saveHomepageConfig(HomepageConfigRequest req) {
        def config = HomepageConfig.first() ?: new HomepageConfig()
        config.bannerSourceType = req.sliderSource

        // Banner
        if (req.bannerSourceType == "news") {
            config.bannerNews = News.findAllByIdInList(req.selectedNewsIds)
        }


        // Start Section
        StartSectionItem.deleteAll(StartSectionItem.list())
        req.startImages.eachWithIndex { MultipartFile img, int i ->
            if (img && !img.empty) {
                def filename = UUID.randomUUID().toString() + "_" + img.originalFilename
                def path = new File("${System.getProperty('user.dir')}/uploads/dashboard/start")
                path.mkdirs()
                def file = new File(path, filename)
                img.transferTo(file)

                new StartSectionItem(
                        imageUrl: "/uploads/dashboard/start/${filename}",
                        caption: req.startCaptions[i],
                        position: i
                ).save(flush: true)
            }
        }

        // Slider
        HomepageSlider.deleteAll(HomepageSlider.list()) // clean up
        req.sliders?.eachWithIndex { slider, idx ->
            def newSlider = new HomepageSlider(type: slider.type)

            if (slider.type == "image") {
                slider.sliderImages?.each { MultipartFile image ->
                    if (image && !image.empty) {
                        def filename = UUID.randomUUID().toString() + "_" + image.originalFilename
                        def path = new File("${System.getProperty('user.dir')}/uploads/dashboard/slider")
                        path.mkdirs()
                        def file = new File(path, filename)
                        image.transferTo(file)

                        newSlider.addToContents(new SliderContent(
                                caption: "", // no caption for image slider
                                imageUrl: "/uploads/dashboard/slider/${filename}"
                        ))
                    }
                }
            } else if (slider.type == "slider") {
                newSlider.name = slider.sliderName
                slider.sliderContents.eachWithIndex { String caption, int i ->
                    def image = slider.sliderItemImages[i]
                    def filename = UUID.randomUUID().toString() + "_" + image.originalFilename
                    def path = new File("${System.getProperty('user.dir')}/uploads/dashboard/slider")
                    path.mkdirs()
                    def file = new File(path, filename)
                    image.transferTo(file)

                    newSlider.addToContents(new SliderContent(
                            caption: caption,
                            imageUrl: "/uploads/dashboard/slider/${filename}"
                    ))
                }
            }

            newSlider.save(flush: true)
        }



        config.save(flush: true)
    }
}
