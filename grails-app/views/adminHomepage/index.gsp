<html>
<head>
    <title>Admin | Homepage</title>
</head>

<body>
<div class="container">
    <h1 class="text-3xl text-start md:text-center font-bold mb-5">Homepage</h1>

    <g:hasErrors bean="${config}">
        <div class="alert alert-danger">
            <ul>
                <g:eachError bean="${config}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <g:form controller="adminHomepage" action="save" method="POST" enctype="multipart/form-data">
        <h4 class="text-2xl font-bold mb-3">Section Slider Banner</h4>
        <input type="hidden" name="bannerSourceType" value="news"/>

        <div id="newsSelectionContainer" class="mb-6 space-y-4">
            <div class="news-select-group flex items-center gap-2">
                <select name="selectedNewsIds"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5">
                    <g:each in="${newsList}" var="news">
                        <option value="${news.id}">${news.title.encodeAsHTML()}</option>
                    </g:each>
                </select>

            </div>
        </div>

        <button type="button" id="addBannerBtn" class="text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-4">
            + Add Banner
        </button>


        <!-- Start Section -->
        <h4 class="text-2xl font-bold mb-3">Start Section Images & Captions</h4>

        <div id="startSectionContainer" class="grid gap-6 mb-6 md:grid-cols-2">
        </div>

        <div id="startSectionTemplate" class="hidden">
            <div class="start-section-group">
                <label class="block mb-2 text-sm font-medium text-gray-900">Caption</label>
                <input name="startCaptions" type="text"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5"
                       placeholder="Caption"/>

                <g:render template="/components/dropzone"
                          model="[fieldName: 'startImages', label: 'Start Image']"/>
            </div>
        </div>

        <button type="button" id="addStartSectionBtn"
                class="text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-4">
            + Add Start Section
        </button>


        <!-- Slider -->
        <h4 class="text-2xl font-bold mb-3">Slider Section</h4>

        <!-- Container utama semua slider item -->
        <div id="slidersWrapper" class="space-y-6 mb-6">
            <!-- Item slider akan ditambahkan melalui JS -->
        </div>

        <!-- Tombol Add Slider -->
        <button type="button" id="addSliderBtn"
                class="text-white bg-green-600 hover:bg-green-700 font-medium rounded-lg text-sm px-4 py-2">
            + Add Slider
        </button>

        <!-- Template Utama Slider Item -->
        <div id="sliderWrapperTemplate" class="hidden">
            <div class="slider-wrapper border p-4 rounded-lg space-y-4 bg-gray-50">
                <label class="block text-sm font-medium text-gray-700 mb-1">Slider Type</label>
                <select class="slider-type-select bg-white border border-gray-300 text-sm rounded-lg block w-full p-2.5">
                    <option value="" disabled selected>-- Select Type --</option>
                    <option value="image">Image</option>
                    <option value="slider">Slider</option>
                </select>

                <!-- Template image -->
                <div class="slider-image-template hidden">
                    <g:render template="/components/dropzone"
                              model="[fieldName: 'sliderImages', label: 'Slider Image']"/>
                </div>

                <!-- Template slider -->
                <div class="slider-slider-template hidden space-y-4">
                    <input type="text" name="sliderName" class="bg-white border border-gray-300 text-sm rounded-lg block w-full p-2.5"
                           placeholder="Slider Title" />

                    <div class="slider-items space-y-4">
                        <!-- Content slider (caption + image) akan ditambahkan ke sini -->
                    </div>

                    <button type="button" class="add-slider-content-btn text-blue-600 hover:text-blue-800 text-sm">
                        + Add Slider Content
                    </button>
                </div>
            </div>
        </div>

        <!-- Template satu slider content -->
        <div id="sliderContentItemTemplate" class="hidden">
            <div class="slider-item bg-white p-3 rounded border space-y-2">
                <input type="text" name="sliderContents" class="bg-white border border-gray-300 text-sm rounded-lg block w-full p-2.5"
                       placeholder="Content" />
            </div>
        </div>

        <!-- Buttons -->
        <div class="flex gap-5 mt-6">
            <button type="submit"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Submit</button>
            <g:link controller="admin" action="getAllAdmins"
                    class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                Cancel
            </g:link>
        </div>
    </g:form>


</div>
<asset:javascript src="admin_homepage.js"/>
</body>
</html>
