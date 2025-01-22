{include file="sections/header.tpl"}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
<script src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>

<style>
  body {
      background-color: #e0f7fa; /* Light blue background */
      font-family: Arial, sans-serif;
  }

  .form-control, .btn {
      border-radius: 8px;
  }

  .form-group label {
      font-weight: 500;
  }

  .form-control {
      padding: 10px;
      box-shadow: none;
      border: 1px solid #007bff;
      transition: border-color 0.3s;
  }

  .form-control:focus {
      border-color: #0056b3;
      box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  }

  .btn-primary {
      background-color: #007bff;
      border-color: #0056b3;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }

  .btn-primary:hover {
      background-color: #0056b3;
      box-shadow: 0px 4px 10px rgba(0, 123, 255, 0.4);
  }

  .card {
      border: none;
      border-radius: 12px;
      background-color: #f0f4ff; /* Very light blue card background */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .card-header {
      background-color: #007bff;
      color: #fff;
      border-radius: 12px 12px 0 0;
      padding: 15px;
      font-weight: bold;
  }

  .card-body {
      padding: 20px;
  }

  .modal {
      display: none;
      position: fixed;
      z-index: 1050;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
      transition: all 0.3s ease;
  }

  .modal-content {
      background-color: #f0f4ff; /* Light blue modal background */
      margin: 10% auto;
      padding: 20px;
      border-radius: 8px;
      width: 90%;
      max-width: 600px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
      transform: scale(0.9);
      transition: transform 0.3s ease, opacity 0.3s ease;
      opacity: 0;
  }

  .modal.show .modal-content {
      transform: scale(1);
      opacity: 1;
  }

  .close {
      color: #aaa;
      float: right;
      font-size: 24px;
      font-weight: bold;
  }

  .close:hover,
  .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
  }

  /* Traffic Status Icon */
  .traffic-icon {
      display: inline-block;
      width: 12px;
      height: 12px;
      border-radius: 50%;
      margin-right: 5px;
      vertical-align: middle;
      transition: background-color 0.3s;
  }

  .traffic-icon-green {
      background-color: #5cb85c;
  }

  .traffic-icon-yellow {
      background-color: #f0ad4e;
  }

  .traffic-icon-red {
      background-color: #d9534f;
  }

  /* Action Icons */
  .action-icons i {
      font-size: 18px;
      cursor: pointer;
      margin-right: 15px;
      transition: color 0.3s ease;
  }

  .action-icons i:hover {
      color: #007bff;
  }

  /* Button Styles */
  .btn {
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }

  .btn-danger {
      background-color: #dc3545;
      border-color: #dc3545;
  }

  .btn-danger:hover {
      background-color: #c82333;
      border-color: #bd2130;
      box-shadow: 0px 4px 10px rgba(220, 53, 69, 0.4);
  }

  .btn-success {
      background-color: #28a745;
      border-color: #28a745;
  }

  .btn-success:hover {
      background-color: #218838;
      border-color: #1e7e34;
      box-shadow: 0px 4px 10px rgba(40, 167, 69, 0.4);
  }

  /* ApexCharts Styling */
  .apexcharts-canvas {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 12px;
  }

  /* Responsive Styles */
  @media (max-width: 768px) {
      .table th, .table td {
          font-size: 14px;
      }
  }
</style>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="card card-hovered mb20 card-primary">
                <div class="card-title">
                Mpesa Transactions
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>First Name</th>
                                <th>Phone</th>
                                <th>Amount</th>
                                <th>Account No</th>
                                <th>Org Account Balance</th>
                                <th>Transaction ID</th>
                                <th>Transaction Type</th>
                                <th>Transaction Time</th>
                                <th>Business Short Code</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $t as $key => $ts}

                            <tr>
                                <td>{$key + 1}</td>
                                <td>{$ts['FirstName']}</td>
                                <td>{if $ts['MSISDN']}{$ts['MSISDN']|truncate:20:"..."}{else}No MSISDN available{/if}</td>
                                <td>{$ts['TransAmount']}</td>
                                <td>{$ts['BillRefNumber']}</td>
                                <td>{$ts['OrgAccountBalance']}</td>
                                <td>{$ts['TransID']}</td>
                                <td>{$ts['TransactionType']}</td>
                                <td>{$ts['TransTime']}</td>
                                <td>{$ts['BusinessShortCode']}</td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    {include file="pagination.tpl"}
                    <div class="bs-callout bs-callout-info" id="callout-navbar-role">
                        <h4>No Mpesa Transaction </h4>
                        <p>Transaction </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
    var $j = jQuery.noConflict();

    $j(document).ready(function() {
        $j('#customerTable').DataTable({
            "pagingType": "full_numbers",
            "lengthMenu": [
                [5, 10, 25, 50, 100, -1],
                [5, 10, 25, 50, 100, "All"]
            ],
            "pageLength": 25
        });
    });
</script>

{include file="sections/footer.tpl"}
