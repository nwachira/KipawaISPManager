{include file="sections/header.tpl"}

<form class="form-horizontal" method="post" action="{$_url}services/edit-post">
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-3">
                <div class="card-header">{Lang::T('Edit Service Package')} || {$d['name_plan']}</div>
                <div class="card-body">
                    <input type="hidden" name="id" value="{$d['id']}">
                    
                    <div class="mb-3 row">
                        <label for="status" class="col-sm-3 col-form-label">{Lang::T('Status')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Customer cannot buy disabled Plan, but admin can recharge it, use it if you want only admin recharge it">?</a>
                        </label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="enabled" value="1" {if $d['enabled'] == 1}checked{/if} id="status1">
                                <label class="form-check-label" for="status1">{Lang::T('Active')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="enabled" value="0" {if $d['enabled'] == 0}checked{/if} id="status0">
                                <label class="form-check-label" for="status0">{Lang::T('Not Active')}</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="type" class="col-sm-3 col-form-label">{Lang::T('Type')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Postpaid will have fix expired date">?</a>
                        </label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="prepaid" onclick="prePaid()" value="yes" {if $d['prepaid'] == 'yes'}checked{/if} id="prepaidYes">
                                <label class="form-check-label" for="prepaidYes">{Lang::T('Prepaid')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="prepaid" onclick="postPaid()" value="no" {if $d['prepaid'] == 'no'}checked{/if} id="prepaidNo">
                                <label class="form-check-label" for="prepaidNo">{Lang::T('Postpaid')}</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="plan_type" class="col-sm-3 col-form-label">{Lang::T('Package Type')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Personal Plan will only show to personal Customer, Business plan will only show to Business Customer">?</a>
                        </label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="plan_type" value="Personal" {if $d['plan_type'] == 'Personal'}checked{/if} id="personal">
                                <label class="form-check-label" for="personal">{Lang::T('Personal')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="plan_type" value="Business" {if $d['plan_type'] == 'Business'}checked{/if} id="business">
                                <label class="form-check-label" for="business">{Lang::T('Business')}</label>
                            </div>
                        </div>
                    </div>
                    
                    {if $_c['radius_enable'] and $d['is_radius']}
                        <div class="mb-3 row">
                            <label for="radius" class="col-sm-3 col-form-label">Radius
                                <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                    data-bs-trigger="focus" data-bs-container="body"
                                    data-bs-content="If you enable Radius, choose device to radius, except if you have custom device.">?</a>
                            </label>
                            <div class="col-sm-9">
                                <span class="badge bg-primary">RADIUS</span>
                            </div>
                        </div>
                    {/if}
                    
                    <div class="mb-3 row">
                        <label for="device" class="col-sm-3 col-form-label">{Lang::T('Device')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="This Device are the logic how PHPNuxBill Communicate with Mikrotik or other Devices">?</a>
                        </label>
                        <div class="col-sm-9">
                            <select class="form-select" id="device" name="device">
                                {foreach $devices as $dev}
                                    <option value="{$dev}" {if $dev == $d['device']}selected{/if}>{$dev}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="name" class="col-sm-3 col-form-label">{Lang::T('Package Name')}</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="name" name="name" maxlength="40" value="{$d['name_plan']}">
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="typebp" class="col-sm-3 col-form-label">{Lang::T('Package Type')}</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Unlimited" name="typebp" value="Unlimited" {if $d['typebp'] eq 'Unlimited'} checked {/if}>
                                <label class="form-check-label" for="Unlimited">{Lang::T('Unlimited')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Limited" name="typebp" value="Limited" {if $d['typebp'] eq 'Limited'} checked {/if}>
                                <label class="form-check-label" for="Limited">{Lang::T('Limited')}</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3 row {if $d['typebp'] eq 'Unlimited'} d-none {/if}" id="Type">
                        <label for="limitType" class="col-sm-3 col-form-label">{Lang::T('Limit Type')}</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Time_Limit" name="limit_type" value="Time_Limit" {if $d['limit_type'] eq 'Time_Limit'} checked {/if}>
                                <label class="form-check-label" for="Time_Limit">{Lang::T('Time Limit')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Data_Limit" name="limit_type" value="Data_Limit" {if $d['limit_type'] eq 'Data_Limit'} checked {/if}>
                                <label class="form-check-label" for="Data_Limit">{Lang::T('Data Limit')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Both_Limit" name="limit_type" value="Both_Limit" {if $d['limit_type'] eq 'Both_Limit'} checked {/if}>
                                <label class="form-check-label" for="Both_Limit">{Lang::T('Both Limit')}</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3 row {if $d['typebp'] eq 'Unlimited' || ($d['time_limit']) eq '0'} d-none {/if}" id="TimeLimit">
                        <label for="time_limit" class="col-sm-3 col-form-label">{Lang::T('Time Limit')}</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="time_limit" name="time_limit" value="{$d['time_limit']}">
                        </div>
                        <div class="col-sm-6">
                            <select class="form-select" id="time_unit" name="time_unit">
                                <option value="Hrs" {if $d['time_unit'] eq 'Hrs'} selected {/if}>{Lang::T('Hrs')}</option>
                                <option value="Mins" {if $d['time_unit'] eq 'Mins'} selected {/if}>{Lang::T('Mins')}</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3 row {if $d['typebp'] eq 'Unlimited' || ($d['data_limit']) eq '0'} d-none {/if}" id="DataLimit">
                        <label for="data_limit" class="col-sm-3 col-form-label">{Lang::T('Data Limit')}</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="data_limit" name="data_limit" value="{$d['data_limit']}">
                        </div>
                        <div class="col-sm-6">
                            <select class="form-select" id="data_unit" name="data_unit">
                                <option value="MB" {if $d['data_unit'] eq 'MB'} selected {/if}>MBs</option>
                                <option value="GB" {if $d['data_unit'] eq 'GB'} selected {/if}>GBs</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="id_bw" class="col-sm-3 col-form-label"><a href="{$_url}bandwidth/add">{Lang::T('Bandwidth Name')}</a></label>
                        <div class="col-sm-9">
                            <select id="id_bw" name="id_bw" class="form-select">
                                {foreach $b as $bs}
                                    <option value="{$bs['id']}" {if $d['id_bw'] eq $bs['id']} selected {/if}>{$bs['name_bw']}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="price" class="col-sm-3 col-form-label">{Lang::T('Package Price')}</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <span class="input-group-text">{$_c['currency_code']}</span>
                                <input type="number" class="form-control" name="price" value="{$d['price']}" required>
                            </div>
                        </div>
                        {if $_c['enable_tax'] == 'yes'}
                            {if $_c['tax_rate'] == 'custom'}
                                <div class="col-sm-3">
                                    <small class="form-text text-muted">{number_format($_c['custom_tax_rate'], 2)} % {Lang::T('Tax Rates will be added')}</small>
                                </div>
                            {else}
                                <div class="col-sm-3">
                                    <small class="form-text text-muted">{number_format($_c['tax_rate'] * 100, 2)} % {Lang::T('Tax Rates will be added')}</small>
                                </div>
                            {/if}
                        {/if}
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="price_old" class="col-sm-3 col-form-label">{Lang::T('Price Before Discount')}</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <span class="input-group-text">{$_c['currency_code']}</span>
                                <input type="number" class="form-control" name="price_old" value="{$d['price_old']}">
                            </div>
                            <small class="form-text text-muted">{Lang::T('For Discount Rate, this is price before get discount, must be more expensive with real price')}</small>
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="sharedusers" class="col-sm-3 col-form-label">{Lang::T('Shared Users')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="How many devices can online in one Customer account">?</a>
                        </label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="sharedusers" name="sharedusers" value="{$d['shared_users']}">
                        </div>
                    </div>
                    
                    <div class="mb-3 row">
                        <label for="validity" class="col-sm-3 col-form-label">{Lang::T('Package Validity')}</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="validity" name="validity" value="{$d['validity']}">
                        </div>
                        <div class="col-sm-6">
                            <select class="form-select" id="validity_unit" name="validity_unit">
                                {if $d['prepaid'] == 'yes'}
                                    <option value="Mins" {if $d['validity_unit'] eq 'Mins'} selected {/if}>{Lang::T('Mins')}</option>
                                    <option value="Hrs" {if $d['validity_unit'] eq 'Hrs'} selected {/if}>{Lang::T('Hrs')}</option>
                                    <option value="Days" {if $d['validity_unit'] eq 'Days'} selected {/if}>{Lang::T('Days')}</option>
                                    <option value="Months" {if $d['validity_unit'] eq 'Months'} selected {/if}>{Lang::T('Months')}</option>
                                {else}
                                    <option value="Period" {if $d['validity_unit'] eq 'Period'} selected {/if}>{Lang::T('Period')}</option>
                                {/if}
                            </select>
                            <small class="form-text text-muted">{Lang::T('1 Period = 1 Month, Expires the 20th of each month')}</small>
                        </div>
                    </div>
                    
                    <div class="mb-3 row {if $d['prepaid'] == 'yes'} d-none {/if}" id="expired_date">
                        <label for="expired_date" class="col-sm-3 col-form-label">{Lang::T('Expired Date')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Expired will be this date every month">?</a>
                        </label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" name="expired_date" maxlength="2" value="{if $d['expired_date']}{$d['expired_date']}{else}20{/if}" min="1" max="28" step="1">
                        </div>
                    </div>
                    
                    <div id="routerChoose" class="{if $d['is_radius']}d-none{/if}">
                        <div class="mb-3 row">
                            <label for="routers" class="col-sm-3 col-form-label"><a href="{$_url}routers/add">{Lang::T('Router Name')}</a></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="routers" name="routers" value="{$d['routers']}" readonly>
                            </div>
                        </div>
                    </div>
                    
                    <h5 class="card-title">{Lang::T('Expired Action')} <small>{Lang::T('Optional')}</small></h5>
                    <div class="mb-3 row">
                        <label for="plan_expired" class="col-sm-3 col-form-label">{Lang::T('Expired Internet Package')}</label>
                        <div class="col-sm-9">
                            <select id="plan_expired" name="plan_expired" class="form-select">
                                <option value='0'>{Lang::T('Default - Remove Customer')}</option>
                                {foreach $exps as $exp}
                                    <option value="{$exp['id']}" {if $d['plan_expired'] eq $exp['id']} selected {/if}>{$exp['name_plan']}</option>
                                {/foreach}
                            </select>
                            <small class="form-text text-muted">{Lang::T('When Expired, customer will be move to selected internet package')}</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {if !$d['is_radius']}
            <div class="col-md-6">
                <div class="card mb-3">
                    <div class="card-header">{Lang::T('on-login / on-up')}</div>
                    <div class="card-body">
                        <textarea class="form-control" id="code" name="on_login" style="font-family: 'Courier New', Courier, monospace;" rows="15">{$d['on_login']}</textarea>
                    </div>
                </div>
                <div class="card mb-3">
                    <div class="card-header">{Lang::T('on-logout / on-down')}</div>
                    <div class="card-body">
                        <textarea class="form-control" id="code2" name="on_logout" style="font-family: 'Courier New', Courier, monospace;" rows="15">{$d['on_logout']}</textarea>
                    </div>
                </div>
            </div>
        {/if}
    </div>
    
    <div class="mb-3 row">
        <div class="col-sm-9 offset-sm-3">
            <button type="submit" class="btn btn-success">{Lang::T('Save Changes')}</button>
            <a href="{$_url}services/hotspot" class="btn btn-secondary">{Lang::T('Cancel')}</a>
        </div>
    </div>
</form>

<script>
    var preOpt = `<option value="Mins">{Lang::T('Mins')}</option>
    <option value="Hrs">{Lang::T('Hrs')}</option>
    <option value="Days">{Lang::T('Days')}</option>
    <option value="Months">{Lang::T('Months')}</option>`;
    var postOpt = `<option value="Period">{Lang::T('Period')}</option>`;
    function prePaid() {
        $("#validity_unit").html(preOpt);
        $('#expired_date').addClass('d-none');
    }

    function postPaid() {
        $("#validity_unit").html(postOpt);
        $("#expired_date").removeClass('d-none');
    }

    // jQuery should be included for this to work properly
    document.addEventListener("DOMContentLoaded", function(event) {
        if ($('input[name="prepaid"]:checked').val() === 'yes') {
            prePaid();
        } else {
            postPaid();
        }
    });
</script>

{if $_c['radius_enable'] && $d['is_radius']}
    {literal}
        <script>
            function isRadius(cek) {
                if (cek.checked) {
                    $("#routerChoose").addClass('d-none');
                    document.getElementById("routers").required = false;
                    document.getElementById("Limited").disabled = true;
                } else {
                    document.getElementById("Limited").disabled = false;
                    document.getElementById("routers").required = true;
                    $("#routerChoose").removeClass('d-none');
                }
            }
        </script>
    {/literal}
{/if}

<!-- Codemirror setup -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/codemirror.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/mode/perl/perl.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/codemirror.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/theme/abbott.min.css">

<script>
    var codeMirror = CodeMirror.fromTextArea(document.getElementById('code'), {
        lineNumbers: true,
        mode: 'text/x-perl',
    });
    var codeMirror2 = CodeMirror.fromTextArea(document.getElementById('code2'), {
        lineNumbers: true,
        mode: 'text/x-perl',
    });
</script>

{include file="sections/footer.tpl"}