package investhkcms

class SlugTagLib {
    static namespace = "util"

    def toSlug = { attrs, body ->
        def input = attrs.input ?: ''
        out << input?.toLowerCase()
                ?.replaceAll(/[^a-z0-9\s-]/, '')
                ?.replaceAll(/\s+/, '-')
                ?.replaceAll(/-+/, '-')
                ?.replaceAll(/^-|-$/, '')
    }
}
