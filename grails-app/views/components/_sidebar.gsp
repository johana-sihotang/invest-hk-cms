<aside id="sidebar-multi-level-sidebar" class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full lg:translate-x-0" aria-label="Sidebar">
    <div class="h-full px-3 py-4 overflow-y-auto bg-white ">
        <ul class="space-y-2 font-medium lg:mt-14">
            <li>
                <g:link controller="admin" action="getAllAdmins"
                        class="flex items-center p-2 rounded-lg group ${controllerName == 'admin' && actionName == 'getAllAdmins' ? 'bg-slate-900 text-white' : 'text-gray-900 hover:bg-gray-300'}">

                    <i class="bi bi-person-workspace shrink-0 transition duration-75 text-2xl  ${controllerName == 'admin' && actionName == 'getAllAdmins' ? 'text-white' : 'text-gray-500 group-hover:text-gray-900'}"></i>

                    <span class="ms-3">User</span>
                </g:link>

            </li>
            <li>
                <g:link controller="adminHomepage" action="index"
                        class="flex items-center p-2 rounded-lg group ${controllerName == 'adminHomepage' && actionName == 'index' ? 'bg-slate-900 text-white' : 'text-gray-900 hover:bg-gray-300'}">

                    <i class="bi bi-house-door shrink-0 transition duration-75 text-2xl ${controllerName == 'adminHomepage' && actionName == 'index' ? 'text-white' : 'text-gray-500 group-hover:text-gray-900'}"></i>

                    <span class="ms-3">Home</span>
                </g:link>

            </li>
            <li>
                <button type="button" class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-300 " aria-controls="dropdown-example" data-collapse-toggle="dropdown-article">
                    <i class="bi bi-newspaper shrink-0  text-gray-500 transition duration-75 group-hover:text-gray-900 text-2xl"></i>
                    <span class="flex-1 ms-3 text-left rtl:text-right whitespace-nowrap">Article</span>
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                    </svg>
                </button>
                <ul id="dropdown-article" class="py-2 space-y-2">
                    <li>
                        <g:link controller="adminNews" action="index"
                                class="flex items-center w-full p-1 text-gray-900 transition duration-75 rounded-lg pl-11  group ${controllerName == 'adminNews' && actionName == 'index' ? 'bg-slate-900 text-white' : 'text-gray-900 hover:bg-gray-300'}">

                            <i class="bi bi-card-list shrink-0 transition duration-75 text-2xl ${controllerName == 'adminNews' && actionName == 'index' ? 'text-white' : 'text-gray-500 group-hover:text-gray-900'}"></i>

                            <span class="ms-3">List Article</span>
                        </g:link>
                    </li>

                    <li>
                        <g:link controller="adminNews" action="createNews" class="flex items-center w-full p-1 text-gray-900 transition duration-75 rounded-lg pl-11 group  ${controllerName == 'adminNews' && actionName == 'createNews' ? 'bg-slate-900 text-white' : 'text-gray-900 hover:bg-gray-300'}">
                            <i class="bi bi-folder-plus shrink-0 transition duration-75 text-2xl ${controllerName == 'adminNews' && actionName == 'createNews' ? 'text-white' : 'text-gray-500 group-hover:text-gray-900'}"></i>
                            <span class="ms-3">Add Article</span>
                        </g:link>
                    </li>
                </ul>
            </li>
            <li>
                <g:link controller="adminContactUs" action="index"
                        class="flex items-center p-2 rounded-lg group ${controllerName == 'adminContactUs' && actionName == 'index' ? 'bg-slate-900 text-white' : 'text-gray-900 hover:bg-gray-300'}">

                    <i class="bi bi-person-rolodex shrink-0 transition duration-75 text-2xl ${controllerName == 'adminContactUs' && actionName == 'index' ? 'text-white' : 'text-gray-500 group-hover:text-gray-900'}"></i>

                    <span class="ms-3">Contact Us</span>
                </g:link>

            </li>
        </ul>
    </div>
</aside>
