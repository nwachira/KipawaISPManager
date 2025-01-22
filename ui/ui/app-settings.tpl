{include file="sections/header.tpl"}

<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <!-- Navbar or Header -->
            <ul class="nav nav-pills" id="formTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="form1-tab" data-bs-toggle="pill" href="#form1" role="tab" aria-controls="form1" aria-selected="true">{Lang::T('General Settings')}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="form2-tab" data-bs-toggle="pill" href="#form2" role="tab" aria-controls="form2" aria-selected="false"> {Lang::T('Localisation')}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="form3-tab" data-bs-toggle="pill" href="#form3" role="tab" aria-controls="form3" aria-selected="false">{Lang::T('Admin User Settings')}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="form4-tab" data-bs-toggle="pill" href="#form4" role="tab" aria-controls="form4" aria-selected="false">{Lang::T('Advance Settings')}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="form5-tab" data-bs-toggle="pill" href="#form5" role="tab" aria-controls="form5" aria-selected="false">{Lang::T('Hotspot Settings')}</a>
                </li>
            </ul>

            <!-- Tab content -->
            <div class="tab-content" id="formTabsContent">
                <div class="tab-pane fade show active" id="form1" role="tabpanel" aria-labelledby="form1-tab">
                    <!-- Form 1 -->
                    <div class="card mt-3">
                        <div class="card-body">
                            <form class="form-horizontal" method="post" role="form" action="{$_url}settings/app-post" enctype="multipart/form-data">
                                <input type="hidden" name="csrf_token" value="{$csrf_token}">
                                <div class="accordion" id="accordionSettings">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingGeneral">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGeneral" aria-expanded="true" aria-controls="collapseGeneral">
                                                {Lang::T('General')}
                                            </button>
                                        </h2>
                                        <div id="collapseGeneral" class="accordion-collapse collapse show" aria-labelledby="headingGeneral" data-bs-parent="#accordionSettings">
                                            <div class="accordion-body">
                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Application Name / Company Name')}</label>
                                                    <div class="col-md-5">
                                                        <input type="text" required class="form-control" id="CompanyName" name="CompanyName" value="{$_c['CompanyName']}">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted">{Lang::T('This Name will be shown on the Title')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Company Logo')}</label>
                                                    <div class="col-md-5">
                                                        <input type="file" class="form-control" id="logo" name="logo" accept="image/*">
                                                        <small class="form-text text-muted">{Lang::T('For PDF Reports | Best size 1078 x 200 | uploaded image will be autosize')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Company Footer')}</label>
                                                    <div class="col-md-5">
                                                        <input type="text" required class="form-control" id="CompanyFooter" name="CompanyFooter" value="{$_c['CompanyFooter']}">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted">{Lang::T('Will show below user pages')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Address')}</label>
                                                    <div class="col-md-5">
                                                        <textarea class="form-control" id="address" name="address" rows="3">{Lang::htmlspecialchars($_c['address'])}</textarea>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted">{Lang::T('You can use html tag')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Phone Number')}</label>
                                                    <div class="col-md-5">
                                                        <input type="text" class="form-control" id="phone" name="phone" value="{$_c['phone']}">
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Invoice Footer')}</label>
                                                    <div class="col-md-5">
                                                        <textarea class="form-control" id="note" name="note" rows="3">{Lang::htmlspecialchars($_c['note'])}</textarea>
                                                        <small class="form-text text-muted">{Lang::T('You can use html tag')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label"><i class="bi bi-printer"></i> {Lang::T('Print Max Char')}</label>
                                                    <div class="col-md-5">
                                                        <input type="number" required class="form-control" id="printer_cols" name="printer_cols" placeholder="37" value="{$_c['printer_cols']}">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted">{Lang::T('For invoice print using Thermal Printer')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Theme')}</label>
                                                    <div class="col-md-5">
                                                        <select name="theme" id="theme" class="form-control">
                                                            <option value="default" {if $_c['theme'] eq 'default'}selected{/if}>{Lang::T('Default')}</option>
                                                            {foreach $themes as $theme}
                                                                <option value="{$theme}" {if $_c['theme'] eq $theme}selected{/if}>{Lang::ucWords($theme)}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted"><a href="https://github.com/hotspotbilling/phpnuxbill/wiki/Themes" target="_blank">{Lang::T('Theme Info')}</a></small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Recharge Using')}</label>
                                                    <div class="col-md-5">
                                                        <input type="text" name="payment_usings" class="form-control" value="{$_c['payment_usings']}" placeholder="{Lang::T('Cash')}, {Lang::T('Bank Transfer')}">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted">{Lang::T('This is used for admin to select payment in recharge, using comma for every new option')}</small>
                                                    </div>
                                                </div>

                                                <div class="mb-3 row">
                                                    <label class="col-md-3 col-form-label">{Lang::T('Income reset date')}</label>
                                                    <div class="col-md-5">
                                                        <input type="number" required class="form-control" id="reset_day" name="reset_day" placeholder="20" min="1" max="28" value="{$_c['reset_day']}">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <small class="form-text text-muted">{Lang::T('Income will reset on this day every month')}</small>
                                                    </div>
                                                </div>

                                                <button class="btn btn-success w-100" name="general" type="submit">{Lang::T('Save Changes')}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <form method="post" role="form" action="{$_url}settings/app-post" enctype="multipart/form-data">
                                <input type="hidden" name="csrf_token" value="{$csrf_token}">
                                <div class="accordion" id="settingsAccordion">
                                    <!-- Hide Dashboard Content Section -->
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingHideDashboardContent">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseHideDashboardContent" aria-expanded="false" aria-controls="collapseHideDashboardContent">
                                                {Lang::T('Hide Dashboard Content')}
                                            </button>
                                        </h2>
                                        <div id="collapseHideDashboardContent" class="accordion-collapse collapse" aria-labelledby="headingHideDashboardContent" data-bs-parent="#settingsAccordion">
                                            <div class="accordion-body">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_mrc" value="yes" {if $_c['hide_mrc'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('Monthly Registered Customers')}</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_tms" value="yes" {if $_c['hide_tms'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('Total Monthly Sales')}</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_aui" value="yes" {if $_c['hide_aui'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('All Users Insights')}</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_al" value="yes" {if $_c['hide_al'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('Activity Log')}</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_uet" value="yes" {if $_c['hide_uet'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('User Expired, Today')}</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_vs" value="yes" {if $_c['hide_vs'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('Vouchers Stock')}</label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" name="hide_pg" value="yes" {if $_c['hide_pg'] eq 'yes'}checked{/if}>
                                                    <label class="form-check-label">{Lang::T('Payment Gateway')}</label>
                                                </div>
                                                <button class="btn btn-primary mt-3" type="submit">{Lang::T('Save Changes')}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

<form method="post" action="{$_url}settings/app-post" enctype="multipart/form-data">
    <input type="hidden" name="csrf_token" value="{$csrf_token}">
    <div class="card shadow-sm mb-4">
        <div class="card-header">
            <h5 class="mb-0">
                <button class="btn btn-link" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFreeRadius" aria-expanded="false" aria-controls="collapseFreeRadius">
                    FreeRadius
                </button>
            </h5>
        </div>
        <div id="collapseFreeRadius" class="collapse" aria-labelledby="FreeRadius" data-bs-parent="#accordion">
            <div class="card-body">
                <div class="mb-3 row">
                    <label class="col-md-3 col-form-label">{Lang::T('Enable Radius')}</label>
                    <div class="col-md-5">
                        <select name="radius_enable" id="radius_enable" class="form-select">
                            <option value="0">{Lang::T('No')}</option>
                            <option value="1" {if $_c['radius_enable']}selected="selected"{/if}>{Lang::T('Yes')}</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <small class="form-text text-muted">
                            <a href="https://github.com/hotspotbilling/phpnuxbill/wiki/FreeRadius" target="_blank">{Lang::T('Radius Instructions')}</a>
                        </small>
                    </div>
                </div>
                <button class="btn btn-success btn-block" type="submit">{Lang::T('Save Changes')}</button>
            </div>
        </div>
    </div>
</form>



                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="form2" role="tabpanel" aria-labelledby="form2-tab">
                    <!-- Form 2 -->
                    <div class="card mt-3">
                        <div class="card-body">

                         <form class="form-horizontal" method="post" role="form" action="{$_url}settings/localisation-post">
                    <input type="hidden" name="csrf_token" value="{$csrf_token}">
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Timezone')}</label>
                        <div class="col-md-6">
                            <select name="tzone" id="tzone" class="form-control">
                                {foreach $tlist as $value => $label}
                                    <option value="{$value}" {if $_c['timezone'] eq $value}selected="selected" {/if}>
                                        {$label}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Date Format')}</label>
                        <div class="col-md-6">
                            <select class="form-control" name="date_format" id="date_format">
                                <option value="d/m/Y" {if $_c['date_format'] eq 'd/m/Y'} selected="selected" {/if}>
                                    {date('d/m/Y')}</option>
                                <option value="d.m.Y" {if $_c['date_format'] eq 'd.m.Y'} selected="selected" {/if}>
                                    {date('d.m.Y')}</option>
                                <option value="d-m-Y" {if $_c['date_format'] eq 'd-m-Y'} selected="selected" {/if}>
                                    {date('d-m-Y')}</option>
                                <option value="m/d/Y" {if $_c['date_format'] eq 'm/d/Y'} selected="selected" {/if}>
                                    {date('m/d/Y')}</option>
                                <option value="Y/m/d" {if $_c['date_format'] eq 'Y/m/d'} selected="selected" {/if}>
                                    {date('Y/m/d')}</option>
                                <option value="Y-m-d" {if $_c['date_format'] eq 'Y-m-d'} selected="selected" {/if}>
                                    {date('Y-m-d')}</option>
                                <option value="M d Y" {if $_c['date_format'] eq 'M d Y'} selected="selected" {/if}>
                                    {date('M d Y')}</option>
                                <option value="d M Y" {if $_c['date_format'] eq 'd M Y'} selected="selected" {/if}>
                                    {date('d M Y')}</option>
                                <option value="jS M y" {if $_c['date_format'] eq 'jS M y'} selected="selected" {/if}>
                                    {date('jS M y')}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Default Language')}</label>
                        <div class="col-md-6">
                            <select class="form-control" name="lan" id="lan">
                                {foreach $lani as $lanis}
                                    <option value="{$lanis@key}" {if $_c['language'] eq $lanis@key} selected="selected" {/if}>
                                        {$lanis@key}
                                    </option>
                                {/foreach}
                                <option disabled>_________</option>
                                {foreach $lan as $lans}
                                    <option value="{$lans@key}" {if $_c['language'] eq $lans@key} selected="selected" {/if}>
                                        {$lans@key}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-md-4 help-block">
                            <a href="{$_url}settings/language">{Lang::T('Language Editor')}</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Decimal Point')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="dec_point" name="dec_point"
                                value="{$_c['dec_point']}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Thousands Separator')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="thousands_sep" name="thousands_sep"
                                value="{$_c['thousands_sep']}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Currency Code')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="currency_code" name="currency_code"
                                value="{$_c['currency_code']}">
                        </div>
                        <span
                            class="help-block col-md-4">{Lang::T('Keep it blank if you do not want to show currency code')}</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Country Code Phone')}</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">+</span>
                                <input type="text" class="form-control" id="country_code_phone" placeholder="62"
                                    name="country_code_phone" value="{$_c['country_code_phone']}">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Radius Package')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="radius_plan" name="radius_plan"
                                value="{if $_c['radius_plan']==''}Radius Plan{else}{$_c['radius_plan']}{/if}">
                        </div>
                        <span class="help-block col-md-4">{Lang::T('Change title in user Plan order')}</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Hotspot Package')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="hotspot_plan" name="hotspot_plan"
                                value="{if $_c['hotspot_plan']==''}Hotspot Plan{else}{$_c['hotspot_plan']}{/if}">
                        </div>
                        <span class="help-block col-md-4">{Lang::T('Change title in user Plan order')}</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('PPPOE Package')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="pppoe_plan" name="pppoe_plan"
                                value="{if $_c['pppoe_plan']==''}PPPOE Plan{else}{$_c['pppoe_plan']}{/if}">
                        </div>
                        <span class="help-block col-md-4">{Lang::T('Change title in user Plan order')}</span>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('VPN Package')}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="vpn_plan" name="vpn_plan"
                                value="{if $_c['vpn_plan']==''}VPN Plan{else}{$_c['vpn_plan']}{/if}">
                        </div>
                        <span class="help-block col-md-4">{Lang::T('Change title in user Plan order')}</span>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button class="btn btn-primary"
                                type="submit">{Lang::T('Save Changes')}</button>
                        </div>
                    </div>
                </form>
                            
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="form5" role="tabpanel" aria-labelledby="form5-tab">
                    <!-- Form 3 -->

                    <div class="card mt-3">
                       
                        <div class="card-body">
                           <form method="post">
                <div class="container mt-4">
                    <div class="row justify-content-center">
                     <div class="col-md-12">
                <!-- Panel -->
               
               <a href="{$_url}services/hotspot" class="btn btn-info btn-xs">{Lang::T('Hotspot settings')}</a>
               <a href="{$_url}bandwidth/list" class="btn btn-info btn-xs">{Lang::T('Bandwith settings')}</a>
               <a href="{$_url}services/pppoe" class="btn btn-info btn-xs">{Lang::T('PPPOE settings')}</a>


                </div>
                    </div>
                     </div>
                </form>

                        </div>
                    </div>
                </div>

   <div class="tab-pane fade" id="form3" role="tabpanel" aria-labelledby="form3-tab">
                    <!-- Form 3 -->

                    <div class="card mt-3">
                       
                        <div class="card-body">
                           <form method="post">
                <div class="container mt-4">
                    <div class="row justify-content-center">
                     <div class="col-md-12">
                <!-- Panel -->
               
               <a href="{$_url}settings/users" class="btn btn-info btn-xs">{Lang::T('Admin User Settings')}</a>
               

            </div>
                    </div>
                     </div>
                </form>

                        </div>
                    </div>
                </div>
        
            </div>



              <div class="tab-pane fade" id="form4" role="tabpanel" aria-labelledby="form4-tab">
                    <!-- Form 3 -->

                    <div class="card mt-3">
                       
                        <div class="card-body">
                           <form method="post">
    <div class="container mt-4">
        <div class="row justify-content-center">
          
               
               <a href="{$_url}plugin/hotspot_settings" class="btn btn-info btn-xs">{Lang::T('Edit & Download Hotspot Settings')}</a>

                
               <a href="{$_url}plugin/whatsappGateway_config" class="btn btn-info btn-xs">{Lang::T('Whatsapp Gateway')}</a>



           
        </div>
    </div>
</form>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>
</div>


<script>
    function testWa() {
        var target = prompt("Phone number\nSave First before Test", "");
        if (target != null) {
            window.location.href = '{$_url}settings/app&testWa=' + target;
        }
    }

    function testSms() {
        var target = prompt("Phone number\nSave First before Test", "");
        if (target != null) {
            window.location.href = '{$_url}settings/app&testSms=' + target;
        }
    }


    function testEmail() {
        var target = prompt("Email\nSave First before Test", "");
        if (target != null) {
            window.location.href = '{$_url}settings/app&testEmail=' + target;
        }
    }

    function testTg() {
        window.location.href = '{$_url}settings/app&testTg=test';
    }
</script>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        var sectionTimeoutCheckbox = document.getElementById('enable_session_timeout');
        var timeoutDurationInput = document.getElementById('timeout_duration_input');
        var timeoutDurationField = document.getElementById('session_timeout_duration');

        if (sectionTimeoutCheckbox.checked) {
            timeoutDurationInput.style.display = 'block';
            timeoutDurationField.required = true;
        }

        sectionTimeoutCheckbox.addEventListener('change', function() {
            if (this.checked) {
                timeoutDurationInput.style.display = 'block';
                timeoutDurationField.required = true;
            } else {
                timeoutDurationInput.style.display = 'none';
                timeoutDurationField.required = false;
            }
        });

        document.querySelector('form').addEventListener('submit', function(event) {
            if (sectionTimeoutCheckbox.checked && (!timeoutDurationField.value || isNaN(
                    timeoutDurationField.value))) {
                event.preventDefault();
                alert('Please enter a valid session timeout duration.');
                timeoutDurationField.focus();
            }
        });
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Function to toggle visibility of custom tax rate input field
        function toggleCustomTaxRate() {
            var taxRateSelect = document.getElementById("tax_rate");
            var customTaxRateInput = document.getElementById("customTaxRate");

            if (taxRateSelect.value === "custom") {
                customTaxRateInput.style.display = "block";
            } else {
                customTaxRateInput.style.display = "none";
            }
        }

        // Call the function when the page loads
        toggleCustomTaxRate();

        // Call the function whenever the tax rate dropdown value changes
        document.getElementById("tax_rate").addEventListener("change", toggleCustomTaxRate);
    });
</script>
<script>
    document.getElementById('login_page_type').addEventListener('change', function() {
        var selectedValue = this.value;
        var customFields = document.getElementById('customFields');

        if (selectedValue === 'custom') {
            customFields.style.display = 'block';
        } else {
            customFields.style.display = 'none';
        }
    });
    document.getElementById('login_page_type').dispatchEvent(new Event('change'));
</script>
{include file="sections/footer.tpl"}

