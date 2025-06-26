package investhkcms

import grails.gorm.transactions.Transactional
import groovy.transform.CompileStatic

@Transactional
class ContentTypeService {

    List<ContentType> getAllContentType() {
        return ContentType.list(sort: "id", order: "asc")
    }

    ContentType getContentTypeById(Long id){
        return ContentType.get(id)
    }
}