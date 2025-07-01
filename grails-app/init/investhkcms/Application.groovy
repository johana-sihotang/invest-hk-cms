package investhkcms

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import io.micronaut.context.annotation.Bean
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory
import org.springframework.boot.web.server.WebServerFactoryCustomizer
import org.springframework.context.annotation.ComponentScan

@ComponentScan("investhkcms")
class Application extends GrailsAutoConfiguration {

    static void main(String[] args) {
        println ">>> Starting Application"
        GrailsApp.run(Application, args)
    }
    @Bean
    WebServerFactoryCustomizer<TomcatServletWebServerFactory> containerCustomizer() {
        return { factory ->
            factory.addConnectorCustomizers { connector ->
                connector.setMaxPostSize(104857600) // 100MB
                connector.setMaxSwallowSize(104857600) // 100MB
                println "DEBUG Tomcat maxPostSize set to: ${connector.maxPostSize}"
                println "DEBUG Tomcat maxSwallowSize set to: ${connector.maxSwallowSize}"
            }
        }
    }

}
