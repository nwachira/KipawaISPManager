<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Error Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

  <div class="text-center">
    <h1 class="text-4xl font-bold text-red-600">{$error_title}</h1>
    <p class="text-2xl md:text-2xl font-semibold mt-4">Oops! {$error_message}</p>
    <div class="mt-6">
      <a href="/" class="px-6 py-2 text-white bg-blue-500 hover:bg-blue-700 rounded-lg shadow-md">
        Go Back Home
      </a>
    </div>
  </div>

</body>
</html>
