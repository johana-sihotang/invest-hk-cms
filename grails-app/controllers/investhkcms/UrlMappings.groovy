package investhkcms

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/admin/article/"(controller: 'cmsNews', action: 'index')
        "/admin/article/create"(controller: 'cmsNews', action: 'createNews')
        "/admin/article/$id"(controller: 'cmsNews', action: 'show')
        "/admin/article/$id/edit"(controller: 'cmsNews', action: 'edit')
        "/admin/article/$id/delete"(controller: 'cmsNews', action: 'delete')

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
