<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 28/06/2025
  Time: 18:24
--%>

<div class="container">
    <h1 class="text-3xl text-start md:text-center font-bold mb-5">Detail Message</h1>

    <g:hasErrors bean="${contactUs}">
        <div class="alert alert-danger">
            <ul>
                <g:eachError bean="${contactUs}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <div class="grid gap-6 mb-6 md:grid-cols-2">
        <div>
            <label for="lastName" class="block mb-2 text-sm font-medium text-gray-900">Last Name</label>
            <input name="lastName" type="text" id="lastName"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.lastName}" disabled/>
        </div>

        <div>
            <label for="firstName" class="block mb-2 text-sm font-medium text-gray-900">First Name</label>
            <input name="firstName" type="text" id="firstName"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.firstName}" disabled/>
        </div>

        <div>
            <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
            <input name="email" type="text" id="email"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.email}" disabled/>
        </div>

        <div>
            <label for="tel" class="block mb-2 text-sm font-medium text-gray-900">Tel</label>
            <input name="tel" type="text" id="tel"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.tel}" disabled/>
        </div>

        <div>
            <label for="city" class="block mb-2 text-sm font-medium text-gray-900">City</label>
            <input name="city" type="text" id="city"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.city}" disabled/>
        </div>

        <div>
            <label for="location" class="block mb-2 text-sm font-medium text-gray-900">Created</label>
            <input name="location" type="text" id="location"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.location}" disabled/>
        </div>

        <div>
            <label for="location" class="block mb-2 text-sm font-medium text-gray-900">Enquiry</label>
            <input name="location" type="text" id="location"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   value="${contactUs?.dateCreated}" disabled/>
        </div>

        <div>
            <label for="enquiry" class="block mb-2 text-sm font-medium text-gray-900">Sub Title</label>
            <textarea name="enquiry" type="text" id="enquiry"
                   class="tinymce-disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                    disabled>${contactUs?.enquiry}</textarea>
        </div>
    </div>

<div class="flex gap-5">
    <g:link controller="adminContactUs" action="index"
            class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 mt-5 text-center">
        Back
    </g:link>
</div>
