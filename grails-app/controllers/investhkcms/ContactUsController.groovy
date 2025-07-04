package investhkcms

import grails.converters.JSON
import models.request.CreateContactUsRequest


class ContactUsController {
    static layout = 'cms-layout'
    ContactUsService contactUsService

    def index() {
        def continents = Continent.list(sort: 'name', order: 'asc')
        def locations = Location.list(sort: 'name', order: 'asc')
        render view: 'contact_us', layout: 'main', model: [
                contactUs: new ContactUs(),
                continent: continents,
                locations: locations
        ]

    }

    def save(CreateContactUsRequest request){
        def redirectUrl = params.redirectUrl

        if (!request.validate()) {
            def continent = Continent.list(sort: 'name', order: 'asc')
            def locations = Location.list(sort: 'name', order: "asc")
            respond request.errors, view: 'index', model: [
                    contactUs: new ContactUs(),
                    continent: continent,
                    locations: locations
            ]
            return
        }

        try {
            contactUsService.createContactUs(request)
            flash.success = "Message sent successfully!"
        } catch (Exception e){
            flash.error = e.message
        }

        if (redirectUrl) {
            redirect(uri: redirectUrl)
        } else {
            redirect(action: 'index')
        }
    }

    def locationsByContinent(Long continentId) {
        def locations = contactUsService.getLocationsByContinent(continentId)
        if (locations.isEmpty()) {
            render status: 404
            return
        }
        render locations as JSON
    }
}