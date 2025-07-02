package investhkcms

import models.enums.Status

class BootStrap {

    def init = { servletContext ->

        def continentMapping = [
                'Africa': [
                        "Angola", "Republic of Côte d'Ivoire", "Gabon", "South Africa", "Mauritania",
                        "Republic of South Sudan", "Central African Republic", "Mauritius", "Tanzania",
                        "Uganda", "Comoros", "Rwanda", "Liberia", "Benin", "Congo, Democratic of Republic",
                        "Cameroon", "Guinea-Bissau", "Zimbabwe", "Tunisia", "Somalia", "Senegal",
                        "Equatorial Guinea", "Sierra Leone", "Guinea", "Burundi", "Ethiopia", "Chad",
                        "Niger", "Mali", "Congo", "Djibouti", "Sao Tome and Principe", "Nigeria", "Ghana",
                        "Kenya", "Madagascar", "Eritrea", "Namibia", "Gambia", "Egypt", "Morocco",
                        "Togo", "Algeria", "Seychelles", "Burkina Faso", "Zambia", "Libya", "Sudan",
                        "Botswana", "Mozambique"
                ],
                'Asia Pacific': [
                        "Malaysia", "Kyrgyzstan", "Maldives", "Kazakhstan", "Phillippines", "New Zealand",
                        "India", "Israel", "Australia", "Armenia", "Korea", "Turkmenistan", "Uzbekistan",
                        "Macao, China", "Vietnam", "Japan", "Laos", "Indonesia", "Singapore", "Hong Kong, China (1)",
                        "Mainland China", "Thailand", "Myanmar", "Tajikistan", "Brunei", "Sri lanka",
                        "Mongolia", "Bangladesh", "Cambodia"
                ],
                'Europe': [
                        "Azerbaijan", "Finland", "Norway", "Russia", "Hungary", "Luxembourg", "Czech Republic",
                        "Estonia", "Portugal", "Republic of North Macedonia", "Romania", "Greece", "Latvia",
                        "Belgium", "Moldova", "Spain", "United Kingdom", "Sweden", "France", "Italia",
                        "Bulgaria", "Austria", "Georgia", "Malta", "Turkey", "Slovenia", "Switzerland",
                        "Lithuania", "Germany", "Slovakia", "Croatia (Hrvatska)", "Cryprus", "Iceland",
                        "Gibraltar", "Poland", "Netherlands", "Ireland", "Belarus"
                ],
                'Middle East': [
                        "Jordan", "Oman", "Iran", "Kuwait", "Lebanon", "Qatar", "Bahrain", "Iraq",
                        "United Arab Emirates", "Saudi Arabia"
                ],
                'North & South America': [
                        "Anguilla", "United States", "French Guiana", "British Virgin Island", "Bermuda",
                        "Bouvet Island", "Costa Rica", "Venezuela", "Montserrat", "Guatemala", "Mexico",
                        "Cayman Islands", "Ecuador", "Brazil", "Republic of Guatemala", "Turks and Caicos Islands",
                        "Paraguay", "Canada", "Chile", "Falkand Islands", "Uruguay", "Nicaragua", "Peru",
                        "Argentina", "Suriname", "El Savador", "Panama", "Guyana", "Honduras", "Colombia",
                        "Belize", "South Georgia and the South Sandwich Islands"
                ]
        ]

        Continent.withTransaction {
            ["Africa", "Asia Pacific", "Europe", "Middle East", "North & South America"].each { name ->
                def continent = Continent.findByName(name)
                if (continent) {
                    if (continent.name != name) {
                        continent.name = name
                        continent.save(flush: true, failOnError: true)
                        println("Updated existing continent: ${name}")
                    }
                } else {
                    new Continent(name: name).save(flush: true, failOnError: true)
                    println("Inserted new continent: ${name}")
                }
            }

            if (Location.count() == 0) {
                continentMapping.each { continentName, countries ->
                    def continent = Continent.findByName(continentName)
                    if (continent) {
                        countries.each { countryName ->
                            new Location(name: countryName, continent: continent).save(flush: true, failOnError: true)
                            println("Inserted location: ${countryName} in continent: ${continentName}")
                        }
                    }
                }
                println("Inserted default locations with continent mapping")
            } else {
                println("Locations already exist, skipping insert")
            }
        }

        Location.withTransaction {
            continentMapping.each { continentName, countries ->
                def continent = Continent.findByName(continentName)
                if (continent) {
                    countries.each { countryName ->
                        def location = Location.findByName(countryName)
                        if (location) {
                            location.continent = continent
                            location.save(flush: true, failOnError: true)
                        }
                    }
                }
            }
            println("Updated locations with continent")
        }

        ContentType.withTransaction {
            if (ContentType.count() == 0) {
                ["News", "Press Release", "Industry Insight"].each { name ->
                    new ContentType(name: name).save(flush: true, failOnError: true)
                }
                println("Inserted default content types")
            } else {
                println("ContentType already exist, skipping insert")
            }
        }

        Industry.withTransaction {
            if (Industry.count() == 0) {
                [
                        "Business & Professional Services", "Consumer Products", "Financial Services",
                        "Fintech", "Information & Communication Technology", "InvestHK news",
                        "Tourism & Hospitality", "Transport, Logistics & Industrials"
                ].each { name ->
                    new Industry(name: name).save(flush: true, failOnError: true)
                }
                println("Inserted default industries")
            } else {
                println("Industry already exist, skipping insert")
            }
        }

        Admin.withTransaction { status ->
            def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true)

            def adminUser = Admin.findByUsername('admin') ?: new Admin(
                    name: 'SuperAdmin',
                    email: 'admin@example.com',
                    username: 'admin',
                    password: 'admin123',
                    status: Status.ACTIVE
            ).save(flush: true, failOnError: true)

            if (!AdminRole.exists(adminUser.id, adminRole.id)) {
                AdminRole.create(adminUser, adminRole, true)
            }
        }

    }



    def destroy = {}
}
