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
        .help-block {
            font-size: 0.875rem;
            color: #6c757d;
        }
        .spinner-border {
            width: 1.5rem;
            height: 1.5rem;
            border-width: 3px;
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
                if (isset($_GET['_error']) && ($_GET['_error']) == '1') {
                    echo '<div class="alert alert-danger text-center">Unable to Connect to Database. Please ensure the database information is correct and try again!</div>';
                }

                $cururl = (((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') || $_SERVER['SERVER_PORT'] == 443) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
                $appurl = str_replace(['/install/step3.php', '?_error=1', '/system'], '', $cururl);
                ?>

                <form action="step4.php" method="post" id="install-form">
                    <fieldset>
                        <legend>Database Connection & Site Configuration</legend>

                        <div class="mb-3">
                            <label for="appurl" class="form-label">Application URL</label>
                            <input type="text" class="form-control" id="appurl" name="appurl" value="<?php echo $appurl; ?>">
                            <span class="help-block">Application URL without trailing slash (e.g., http://172.16.10.10). Please keep default if unsure.</span>
                        </div>

                        <div class="mb-3">
                            <label for="dbhost" class="form-label">Database Host</label>
                            <input type="text" class="form-control" id="dbhost" required name="dbhost">
                        </div>

                        <div class="mb-3">
                            <label for="dbuser" class="form-label">Database Username</label>
                            <input type="text" class="form-control" id="dbuser" required name="dbuser">
                        </div>

                        <div class="mb-3">
                            <label for="dbpass" class="form-label">Database Password</label>
                            <input type="text" class="form-control" id="dbpass" required name="dbpass">
                        </div>

                        <div class="mb-3">
                            <label for="dbname" class="form-label">Database Name</label>
                            <input type="text" class="form-control" id="dbname" required name="dbname">
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="radius" name="radius" value="yes">
                            <label for="radius" class="form-check-label">Install <a href="https://github.com/hotspotbilling/phpnuxbill/wiki/FreeRadius" target="_blank">Radius</a> Table?</label>
                            <span class="help-block">Not required if using <a href="https://github.com/hotspotbilling/phpnuxbill/wiki/FreeRadius-Rest" target="_blank">FreeRadius REST</a>.</span>
                        </div>

                        <button type="submit" class="btn btn-primary" id="submit-btn">
                            <span id="submit-text">Submit</span>
                        </button>
                        <div id="loading-spinner" class="spinner-border text-light" style="display:none;"></div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
        &copy; 2021 Kipawa. All Rights Reserved
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('install-form').addEventListener('submit', function(e) {
            e.preventDefault();

            // Show the loading spinner and change button text
            document.getElementById('submit-text').innerText = 'Please wait for migration to complete';
            document.getElementById('loading-spinner').style.display = 'inline-block';

            // Simulate form submission (for demo purposes)
            setTimeout(() => {
                this.submit(); // Uncomment this line to actually submit the form
            }, 6000); // Adjust the timeout to your needs (simulate a 2-second delay for demo)
        });
    </script>
</body>
</html>
