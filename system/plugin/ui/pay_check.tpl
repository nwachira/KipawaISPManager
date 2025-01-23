<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{$_title}</title>
    <link rel="stylesheet" href="ui/ui/styles/sweetalert2.min.css" />
    <link rel="stylesheet" href="ui/ui/styles/plugins/pace.css" />
    <script src="ui/ui/scripts/sweetalert2.all.min.js"></script>
    <link
      rel="shortcut icon"
      href="ui/ui/images/logo.png"
      type="image/x-icon"
    />
  <style>
  @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap");

  body {
    font-family: "Poppins", sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    color: #333;
  }

  .container {
    background: #fff;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    max-width: 500px;
    width: 100%;
    text-align: center;
  }

  .company-name {
    font-size: 28px;
    font-weight: 600;
    color: #6a11cb;
    margin-bottom: 10px;
  }

  .illustration {
    width: 100%;
    max-width: 280px;
    margin: 0 auto 20px;
  }

  h1 {
    font-size: 26px;
    font-weight: 600;
    color: #444;
    margin-bottom: 10px;
  }

  p {
    font-size: 18px;
    color: #777;
    margin-bottom: 20px;
  }

  .form-group {
    margin-bottom: 25px;
    text-align: left;
  }

  .form-group label {
    font-weight: 600;
    color: #444;
    display: block;
    margin-bottom: 8px;
  }

  .form-group input,
  .form-group select {
    width: 100%;
    padding: 14px;
    border: 2px solid #ccc;
    border-radius: 10px;
    font-size: 16px;
    transition: 0.3s ease;
  }

  .form-group input:focus,
  .form-group select:focus {
    outline: none;
    border-color: #6a11cb;
    box-shadow: 0 0 10px rgba(106, 17, 203, 0.3);
  }

  .pay-button {
    background: linear-gradient(90deg, #6a11cb, #2575fc);
    color: #fff;
    padding: 15px 0;
    border: none;
    border-radius: 50px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    width: 100%;
    transition: all 0.3s ease;
  }

  .pay-button:hover {
    background: linear-gradient(90deg, #2575fc, #6a11cb);
    box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
  }

  .account-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  .account-table th,
  .account-table td {
    padding: 15px;
    border: none;
    font-size: 16px;
  }

  .account-table th {
    background: #f4f4f4;
    font-weight: 600;
    text-align: left;
  }

  .flex-container {
    display: flex;
    gap: 10px;
    align-items: center;
  }

  .flex-container input {
    flex: 1;
  }

  .flex-container button {
    padding: 14px 20px;
    border-radius: 10px;
    border: none;
    background-color: #6a11cb;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s ease;
  }

  .flex-container button:hover {
    background-color: #2575fc;
  }

  .hidden {
    display: none;
  }

  .loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: none;
    justify-content: center;
    align-items: center;
  }

  .loading-overlay .spinner {
    border: 8px solid rgba(255, 255, 255, 0.3);
    border-top: 8px solid #fff;
    border-radius: 50%;
    width: 80px;
    height: 80px;
    animation: spin 1.5s linear infinite;
  }

  @keyframes spin {
    0% {
      transform: rotate(0deg);
    }

    100% {
      transform: rotate(360deg);
    }
  }
</style>

  </head>

  <body>
    <div class="container">
      <div class="company-name">{$_c['CompanyName']}</div>

      {if isset($customerDetails) && $customerDetails !== '' && isset($method)
      && $method == ''}
      <form action="{$_url}plugin/pay_now" method="post">
        <input type="hidden" name="email" value="{$customerDetails.email}" />
        <input type="hidden" name="username" value="{$customerDetails.username}" />
        <input
          type="hidden"
          name="phone"
          value="{$customerDetails.phonenumber}"
        />
        <div class="form-group">
          <label for="gateway">{Lang::T('Payment Gateway')}</label>
          <select
            name="payment_gateway"
            id="payment_gateway"
            class="form-control" required
          >
            <option value="">{Lang::T('Please Choose One')}</option>
            {foreach $payment_gateways as $gateway}
            <option value="{$gateway.value|escape}">
              {$gateway.name|escape}
            </option>
            {/foreach}
          </select>
        </div>
        <table class="account-table">
          <tr>
            <th>{Lang::T('Account Number')}</th>
            <td>{$customerDetails.id}</td>
          </tr>
          <tr>
            <th>{Lang::T('Account Holder')}</th>
            <td>{$customerDetails.fullname}</td>
          </tr>
          <tr>
            <th>{Lang::T('Account Status')}</th>
            <td>{$customerDetails.status}</td>
          </tr>
          <tr>
            <th>{Lang::T('Outstanding Balance')}</th>
            <td>{$customerDetails.balance}</td>
          </tr>
          <tr>
            <th>{Lang::T('Service Type')}</th>
            <td>{$customerDetails.service_type}</td>
          </tr>
          {foreach $_bills as $_bill}
          <tr>
            <th>{Lang::T('Service Plan')}</th>
            <td>{$_bill['namebp']}</td>
          </tr>
          <!-- <tr>
            <th>Routers</th>
            <td>{$_bill['routers']}</td>
          </tr> -->
          <tr>
            <th>Service Status</th>
            {if $_bill['status'] != 'on'}
            <td>{Lang::T('Expired')}</td>
            {else}
            <td>{Lang::T('Active')}</td>
            {/if}
          </tr>
          <tr>
            <th>Next Billing Date</th>
            <td>
              {if $_bill['time'] ne
              ''}{Lang::dateAndTimeFormat($_bill['expiration'],$_bill['time'])}{/if}&nbsp;
            </td>
          </tr>
          <tr>
            <th>{Lang::T('Total Due')}</th>
            <td>{$currency}{$amount}</td>
          </tr>
          <input type="hidden" name="routername" value="{$_bill['routers']}" />
          <input type="hidden" name="plan_name" value="{$_bill['namebp']}" />
          <input type="hidden" name="planid" value="{$_bill['plan_id']}" />
          {/foreach}
        </table>
        <br />
        <button type="submit" name="pay" class="pay-button">
          {Lang::T('Proceed')}
        </button>
      </form>
      {elseif isset($method) && $method == 'verify' && isset($customerDetails)
      && $customerDetails !== ''}
      <form id="payment-form" action="" method="post">
        <input type="hidden" name="account" value="{$id}" />
        <div class="form-group">
          <label for="verification_code">{Lang::T('Verification Code:')}</label>
          <div class="flex-container">
            <input
              type="text"
              id="verification_code"
              name="verification_code"
              placeholder="Enter 6 digit verification code"
              required
            />
            <button
              type="submit"
              name="verify_code"
              id="verify-code-btn"
              class="pay-button"
            >
              {Lang::T('Verify')}
            </button>
            <button
              type="submit"
              name="resend_code"
              id="resend-code-btn"
              class="pay-button hidden"
              formnovalidate
            >
              {Lang::T('Resend Code')}
            </button>
            <span id="timer">{Lang::T('Resend Code in 60s')}</span>
          </div>
        </div>
      </form>
      {else}
      <form id="payment-form" action="" method="post">
        <div class="form-group">
          <label for="account">{Lang::T('Account Details')}</label>
          <input
            type="text"
            id="account"
            name="account"
            placeholder="Username/Phone/Email/Account ID"
            required
          />
        </div>
        <button
          type="submit"
          name="check"
          value="check"
          id="check-status-btn"
          class="pay-button"
        >
          {Lang::T('Proceed')}
        </button>
      </form>
      {/if}
    </div>

    <div class="loading-overlay">
      <div class="spinner"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="ui/ui/scripts/pace.min.js"></script>
    <script>
      $(document).ready(function () {
          $("#payment-form").on("submit", function (event) {
              // Show the loading overlay
              $(".loading-overlay").css("display", "flex");
          });

          // Timer for resend code button
          let timer = 60;
          let interval = setInterval(function () {
              timer--;
              $('#timer').text('Resend Code in ' + timer + 's');
              if (timer <= 0) {
                  clearInterval(interval);
                  $('#resend-code-btn').removeClass('hidden');
                  $('#timer').text('');
              }
          }, 1000);

          // Display SweetAlert toast notification if notify is set
          {if isset($notify)}
          Swal.fire({
              icon: '{if $notify_t == "s"}success{else}error{/if}',
              title: '{$notify|escape:"html"}',
              toast: true,
              position: 'top-end',
              showConfirmButton: false,
              timer: 5000,
              timerProgressBar: true,
              didOpen: (toast) => {
                  toast.addEventListener('mouseenter', Swal.stopTimer);
                  toast.addEventListener('mouseleave', Swal.resumeTimer);
              }
          });
          {/if}
      });
    </script>
  </body>
</html>
