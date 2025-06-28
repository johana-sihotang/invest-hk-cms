package investhkcms

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/admin/article/"(controller: 'adminNews', action: 'index')
        "/admin/article/create"(controller: 'adminNews', action: 'createNews')
        "/admin/article/$id"(controller: 'adminNews', action: 'show')
        "/admin/article/$id/edit"(controller: 'adminNews', action: 'edit')
        "/admin/article/$id/delete"(controller: 'adminNews', action: 'delete')

        "/admin/contactUs"(controller: 'adminContactUs', action: 'index')
        "/admin/contactUs/$id"(controller: 'adminContactUs', action: 'show')

        //user view
        "/article"(controller: "news", action: 'index')
        "/article/$id"(controller: "news", action: 'show')

        "/contact_us"(controller: "contactUs", action: 'index')

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
