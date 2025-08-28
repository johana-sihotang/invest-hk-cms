package investhkcms

import models.request.CreateContactUsRequest
import grails.gorm.transactions.Transactional

@Transactional
class ContactUsService {

    @Transactional(readOnly = true)
    List<ContactUs> getAllContactUs(Map params){
       return ContactUs.createCriteria().list {
           applySearch(delegate, params)
           applySort(delegate, params)
       }
    }

    @Transactional(readOnly = true)
    ContactUs getContactUsById(Long id){
        return ContactUs.get(id)
    }

    private void applySearch(def query, Map params){
        def search = params.search?.trim()
        if(!search) return
        query.or{
            ilike("firstName","%${search}%")
            ilike("email","%${search}%")
            ilike("tel","%${search}%")
        }
    }

    private void applySort(def query, Map params){
        def sort =  params.sort ?: 'id'
        def order = params.order ?: "asc"
        query.order(sort, order)
    }

    List<Location> getLocationsByContinent(Long continentId) {
        return Location.createCriteria().list {
            eq('continent.id', continentId)
            order('name', 'asc')
        }
    }

    @Transactional
    ContactUs createContactUs(CreateContactUsRequest request) {
        ContactUs contactUs = new ContactUs()
        contactUs.lastName = request.lastName
        contactUs.firstName = request.firstName
        contactUs.email = request.email
        contactUs.tel = request.tel
        contactUs.city = request.city
        contactUs.enquiry = request.enquiry
        contactUs.location = Location.get(request.locationId)
        contactUs.dateCreated = new Date()

        if (!contactUs.save(flush: true)) {
            throw new RuntimeException("Failed to save data")
        }
        return contactUs
    }

    @Transactional
    void deleteContactUs(Long id){
        ContactUs contactUs = ContactUs.get(id)
        if(!contactUs){
            throw new RuntimeException("Contact Us not found with id: ${id}")
        }
        contactUs.delete(flush: true)
    }
}