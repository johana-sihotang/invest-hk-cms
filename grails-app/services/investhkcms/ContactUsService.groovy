package investhkcms

import models.request.CreateContactUsRequest

import javax.transaction.Transactional

@Transactional
class ContactUsService {

    List<ContactUs> getAllContactUs(){
       return ContactUs.list(short: 'title')
    }
    ContactUs getContactUsById(Long id){
        return ContactUs.get(id)
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

        if (!contactUs.save(flus: true)) {
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