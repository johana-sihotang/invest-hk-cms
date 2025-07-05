<nav class="bg-white border-gray-200 fixed top-0 left-0 right-0 z-10  lg:left-64">
    <div class="flex flex-wrap items-center justify-between mx-auto p-4">
        <button data-drawer-target="sidebar-multi-level-sidebar" data-drawer-toggle="sidebar-multi-level-sidebar" aria-controls="sidebar-multi-level-sidebar" type="button" class="inline-flex items-center p-2 mt-2 ms-3 text-sm text-gray-900 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 ">
            <span class="sr-only">Open sidebar</span>
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
            </svg>
        </button>
        <g:link controller="admin" action="getAllAdmins" class="flex items-center rtl:space-x-reverse">
            <span class="self-center text-2xl font-semibold whitespace-nowrap ">Invest</span>
            <asset:image src="invest_hk_logo_title.png" class="h-8" />
        </g:link>
        <div class="flex items-center md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
            <button type="button" class="flex text-sm rounded-full md:me-0 focus:ring-8 focus:ring-gray-300 items-center justify-center w-7 h-7 " id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom">
                <span class="sr-only">Open user menu</span>
                <i class="bi bi-person-circle text-3xl text-gray-900" ></i>
            </button>
            <!-- Dropdown menu -->
            <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow-sm" id="user-dropdown">
            <cu:currentAdmin>
                <div class="px-4 py-3">
                    <span class="block text-sm text-gray-900">
                        ${it.username ?: 'Anonymous'}
                    </span>
                    <span class="block text-sm text-gray-500 truncate">
                        ${it.email ?: 'unknown'}
                    </span>
                </div>
            </cu:currentAdmin>
                <ul class="py-2" aria-labelledby="user-menu-button">
                    <li>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Dashboard</a>
                    </li>
                    <li>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 ">Settings</a>
                    </li>
                    <li>
                        <a href="/logout" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Sign out</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
