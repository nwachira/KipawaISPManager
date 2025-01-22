<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{ucwords(Lang::T($type))} - {$_c['CompanyName']}</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="ui/ui/images/logo.png" type="image/x-icon" />
  <script src="https://cdn.tailwindcss.com"></script>
    <meta http-equiv="refresh" content="{$time}; url={$url}">
</head>

<body class="bg-gradient-to-b from-yellow-50 to-amber-100 h-screen flex items-center justify-center">

    <div class="bg-white shadow-xl rounded-lg w-full max-w-md p-8">
        <div class="text-center">
            <h1 class="text-3xl font-semibold text-amber-600 mb-4">
                {ucwords(Lang::T($type))}
            </h1>
            <div class="bg-amber-100 p-4 rounded-lg mb-6">
                <p class="text-lg text-gray-800">
                    {$text}
                </p>
            </div>
            <div class="mt-4">
                <a href="{$url}" id="button" class="inline-block w-full py-2 px-4 bg-amber-600 hover:bg-amber-700 text-white text-lg font-semibold rounded-lg">
                    {Lang::T('Click Here')} ({$time})
                </a>
            </div>
        </div>
    </div>

    <div class="text-center mt-8 text-sm text-gray-600">
        {$_c['CompanyName']}
    </div>

    <script>
        var time = {$time};
        timer();

        function timer() {
            setTimeout(() => {
                time--;
                if (time > -1) {
                    document.getElementById("button").innerHTML = "{Lang::T('Click Here')} (" + time + ")";
                    timer();
                }
            }, 1000);
        }
    </script>

</body>

</html>
