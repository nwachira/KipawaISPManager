<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>{Lang::T('Login')} - {$_c['CompanyName']}</title>
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <title>{$_title} - {$_c['CompanyName']}</title>

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800" rel="stylesheet" />
    <link href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>

    <!-- Nepcha Analytics -->
    <script defer data-site="unganishanetworks.com" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
</head>

<body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-yellow-50 to-amber-100">
    <div class="w-full max-w-md bg-white shadow-lg rounded-lg p-6">
        <h2 class="text-2xl font-semibold text-center text-amber-600 mb-6">
            {Lang::T('Admin Login')}
        </h2>
        <form action="{$_url}admin/post" method="post">
            <input type="hidden" name="csrf_token" value="{$csrf_token}">

            <!-- Username Field -->
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-gray-700 mb-1">
                    {Lang::T('Username')}
                </label>
                <div class="relative">
                    <input
                        type="text"
                        id="username"
                        name="username"
                        required
                        class="block w-full px-4 py-2 border border-amber-300 rounded-lg shadow-sm focus:ring-amber-500 focus:border-amber-500"
                        placeholder="{Lang::T('Username')}"
                    />
                    <span class="absolute inset-y-0 right-3 flex items-center text-amber-500">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
            </div>

            <!-- Password Field -->
            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">
                    {Lang::T('Password')}
                </label>
                <div class="relative">
                    <input
                        type="password"
                        id="password"
                        name="password"
                        required
                        class="block w-full px-4 py-2 border border-amber-300 rounded-lg shadow-sm focus:ring-amber-500 focus:border-amber-500"
                        placeholder="{Lang::T('Password')}"
                    />
                    <span class="absolute inset-y-0 right-3 flex items-center text-amber-500">
                        <i class="fa fa-lock"></i>
                    </span>
                </div>
            </div>

            <!-- Submit Button -->
            <button
                type="submit"
                class="w-full bg-amber-500 hover:bg-amber-600 text-white font-semibold py-2 px-4 rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-amber-400 focus:ring-offset-2">
                {Lang::T('Login')}
            </button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-BhY4yqk7aMf2vlmTXFQnlCzCt3wsAweS0KPviwIqeyAvbHI1h1gBdR6QKBz6eUdo" crossorigin="anonymous"></script>
</body>

</html>
