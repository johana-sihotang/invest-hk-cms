<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 29/06/25
  Time: 14.16
--%>
<head>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
</head>
<body>
<section class="bg-gray-50 w-full max-w-md mx-auto ">
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 ">

        </a>
        <div class="w-full bg-black rounded-lg shadow  md:mt-0 sm:max-w-md xl:p-0 ">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 text-center md:text-2xl">
                    Login
                </h1>
                <g:form controller="admin" class="space-y-4 md:space-y-6" action="login">
                    <div>
                        <label for="username" class="block mb-2 text-sm font-medium text-gray-900 ">Username</label>
                        <input type="email" name="username" id="username" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 " placeholder="username" required="">
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 ">Password</label>
                        <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required="">
                    </div>
                    <div class="flex items-center justify-between">
                        <div class="flex items-start">
                            <div class="flex items-center h-5">
                                <input id="remember" aria-describedby="remember" type="checkbox" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 " required="">
                            </div>
                            <div class="ml-3 text-sm">
                                <label for="remember" class="text-gray-500 ">Remember me</label>
                            </div>
                        </div>
                        <a href="#" class="text-sm font-medium text-primary-600 hover:underline ">Forgot password?</a>
                    </div>
                    <button type="submit" class="w-full text-black bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Sign in</button>
                    <p class="text-sm font-light text-gray-500 ">
                        Don’t have an account yet? <a href="#" class="font-medium text-primary-600 hover:underline ">Sign up</a>
                    </p>
                </g:form>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
</body>

