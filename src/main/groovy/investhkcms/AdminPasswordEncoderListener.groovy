package investhkcms

import grails.events.annotation.gorm.Listener
import grails.plugin.springsecurity.SpringSecurityService
import groovy.transform.CompileStatic
import org.grails.datastore.mapping.engine.event.AbstractPersistenceEvent
import org.grails.datastore.mapping.engine.event.PreInsertEvent
import org.grails.datastore.mapping.engine.event.PreUpdateEvent
import org.springframework.beans.factory.annotation.Autowired

@CompileStatic
class AdminPasswordEncoderListener {

    @Autowired
    SpringSecurityService springSecurityService

    @Listener(Admin)
    void onPreInsertEvent(PreInsertEvent event) {
        encodePasswordForEvent(event)
    }

    @Listener(Admin)
    void onPreUpdateEvent(PreUpdateEvent event) {
        encodePasswordForEvent(event)
    }

    private void encodePasswordForEvent(AbstractPersistenceEvent event) {
        if (event.entityObject instanceof Admin) {
            Admin a = event.entityObject as Admin
            if (a.password && ((event instanceof  PreInsertEvent) || (event instanceof PreUpdateEvent && a.isDirty('password')))) {
                event.getEntityAccess().setProperty('password', encodePassword(a.password))
            }
        }
    }

    private String encodePassword(String password) {
        springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}

