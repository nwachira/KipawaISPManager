{include file="sections/header.tpl"}
{if in_array($_admin['user_type'], ['SuperAdmin', 'Admin', 'Report'])}
 <div class="container-fluid py-4">

      <div class="row">
     
        <div class="col-lg-6 col-12">
          <div class="row">
           
            <div class="col-lg-6 col-md-6 col-12">
             <a href="{$_url}reports/by-date">
              <div class="card">
                <span class="mask bg-primary opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                  
                   <div class="col-8 text-start">
                          <i class="fas fa-money-bill fa-3x text-white" style="font-size: 2rem; opacity: 0.8;"></i>
                        
                        <h5 class="text-white font-weight-bolder mb-0 mt-3">
                          {$_c['currency_code']} {number_format($iday, 0, $_c['dec_point'], $_c['thousands_sep'])}
                        </h5>
                       
                        <span class="text-white text-xs">Income Today
                        </span>
                        
                        
                        </div>
                        </a>

                   
                  </div>
                </div>
              </div>
              </a>
            </div>

            <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
           
           <a href="{$_url}reports/by-period">
              <div class="card">
               
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
<i class="fas fa-wallet" style="color: #FF6347; font-size: 2rem;"></i>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3">
                       {$_c['currency_code']} {number_format($imonth, 0, $_c['dec_point'], $_c['thousands_sep'])}
                      </h5>
                      <span class="text-white text-xs">Income This Month</span>
                    </div>
                   
                  </div>
                </div>
              </div>
              </a>
            </div>
          </div>
          <div class="row mt-4">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                       <i class="fas fa-users text-info" style="font-size: 2rem; opacity: 0.8;"></i>

                      <h5 class="text-white font-weight-bolder mb-0 mt-3">
                        {$u_act}/{$u_all-$u_act}
                      </h5>
                      <span class="text-white text-sm"> <a href="{$_url}plan/list" class="text-white">{Lang::T('Active')}/{Lang::T('Expired')}</a></span>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
              <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
<i class="fas fa-users" style="font-size: 2rem; color: #4CAF50 !important;" aria-hidden="true"></i>
                    
                      <h5 class="text-white font-weight-bolder mb-0 mt-3">
                        {$c_all}
                      </h5>
                      <span class="text-white text-sm"><a href="{$_url}customers/list" class="text-white text-sm">{Lang::T('Customers')}</a></span>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        {/if}


<div class="col-lg-6 col-12 mt-4 mt-lg-0">
    <div class="card shadow h-100">
        <div class="card-header pb-0 p-3">
            <h6 class="mb-0">User Status</h6>
        </div>
        <div class="card-body pb-0 p-3">
            <ul class="list-group">
                <!-- Active Users -->
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-0">
                    <div class="w-100">
                        <div class="d-flex mb-2">
                            <span class="me-2 text-sm font-weight-bold text-dark">Active Users</span>
                            <span class="ms-auto text-sm font-weight-bold" id="active-users-number">0</span>
                        </div>
                        <div class="progress progress-md">
                            <div class="progress-bar" id="active-users-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </li>
                <!-- Inactive Users -->
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
                    <div class="w-100">
                        <div class="d-flex mb-2">
                            <span class="me-2 text-sm font-weight-bold text-dark">Inactive Users</span>
                            <span class="ms-auto text-sm font-weight-bold" id="inactive-users-number">0</span>
                        </div>
                        <div class="progress progress-md">
                            <div class="progress-bar" id="inactive-users-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </li>
                <!-- Expired Users -->
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
                    <div class="w-100">
                        <div class="d-flex mb-2">
                            <span class="me-2 text-sm font-weight-bold text-dark">Expired Users</span>
                            <span class="ms-auto text-sm font-weight-bold" id="expired-users-number">0</span>
                        </div>
                        <div class="progress progress-md">
                            <div class="progress-bar" id="expired-users-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="row mt-4 justify-content-center">
   <div class="col-md-6 text-center mb-4">
    {if $run_date}
        {assign var="current_time" value=$smarty.now}
        {assign var="run_time" value=strtotime($run_date)}
        {assign var="cronInterval" value=86400}
        {if $current_time - $run_time > $cronInterval}
            {* Cron has not run - show red circle with cross *}
            <div class="d-inline-flex align-items-center">
                <span class="rounded-circle bg-danger d-flex justify-content-center align-items-center" 
                      style="width: 30px; height: 30px;">
                    <i class="fa fa-times text-white fs-6"></i>
                </span>
                <strong class="ms-2 text-danger" style="font-size: 14px;">{Lang::T('Cron not running')}</strong>
            </div>
        {else}
            {* Cron has run - show green circle with checkmark *}
            <div class="d-inline-flex align-items-center">
                <span class="rounded-circle bg-success d-flex justify-content-center align-items-center" 
                      style="width: 30px; height: 30px;">
                    <i class="fa fa-check text-white fs-6"></i>
                </span>
                <strong class="ms-2 text-success" style="font-size: 14px;">{Lang::T('Cron running')}</strong>
            </div>
        {/if}
    {else}
        {* Cron not set up - show yellow warning circle *}
        <div class="d-inline-flex align-items-center">
            <span class="rounded-circle bg-warning d-flex justify-content-center align-items-center" 
                  style="width: 30px; height: 30px;">
                <i class="fa fa-exclamation text-dark fs-6"></i>
            </span>
            <strong class="ms-2 text-warning" style="font-size: 14px;">{Lang::T('Cron Not Set Up')}</strong>
        </div>
    {/if}
