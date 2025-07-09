<%@ page contentType="text/html;charset=UTF-8" %>

<g:set var="label" value="${label ?: 'Select'}"/>
<g:set var="name" value="${name ?: 'selectField'}"/>
<g:set var="id" value="${id ?: name}"/>
<g:set var="options" value="${options ?: []}"/>
<g:set var="optionKey" value="${optionKey ?: 'id'}"/>
<g:set var="optionValue" value="${optionValue ?: 'name'}"/>
<g:set var="selectedValue" value="${selectedValue}"/>

<label for="${id}_input" class="block mb-2 text-sm font-medium text-gray-900">${label}</label>

<div class="relative">
    <!-- input yang bisa diketik -->
    <input type="text" id="${id}_input" class="bg-gray-50 border border-gray-300 text-sm rounded-lg block w-full p-2.5"
           placeholder="Search..." onkeyup="filterDropdown('${id}')" onclick="toggleDropdown('${id}')" autocomplete="off" />

    <!-- hidden input untuk nilai yang dikirim -->
    <input type="hidden" name="${name}" id="${id}" value="${selectedValue}" />

    <!-- daftar dropdown -->
    <ul id="${id}_dropdown"
        class="absolute bg-white border border-gray-300 mt-1 rounded w-full max-h-48 overflow-y-auto hidden z-50">
        <g:each in="${options}" var="opt">
            <li class="px-4 py-2 hover:bg-blue-100 cursor-pointer"
                data-value="${opt[optionKey]}"
                onclick="selectDropdownOption('${id}', this)">
                ${opt[optionValue]}
            </li>
        </g:each>
    </ul>
</div>

