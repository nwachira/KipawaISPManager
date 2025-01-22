{include file="sections/header.tpl"}
<!-- reports-daily -->
<div class="row">
    <div class="col-lg-3">
        <form method="get" class="form">
            <div class="card shadow-sm">
                <div class="card-header" style="cursor: pointer;" onclick="showFilter()">
                    <h5 class="card-title mb-0">{Lang::T('Filter')}</h5>
                </div>
                <div id="filter_box" class="card-body d-none d-lg-block">
                    <div class="mb-3 text-center">
                        <label>
                            <input type="checkbox" id="show_chart" onclick="return setShowChart()">
                            {Lang::T('Show chart')}
                        </label>
                    </div>
                    <hr class="my-2">
                    <input type="hidden" name="_route" value="reports">
                    <div class="mb-3">
                        <label>{Lang::T('Start Date')}</label>
                        <input type="date" class="form-control" name="sd" value="{$sd}">
                    </div>
                    
                    <div class="mb-3">
                        <label>{Lang::T('End Date')}</label>
                        <input type="date" class="form-control" name="ed" value="{$ed}">
                    </div>
                    <div class="mb-3">
                        <label>{Lang::T('End Time')}</label>
                        <input type="time" class="form-control" name="te" value="{$te}">
                    </div>
                   
                    
                    
                    
                    <button type="submit" class="btn btn-success btn-block">Apply Filters</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-lg-9">
        <span id="chart_area" class="d-none">
            <div class="card shadow-sm">
                <div class="card-body row">
                    <div class="col-md-3 col-sm-6">
                        <canvas id="cart_type"></canvas>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <canvas id="cart_plan"></canvas>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <canvas id="cart_method"></canvas>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <canvas id="cart_router"></canvas>
                    </div>
                </div>
            </div>
            <div class="card shadow-sm">
                <div class="card-header">
                    <h5 class="card-title mb-0">{Lang::dateFormat($sd)} - {Lang::dateFormat($ed)} <sup>{Lang::T('Max 30 days')}</sup></h5>
                </div>
                <div class="card-body" style="height: 300px;">
                    <canvas id="line_cart"></canvas>
                </div>
            </div>
        </span>
        <div class="card shadow-sm">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>
                                <a href="{$_url}export/print-by-date&{$filter}" class="btn btn-outline-secondary" target="_blank"><i class="bi bi-printer"></i></a>
                                <a href="{$_url}export/pdf-by-date&{$filter}" class="btn btn-outline-secondary"><i class="bi bi-file-earmark-pdf"></i></a>
                            </th>
                            <th colspan="7"></th>
                        </tr>
                        <tr>
                            <th>{Lang::T('Username')}</th>
                            
                           
                            <th>{Lang::T('Plan Price')}</th>
                            <th>{Lang::T('Created On')}</th>
                            <th>{Lang::T('Expires On')}</th>
                            <th>{Lang::T('Method')}</th>
                            <th>{Lang::T('Routers')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $d as $ds}
                            <tr>
                                <td>{$ds['username']}</td>
                               
                                
                                <td class="text-end">{Lang::moneyFormat($ds['price'])}</td>
                                <td>{Lang::dateAndTimeFormat($ds['recharged_on'],$ds['recharged_time'])}</td>
                                <td>{Lang::dateAndTimeFormat($ds['expiration'],$ds['time'])}</td>
                                <td>{$ds['method']}</td>
                                <td>{$ds['routers']}</td>
                            </tr>
                        {/foreach}
                        <tr>
                            <th>{Lang::T('Total')}</th>
                            <td colspan="2"></td>
                            <th class="text-end">{Lang::moneyFormat($dr)}</th>
                            <td colspan="4"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="card-footer text-center">
                <p class="text-muted small">{Lang::T('All Transactions at Date')}: {Lang::dateAndTimeFormat($sd, $ts)} - {Lang::dateAndTimeFormat($ed, $te)}</p>
            </div>
        </div>
    </div>
</div>

{include file="pagination.tpl"}

<div class="alert alert-warning text-white mt-4">
    <h5 class="alert-heading">{Lang::T('Information')}</h5>
    <p>{Lang::T('Export and Print will show all data without pagination')}.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-autocolors"></script>

{literal}
    <script>
        var isShow = false;

        function showFilter() {
            if (isShow) {
                $("#filter_box").addClass("d-none");
                isShow = false;
            } else {
                $("#filter_box").removeClass("d-none");
                isShow = true;
            }
        }
        document.addEventListener("DOMContentLoaded", function() {
        const autocolors = window['chartjs-plugin-autocolors'];
        Chart.register(autocolors);
        var options = {
        responsive: true,
        aspectRatio: 1,
        plugins: {
            autocolors: {
                mode: 'data'
            },
            legend: {
                position: 'bottom',
                labels: {
                    boxWidth: 15
                }
            }
        }
        };

        function create_cart(field, labels, datas, options) {
        new Chart(document.getElementById(field), {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    data: datas,
                    borderWidth: 1
                }]
            },
            options: options
        });
        }

        function showChart() {
        // get cart one by one
        $.getJSON("{/literal}{$_url}{literal}reports/ajax/type&{/literal}{$filter}{literal}", function( data ) {
        create_cart('cart_type', data.labels, data.datas, options);
        $.getJSON("{/literal}{$_url}{literal}reports/ajax/plan&{/literal}{$filter}{literal}", function( data ) {
        create_cart('cart_plan', data.labels, data.datas, options);
        $.getJSON("{/literal}{$_url}{literal}reports/ajax/method&{/literal}{$filter}{literal}", function( data ) {
        create_cart('cart_method', data.labels, data.datas, options);
        $.getJSON("{/literal}{$_url}{literal}reports/ajax/router&{/literal}{$filter}{literal}", function( data ) {
        create_cart('cart_router', data.labels, data.datas, options);
        getLineChartData();
        });
        });
        });
        });
        }

        if (getCookie('show_report_graph') != 'hide') {
            $("#chart_area").removeClass("d-none");
            document.getElementById('show_chart').checked = true;
            showChart();
        }

        });

        function setShowChart() {
            if (document.getElementById('show_chart').checked) {
                setCookie('show_report_graph', 'show', 30);
            } else {
                setCookie('show_report_graph', 'hide', 30);
            }
            location.reload();
        }

        function getLineChartData() {
            $.getJSON("{/literal}{$_url}{literal}reports/ajax/line&{/literal}{$filter}{literal}", function( data ) {
            var linechart = new Chart(document.getElementById('line_cart'), {
                type: 'line',
                data: {
                    labels: data.labels,
                    datasets: data.datas,
                },
                options: {
                    maintainAspectRatio: false,
                    aspectRatio: 1,
                    plugins: {
                        autocolors: {
                            mode: 'data'
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        });
        }
    </script>
{/literal}

{include file="sections/footer.tpl"}
