package investhkcms

class UrlMappings {
    static mappings = {
        group "/admin", {
            "/"(controller: 'admin', action: 'getAllAdmins')

            "/dashboard/create"(controller: 'adminDashboard', action: 'create')

            "/article"(controller: 'adminNews', action: 'index')
            "/article/create"(controller: 'adminNews', action: 'createNews')
            "/article/$id"(controller: 'adminNews', action: 'show') {
                constraints {
                    id(matches: /\d+/)
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
                    id(matches: /\d+/)
                }
            }
        }

        "/contact_us"(controller: "contactUs", action: 'index')
        "/news_landing"(controller: "news", action: 'index')
        "/"(view: "/index")

        "500"(view: '/error')
        "404"(controller: 'error', action: 'notFound')

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
    }
}