</div>

</div>
    </div>

    
</div>







<div class="col-lg-7 mt-4">
    <div class="card z-index-2">
        <div class="card-header pb-0 flex justify-between items-center">
            <div class="flex justify-between w-full">
                <h6>{Lang::T('Total Monthly Sales')}</h6>
                <div class="flex space-x-2">
                    <!-- Button with refresh icon -->
                    <a href="{$_url}dashboard&refresh" class="bg-teal-500 text-white p-2 rounded-md text-sm hover:bg-teal-600">
                        <i class="fa fa-refresh"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="card-body p-3">
            <canvas id="chart-line" class="chart-canvas" height="300"></canvas>
        </div>
    </div>
</div>

<div class="col-lg-4 col-md-6 mt-4">
    <div class="card shadow-lg">
        <div class="card-body p-2">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <h6 class="card-title mb-0 text-primary">{Lang::T('Activity Log')}</h6>
                <a href="{$_url}logs" class="text-decoration-none text-info small">{Lang::T('View All')}</a>
            </div>
            <ul class="list-unstyled">
                {foreach $dlog as $dlogs}
                    <li class="d-flex align-items-start mb-2">
                        <span class="mt-1 me-2 bg-info rounded-circle" style="width: 6px; height: 6px;"></span>
                        <div class="flex-grow-1">
                            <span class="text-muted small">{Lang::timeElapsed($dlogs['date'], true)}</span>
                            <p class="mb-0 small">{Lang::T('Activity Log')}</p>
                        </div>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>
      


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Example monthlySales data (this will be passed from PHP)
    var monthlySales = JSON.parse('{$monthlySales|json_encode}');
    
    // Function to find the data for a given month
    function findMonthData(monthlySales, month) {
        for (var i = 0; i < monthlySales.length; i++) {
            if (monthlySales[i].month === month) {
                return monthlySales[i];
            }
        }
        return null;  // Return null if the month is not found
    }

    // Extract months and sales data from the monthlySales array
    var months = [];
    var salesData = [];
    
    // Assuming monthlySales is an array of objects with 'month' and 'sales' properties
    var allMonths = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    
    // Loop through the months and fetch corresponding sales data
    allMonths.forEach(function(month) {
        var monthData = findMonthData(monthlySales, month);
        if (monthData) {
            months.push(month);  // Add month name
            salesData.push(monthData.sales);  // Add sales data for that month
        } else {
            months.push(month);  // If no data found, still push the month
            salesData.push(0);    // Push 0 for sales if no data exists
        }
    });
    
    // Line chart data
    var ctx2 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);
    gradientStroke1.addColorStop(1, 'rgba(203,12,159,0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke1.addColorStop(0, 'rgba(203,12,159,0)');

    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);
    gradientStroke2.addColorStop(1, 'rgba(20,23,39,0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke2.addColorStop(0, 'rgba(20,23,39,0)');

    // Chart initialization
    new Chart(ctx2, {
        type: "line",
        data: {
            labels: months,  // Use dynamic months
            datasets: [{
                    label: "Sales Data",
                    tension: 0.4,
                    borderWidth: 0,
                    pointRadius: 0,
                    borderColor: "#cb0c9f",
                    borderWidth: 3,
                    backgroundColor: gradientStroke1,
                    fill: true,
                    data: salesData,  // Use dynamic sales data
                    maxBarThickness: 6
                },
            ],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false,
                }
            },
            interaction: {
                intersect: false,
                mode: 'index',
            },
            scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        padding: 10,
                        color: '#b2b9bf',
                        font: {
                            size: 11,
                            family: "Inter",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
                x: {
                    grid: {
                        drawBorder: false,
                        display: false,
                        drawOnChartArea: false,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        color: '#b2b9bf',
                        padding: 20,
                        font: {
                            size: 11,
                            family: "Inter",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
            },
        },
    });
</script>


<script>
    // Example values from your PHP template variables
    var u_act = '{$u_act}'; // Active users
    var c_all = '{$c_all}'; // Total users
    var u_all = '{$u_all}'; // All users
    var expired = u_all - u_act; // Expired users
    var inactive = c_all - u_all; // Inactive users

    // Ensure inactive can't be negative
    if (inactive < 0) {
        inactive = 0;
    }

    // Update the HTML with the actual user numbers
    document.getElementById('active-users-number').textContent = u_act;
    document.getElementById('inactive-users-number').textContent = inactive;
    document.getElementById('expired-users-number').textContent = expired;

    // Update the progress bars with different colors
    document.getElementById('active-users-bar').style.width = (u_act / c_all) * 100 + "%";
    document.getElementById('inactive-users-bar').style.width = (inactive / c_all) * 100 + "%";
    document.getElementById('expired-users-bar').style.width = (expired / c_all) * 100 + "%";

    // Assign different colors to each progress bar
    document.getElementById('active-users-bar').classList.add('bg-success');  // Green for active users
    document.getElementById('inactive-users-bar').classList.add('bg-warning'); // Yellow for inactive users
    document.getElementById('expired-users-bar').classList.add('bg-danger'); // Red for expired users
</script>

<script>
    // Live Clock Script
    function updateClock() {
        const clockElement = document.getElementById('current-time');
        const now = new Date();
        const timeString = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' });
        clockElement.textContent = timeString;
    }
    setInterval(updateClock, 1000);
    updateClock();
</script>

{include file="sections/footer.tpl"}