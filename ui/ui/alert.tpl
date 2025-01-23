<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{ucwords(Lang::T($type))} - {$_c['CompanyName']}</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="ui/ui/images/logo.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ6C7v2RkFm4JH2S4j1CwFJcF0I1v0zp0xWq3wFqkYXw5V3O8Yjo0o5ow4/J" crossorigin="anonymous">
    <meta http-equiv="refresh" content="{$time}; url={$url}">
</head>

<body class="bg-light d-flex align-items-center justify-content-center min-vh-100">

    <div class="card shadow-lg w-100 w-sm-75 w-md-50 p-4">
        <div class="card-body text-center">
            <h1 class="display-4 text-warning mb-4">
                {ucwords(Lang::T($type))}
            </h1>
            <div class="alert alert-warning mb-4">
                <p class="lead text-dark">
                    {$text}
                </p>
            </div>
            <div class="mt-4">
                <a href="{$url}" id="button" class="btn btn-warning btn-lg w-100">
                    {Lang::T('Click Here')} ({$time})
                </a>
            </div>
        </div>
    </div>

    <footer class="text-center mt-4 text-muted">
        {$_c['CompanyName']}
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0Uq8pZ1v5qzOhc2D2S1r0Fy+xFc0T+16W9fpPT60LRKhgqga" crossorigin="anonymous"></script>
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
