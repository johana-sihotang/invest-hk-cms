package investhkcms

import grails.gorm.transactions.Transactional

@Transactional
class LocationService {

   List<Location> getAllLocations() {
       return Location.list(sort: "name", order: 'asc')
   }

    Location getLocationById(Long id){
        return Location.get(id)
    }
}