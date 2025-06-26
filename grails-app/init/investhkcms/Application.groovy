package investhkcms

import org.springframework.context.annotation.ComponentScan
import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration

@ComponentScan("investhkcms")
class Application extends GrailsAutoConfiguration {
    static void main(String[] args) {
        println ">>> Starting Application"
        GrailsApp.run(Application, args)
    }
}
