package investhkcms

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        group "/admin", {
            "/"(controller: 'admin', action: 'getAllAdmins')
            "/register"(controller: 'admin', action: 'register')
            "/$username/delete"(controller: 'admin', action: 'deleteAdmin') {
                constraints {
                    username(matches: /[\w.@-]+/)
                }
            }
            "/homepage/"(controller: 'adminHomepage', action: 'index')
            "/homepage/save"(controller: 'adminHomepage', action: 'save')

            "/article"(controller: 'adminNews', action: 'index')
            "/article/create"(controller: 'adminNews', action: 'createNews')
            "/article/$id"(controller: 'adminNews', action: 'show') {
                constraints {
                    id(matches: /\d+(-.*)?/)
                }
            }
            "/article/$id/edit"(controller: 'adminNews', action: 'edit') {
                constraints {
                    id(matches: /\d+/)
                }
            }
            "/article/$id/delete"(controller: 'adminNews', action: 'delete') {
                constraints {
                    id(matches: /\d+/)
                }
            }

            "/contactUs"(controller: 'adminContactUs', action: 'index')
            "/contactUs/$id"(controller: 'adminContactUs', action: 'show') {
                constraints {
                    id(matches: /\d+/)
                }
            }
        }

        group "/article", {
            "/"(controller: "news", action: 'index')
            "/$id"(controller: "news", action: 'show') {
                constraints {
                    id(matches: /\d+(-.*)?/)
                }
            }
        }

        "/contact_us"(controller: "contactUs", action: 'index')
        "/"(controller: "homepage", action: 'index')

        "500"(view: '/error')
        "404"(controller: 'error', action: 'notFound')

    }
}
