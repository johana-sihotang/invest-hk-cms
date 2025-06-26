<%@ page contentType="text/html;charset=UTF-8" %>
<%-- Template Select Component --%>

<g:set var="label" value="${label ?: 'Select'}" />
<g:set var="name" value="${name ?: 'selectField'}" />
<g:set var="id" value="${id ?: name}" />
<g:set var="options" value="${options ?: []}" />
<g:set var="optionKey" value="${optionKey ?: 'id'}"/>
<g:set var="optionValue" value="${optionValue ?: 'name'}"/>
<g:set var="selectedValue" value="${selectedValue}" />

<label for="${id}" class="block mb-2 text-sm font-medium text-gray-900">${label}</label>
<select name="${name}" id="${id}" class="select bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full p-2.5">
    <option value="">Choose ${label}</option>
    <g:each in="${options}" var="opt">
        <option value="${opt[optionKey]}" ${opt[optionKey].toString() == selectedValue.toString() ? 'selected' : ''}>${opt[optionValue]}</option>
    </g:each>
</select>
