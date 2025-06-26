package investhkcms

class BootStrap {

    def init = { servletContext ->

        if (Location.count() == 0) {
            Location.withTransaction {
                def locations = [
                        "Malaysia", "Azerbaijan", "Jordan", "Anguilla", "United States",
                        "French Guiana", "Kyrgyzstan", "Finland", "Maldives", "Angola",
                        "Kazakhstan", "Oman", "British Virgin Island", "Bermuda", "Bouvet Island",
                        "Norway", "Phillippines", "Iran", "Republic of Côte d'Ivoire", "Costa Rica",
                        "Venezuela", "Russia", "Montserrat", "Gabon", "Kuwait", "New Zealand",
                        "Hungary", "India", "South Africa", "Guatemala", "Luxembourg", "Mauritania",
                        "Czech Republic", "Estonia", "Portugal", "Republic of South Sudan", "Israel",
                        "Australia", "Central African Republic", "Mexico", "Armenia", "Mauritius",
                        "Korea", "Tanzania", "Republic of North Macedonia", "Cayman Islands", "Bangladesh",
                        "Ecuador", "Uganda", "Comoros", "Lebanon", "Rwanda", "Liberia", "Turkmenistan",
                        "Romania", "Brazil", "Benin", "Congo, Democratic of Republic", "Cameroon",
                        "Republic of Guatemala", "Uzbekistan", "Guinea-Bissau", "Greece", "Zimbabwe",
                        "Turks and Caicos Islands", "Latvia", "Belgium", "Moldova", "Macao, China",
                        "Qatar", "Bahrain", "Vietnam", "Tunisia", "Spain", "United Kingdom", "Somalia",
                        "Sweden", "Japan", "Paraguay", "Cambodia", "Canada", "Senegal", "France",
                        "Equatorial Guinea", "Sierra Leone", "Chile", "Laos", "Indonesia", "Singapore",
                        "Guinea", "Burundi", "Ethiopia", "Italia", "Falkand Islands", "Chad", "Bulgaria",
                        "Uruguay", "Nicaragua", "Peru", "Iraq", "Austria", "Niger", "Mali", "Congo",
                        "Georgia", "Malta", "Argentina", "Turkey", "Djibouti", "Suriname", "Slovenia",
                        "Sao Tome and Principe", "Switzerland", "Nigeria", "Ghana", "Kenya", "Lithuania",
                        "Madagascar", "Hong Kong, China (1)", "Mainland China", "Germany", "Slovakia",
                        "El Savador", "Panama", "Croatia (Hrvatska)", "Cryprus", "Eritrea", "Namibia",
                        "Gambia", "Egypt", "Guyana", "Honduras", "Iceland", "Colombia", "Morocco",
                        "Gibraltar", "Thailand", "Togo", "Myanmar", "Algeria", "Tajikistan", "Poland",
                        "Brunei", "United Arab Emirates", "Saudi Arabia", "Seychelles", "Netherlands",
                        "Burkina Faso", "Zambia", "Ireland", "Belarus", "Belize", "Libya", "Sudan",
                        "Botswana", "Sri lanka", "Mozambique", "Mongolia",
                        "South Georgia and the South Sandwich Islands", "Others"
                ]

                locations.each { countryName ->
                    new Location(name: countryName).save(flush: true, failOnError: true)
                }
                println("${locations.size()} default location inserted")
            }
        } else {
            println("Location already exist, skipping insert")
        }

        if (ContentType.count() == 0) {
            ContentType.withTransaction {
                def contentType = [
                        "News",
                        "Press Release",
                        "Industry Insight"
                ]

                contentType.each { contentTypeName ->
                    new ContentType(name: contentTypeName).save(flus: true, failOnError: true)
                }
                println("${contentType.size()} default content type inserted")
            }
        } else {
            println("Location already exist, skipping insert")
        }

        if (Industry.count() == 0){
            Industry.withTransaction {
                def industry = [
                        "Business & Professional Services", "Consumer Products", "Financial Services",
                        "Fintech", "Information & Communication Technology", "InvestHK news", "Tourism & Hospitality",
                        "Transport, Logistics & Industrials"
                ]

                industry.each { industryName ->
                    new Industry(name: industryName).save(flus: true, failOnError: true)
                }
                println("${industry.size()} default industry inserted")
            }
        } else {
            println("Industry already exist, skipped insert")
        }
    }
    def destroy = {
    }
}