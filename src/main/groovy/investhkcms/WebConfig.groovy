package investhkcms

import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
class WebConfig implements WebMvcConfigurer {

    @Override
    void addResourceHandlers(ResourceHandlerRegistry registry) {
        def uploadsPath = new File("uploads").absolutePath.replace("\\", "/")

        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:///${uploadsPath}/")

        println(">>> WebConfig loaded. Upload path: ${uploadsPath}")

    }
}
