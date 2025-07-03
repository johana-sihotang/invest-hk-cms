<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 29/06/25
  Time: 14.16
--%>
<!doctype html>
<html class="h-full">
<head>
    <title>Login | Invest HK</title>
    <asset:stylesheet src="home_page.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />

</head>
<body class="h-full font-[Outfit]">
<section class="relative w-full h-full bg-cover bg-center bg-no-repeat flex items-center justify-center"
         style="background-image: url('${assetPath(src: 'light-blue.jpg')}');">

    <!-- Form container -->
    <div class="relative z-10 w-full max-w-md sm:max-w-lg md:max-w-xl bg-white/25 backdrop-blur-md rounded-lg shadow p-6">
    <g:if test="${params.login_error}">
        <div id="login-error-alert" class="bg-red-100 border border-red-400 text-red-700 px-2 py-2 rounded mb-4 flex justify-between" role="alert">
            <p><strong class="font-bold">Login failed!</strong>
                <span>Invalid username or password</span></p>
            <button id="close-alert-btn" class="pointer"><i class="bi bi-x-circle"></i></button>
        </div>
    </g:if>

    <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900 text-center md:text-4xl mb-4">
            Login
        </h1>
        <form class="space-y-4 md:space-y-6" id="loginForm" action="${postUrl ?: '/login/auth'}" method="POST">
            <div>
                <label for="username" class="block mb-2 text-lg font-medium text-gray-900">Username</label>
                <input type="text" name="username" id="username"
                       class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       placeholder="username" required>
            </div>
            <div>
                <label for="password" class="block mb-2 text-lg font-medium text-gray-900">Password</label>
                <input type="password" name="password" id="password"
                       placeholder="••••••••"
                       class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>
            <div class="flex items-center justify-between">
                <div class="flex items-start">
                    <div class="flex items-center h-5">
                        <input id="remember" type="checkbox"
                               class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300">
                    </div>
                    <div class="ml-3 text-sm">
                        <label for="remember" class="text-black">Remember me</label>
                    </div>
                </div>
                <a href="#" class="text-sm font-medium text-primary-600 hover:underline">Forgot password?</a>
            </div>
            <button type="submit"
                    class="w-full text-white bg-blue-800 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-lg px-5 py-2.5 text-center">
                Sign in
            </button>
            <p class="text-sm font-light text-black">
                Don’t have an account yet? <a href="#"
                                              class="font-medium text-primary-600 hover:underline hover:text-blue-600">Sign up</a>
            </p>
        </form>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var closeBtn = document.getElementById('close-alert-btn');
        var alertBox = document.getElementById('login-error-alert');

        if (closeBtn && alertBox) {
            closeBtn.addEventListener('click', function () {
                alertBox.style.display = 'none';
            });
        }
    });
</script>

</body>
</html>
