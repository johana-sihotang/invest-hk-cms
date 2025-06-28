<%@ page contentType="text/html;charset=UTF-8" %>
<%-- Template Select Component --%>

<g:set var="defaultLabelClass" value="block mb-2 text-sm font-medium text-gray-900"/>
<g:set var="defaultSelectClass" value="select bg-gray-50 border text-gray-900 text-sm rounded-lg block w-full p-2.5"/><g:set var="defaultOptionClass" value=""/>

<g:set var="labelClass" value="${labelClass ?: defaultLabelClass}" />
<g:set var="selectClass" value="${selectClass ?: defaultSelectClass}" />
<g:set var="optionClass" value="${optionClass ?: defaultOptionClass}" />

<g:set var="label" value="${label ?: 'Select'}" />
<g:set var="name" value="${name ?: 'selectField'}" />
<g:set var="id" value="${id ?: name}" />
<g:set var="options" value="${options ?: []}" />
<g:set var="optionKey" value="${optionKey ?: 'id'}"/>
<g:set var="optionValue" value="${optionValue ?: 'name'}"/>
<g:set var="selectedValue" value="${selectedValue}" />

<label for="${id}" class="${labelClass}">${label}</label>
<select name="${name}" id="${id}" class="${selectClass}" required ${disabled ? 'disabled' : ''}>
    <option value=""></option>
    <g:each in="${options}" var="opt">
        <option class="${optionClass}" value="${opt[optionKey]}" ${opt[optionKey]?.toString() == selectedValue?.toString() ? 'selected' : ''}>
            ${opt[optionValue]}
        </option>
    </g:each>
</select>
