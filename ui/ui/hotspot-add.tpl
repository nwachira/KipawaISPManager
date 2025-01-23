{include file="sections/header.tpl"}

<div class="row">
    <div class="col-12">
        <div class="card mb-3">
            <div class="card-header">{Lang::T('Add Service Package')}</div>
            <div class="card-body">
                <form class="form-horizontal" method="post" action="{$_url}services/add-post">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{Lang::T('Status')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Customer cannot buy disabled Package, but admin can recharge it, use it if you want only admin recharge it">?</a>
                        </label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="enabled" value="1" checked>
                                <label class="form-check-label">{Lang::T('Active')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="enabled" value="0">
                                <label class="form-check-label">{Lang::T('Not Active')}</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{Lang::T('Type')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Postpaid will have fix expired date">?</a>
                        </label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="prepaid" onclick="prePaid()" value="yes" checked>
                                <label class="form-check-label">{Lang::T('Prepaid')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="prepaid" onclick="postPaid()" value="no">
                                <label class="form-check-label">{Lang::T('Postpaid')}</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{Lang::T('Package Type')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="Personal Plan will only show to personal Customer, Business package will only show to Business Customer">?</a>
                        </label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="plan_type" value="Personal" checked>
                                <label class="form-check-label">{Lang::T('Personal')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="plan_type" value="Business">
                                <label class="form-check-label">{Lang::T('Business')}</label>
                            </div>
                        </div>
                    </div>
                    
                    {if $_c['radius_enable']}
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Radius
                                <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                    data-bs-trigger="focus" data-bs-container="body"
                                    data-bs-content="If you enable Radius, choose device to radius, except if you have custom device.">?</a>
                            </label>
                            <div class="col-sm-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="radius" onclick="isRadius(this)" value="1">
                                    <label class="form-check-label">{Lang::T('Radius Package')}</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <small class="form-text text-muted">{Lang::T('Cannot be change after saved')}</small>
                            </div>
                        </div>
                    {/if}

                    <div class="form-group row">
                        <label for="device" class="col-sm-2 col-form-label">{Lang::T('Device')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="This Device are the logic how KipawaIsp Communicate with Mikrotik or other Devices">?</a>
                        </label>
                        <div class="col-sm-6">
                            <select class="form-select" id="device" name="device">
                                {foreach $devices as $dev}
                                    <option value="{$dev}">{$dev}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label">{Lang::T('Package Name')}</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" name="name" maxlength="40">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{Lang::T('Package Type')}</label>
                        <div class="col-sm-10">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Unlimited" name="typebp" value="Unlimited" checked>
                                <label class="form-check-label" for="Unlimited">{Lang::T('Unlimited')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Limited" name="typebp" value="Limited">
                                <label class="form-check-label" for="Limited">{Lang::T('Limited')}</label>
                            </div>
                        </div>
                    </div>

                    <div style="display:none;" id="Type">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">{Lang::T('Limit Type')}</label>
                            <div class="col-sm-10">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="Time_Limit" name="limit_type" value="Time_Limit" checked>
                                    <label class="form-check-label" for="Time_Limit">{Lang::T('Time Limit')}</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="Data_Limit" name="limit_type" value="Data_Limit">
                                    <label class="form-check-label" for="Data_Limit">{Lang::T('Data Limit')}</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="Both_Limit" name="limit_type" value="Both_Limit">
                                    <label class="form-check-label" for="Both_Limit">{Lang::T('Both Limit')}</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="display:none;" id="TimeLimit">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">{Lang::T('Time Limit')}</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="time_limit" name="time_limit" value="0">
                            </div>
                            <div class="col-sm-2">
                                <select class="form-select" id="time_unit" name="time_unit">
                                    <option value="Hrs">{Lang::T('Hrs')}</option>
                                    <option value="Mins">{Lang::T('Mins')}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div style="display:none;" id="DataLimit">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">{Lang::T('Data Limit')}</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="data_limit" name="data_limit" value="0">
                            </div>
                            <div class="col-sm-2">
                                <select class="form-select" id="data_unit" name="data_unit">
                                    <option value="MB">MBs</option>
                                    <option value="GB">GBs</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="id_bw" class="col-sm-2 col-form-label"><a href="{$_url}bandwidth/add">{Lang::T('Bandwidth Name')}</a></label>
                        <div class="col-sm-6">
                            <select id="id_bw" name="id_bw" class="form-select">
                                <option value="">{Lang::T('Select Bandwidth')}...</option>
                                {foreach $d as $ds}
                                    <option value="{$ds['id']}">{$ds['name_bw']}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="price" class="col-sm-2 col-form-label">{Lang::T('Package Price')}</label>
                        <div class="col-sm-6">
                            <div class="input-group">
                                <span class="input-group-text">{$_c['currency_code']}</span>
                                <input type="number" class="form-control" name="price" required>
                            </div>
                        </div>
                        {if $_c['enable_tax'] == 'yes'}
                            {if $_c['tax_rate'] == 'custom'}
                                <div class="col-sm-4">
                                    <small class="form-text text-muted">{number_format($_c['custom_tax_rate'], 2)} % {Lang::T('Tax Rates will be added')}</small>
                                </div>
                            {else}
                                <div class="col-sm-4">
                                    <small class="form-text text-muted">{number_format($_c['tax_rate'] * 100, 2)} % {Lang::T('Tax Rates will be added')}</small>
                                </div>
                            {/if}
                        {/if}
                    </div>

                    <div class="form-group row">
                        <label for="sharedusers" class="col-sm-2 col-form-label">{Lang::T('Shared Users')}
                            <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
                                data-bs-trigger="focus" data-bs-container="body"
                                data-bs-content="How many devices can online in one Customer account">?</a>
                        </label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="sharedusers" name="sharedusers" value="1">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="validity" class="col-sm-2 col-form-label">{Lang::T('Package Validity')}</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="validity" name="validity">
                        </div>
                        <div class="col-sm-2">
                            <select class="form-select" id="validity_unit" name="validity_unit"></select>
                        </div>
                        <div class="col-sm-4">
                            <small class="form-text text-muted">{Lang::T('1 Period = 1 Month, Expires the 20th of each month')}</small>
                        </div>
                    </div>

                    <div class="form-group row d-none" id="expired_date">
    <label for="expired_date" class="col-sm-2 col-form-label">{Lang::T('Expired Date')}
        <a tabindex="0" class="btn btn-link btn-xs" role="button" data-bs-toggle="popover"
            data-bs-trigger="focus" data-bs-container="body"
            data-bs-content="Expired will be this date every month">?</a>
    </label>
    <div class="col-sm-6">
        <input type="number" class="form-control" name="expired_date" maxlength="2" value="20" min="1" max="28" step="1">
    </div>
</div>

                    <div id="routerChoose" class="">
                        <div class="form-group row">
                            <label for="routers" class="col-sm-2 col-form-label"><a href="{$_url}routers/add">{Lang::T('Router Name')}</a></label>
                            <div class="col-sm-6">
                                <select id="routers" name="routers" required class="form-select">
                                    <option value=''>{Lang::T('Select Routers')}</option>
                                    {foreach $r as $rs}
                                        <option value="{$rs['name']}">{$rs['name']}</option>
                                    {/foreach}
                                </select>
                                <small class="form-text text-muted">{Lang::T('Cannot be change after saved')}</small>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10 offset-sm-2">
                            <button type="submit" class="btn btn-success">{Lang::T('Save Changes')}</button>
                            <a href="{$_url}services/hotspot" class="btn btn-secondary">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    var preOpt = `<option value="Mins">{Lang::T('Mins')}</option>
    <option value="Hrs">{Lang::T('Hrs')}</option>
    <option value="Days">{Lang::T('Days')}</option>
    <option value="Months">{Lang::T('Months')}</option>`;
    var postOpt = `<option value="Period">{Lang::T('Period')}</option>`;
    function prePaid() {
        $("#validity_unit").html(preOpt);
        $('#expired_date').addClass('hidden');
    }

    function postPaid() {
        $("#validity_unit").html(postOpt);
        $("#expired_date").removeClass('hidden');
    }
    document.addEventListener("DOMContentLoaded", function(event) {
        prePaid()
    })
</script>

{if $_c['radius_enable']}
    {literal}
        <script>
            function isRadius(cek) {
                if (cek.checked) {
                    $("#routerChoose").addClass('hidden');
                    document.getElementById("routers").required = false;
                } else {
                    document.getElementById("routers").required = true;
                    $("#routerChoose").removeClass('hidden');
                }
            }
        </script>
    {/literal}
{/if}

{include file="sections/footer.tpl"}