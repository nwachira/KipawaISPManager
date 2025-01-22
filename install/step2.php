<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kipawa Installer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
        }
        #main-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: #6c757d;
        }
        h4 {
            font-weight: 600;
            color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }
    </style>
</head>
<body>
    <div id="main-container" class="container">
        <div class="text-center mb-4">
            <img src="img/logo.png" class="img-fluid" alt="Logo" style="max-width: 150px;">
        </div>
        <hr>

        <div class="row">
            <div class="col-12">
                <h4 class="text-center">Kipawa Installer</h4>
                <?php
                $passed = '';
                $ltext = '';
                if (version_compare(PHP_VERSION, '7.2.0') >= 0) {
                    $ltext .= 'To Run Kipawa, you need at least PHP version 7.2.0. Your PHP Version is: ' . PHP_VERSION . " Tested <strong class='text-success'>---PASSED---</strong><br/>";
                    $passed .= '1';
                } else {
                    $ltext .= 'To Run Kipawa, you need at least PHP version 7.2.0. Your PHP Version is: ' . PHP_VERSION . " Tested <strong class='text-danger'>---FAILED---</strong><br/>";
                    $passed .= '0';
                }

                if (extension_loaded('PDO')) {
                    $ltext .= 'PDO is installed on your server: ' . "Tested <strong class='text-success'>---PASSED---</strong><br/>";
                    $passed .= '1';
                } else {
                    $ltext .= 'PDO is not installed on your server: ' . "Tested <strong class='text-danger'>---FAILED---</strong><br/>";
                    $passed .= '0';
                }

                if (extension_loaded('pdo_mysql')) {
                    $ltext .= 'PDO MySQL driver is enabled on your server: ' . "Tested <strong class='text-success'>---PASSED---</strong><br/>";
                    $passed .= '1';
                } else {
                    $ltext .= 'PDO MySQL driver is not enabled on your server: ' . "Tested <strong class='text-danger'>---FAILED---</strong><br/>";
                    $passed .= '0';
                }

                if ($passed == '111') {
                    echo ("<div class='alert alert-success'><strong>System Test Completed!</strong> Great! You can run Kipawa on your server.</div>");
                    echo ("<p>$ltext</p>");
                    echo ("<div class='text-center'><a href='update.php' class='btn btn-warning me-2'>Update System</a>");
                    echo ("<a href='step3.php' class='btn btn-primary'>Continue to Install Kipawa</a></div>");
                } else {
                    echo ("<div class='alert alert-danger'><strong>System Test Failed!</strong> Sorry, the requirements of Kipawa are not met on your server.</div>");
                    echo ("<p>$ltext</p>");
                    echo ("<div class='text-center'><a href='#' class='btn btn-primary disabled'>Correct The Problem To Continue</a></div>");
                }
                ?>
            </div>
        </div>
    </div>
    <div class="footer">
        &copy; 2025 Kipawa. All Rights Reserved
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
