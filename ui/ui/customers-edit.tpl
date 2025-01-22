{include file="sections/header.tpl"}
<style>
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        display: inline-block;
        padding: 5px 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        background-color: #fff;
        color: #333;
        cursor: pointer;
    }

    .card {
        margin: 50px 10px;
        display: flex;
        flex-direction: column;
    }

    .card-body {
        width: 100%;
        max-width: 600px;
    }

    #form-left, #form-right {
        width: 48%; /* Adjust width to fit side by side */
        float: left;
        margin-right: 4%; /* Space between forms */
    }

    #form-right {
        margin-right: 0; /* No right margin for the right form */
    }

    /* Clear floats after the columns */
    .row::after {
        content: "";
        display: table;
        clear: both;
    }

    /* Adjustments for form elements */
    .form-group {
        margin-bottom: 10px;
    }

    .form-control, .form-select {
        width: 100%;
    }
</style>
<form class="form-horizontal" enctype="multipart/form-data" method="post" role="form" action="{$_url}customers/edit-post" id="form-left">
    <input type="hidden" name="csrf_token" value="{$csrf_token}">
    <div class="card mb-3 {if $d['status']=='Active'}border-primary{else}border-danger{/if}">
        <div class="card-header">{Lang::T('Edit Contact')}</div>
        <div class="card-body">
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Username')}</label>
                <div class="col-md-9">
                    <div class="input-group">
                        {if $_c['country_code_phone']!= ''}
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-telephone"></i></span>
                        {else}
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person"></i></span>
                        {/if}
                        <input type="text" class="form-control" name="username" value="{$d['username']}" required placeholder="{if $_c['country_code_phone']!= ''}{$_c['country_code_phone']} {Lang::T('Phone Number')}{else}{Lang::T('Username')}{/if}">
                    </div>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Full Name')}</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="fullname" name="fullname" value="{$d['fullname']}">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Email')}</label>
                <div class="col-md-9">
                    <input type="email" class="form-control" id="email" name="email" value="{$d['email']}">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Phone Number')}</label>
                <div class="col-md-9">
                    <div class="input-group">
                        {if $_c['country_code_phone']!= ''}
                            <span class="input-group-text" id="basic-addon1">+</span>
                        {else}
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-telephone"></i></span>
                        {/if}
                        <input type="text" class="form-control" name="phonenumber" value="{$d['phonenumber']}" placeholder="{if $_c['country_code_phone']!= ''}{$_c['country_code_phone']}{/if} {Lang::T('Phone Number')}">
                    </div>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Password')}</label>
                <div class="col-md-9">
                    <input type="password" autocomplete="off" class="form-control" id="password" name="password" onmouseleave="this.type = 'password'" onmouseenter="this.type = 'text'" value="{$d['password']}">
                    <span class="form-text text-muted">{Lang::T('Keep Blank to do not change Password')}</span>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Address')}</label>
                <div class="col-md-9">
                    <textarea name="address" id="address" class="form-control">{$d['address']}</textarea>
                </div>
            </div>
        </div>
    </div>
</form>

<form class="form-horizontal" enctype="multipart/form-data" method="post" role="form" action="{$_url}customers/edit-post" id="form-right">
    <input type="hidden" name="csrf_token" value="{$csrf_token}">
    <div class="card mb-3 {if $d['status']=='Active'}border-primary{else}border-danger{/if}">
        <div class="card-header">{Lang::T('Edit Contact')}</div>
        <div class="card-body">
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Service Type')}</label>
                <div class="col-md-9">
                    <select class="form-select" id="service_type" name="service_type">
                        <option value="Hotspot" {if $d['service_type'] eq 'Hotspot' }selected{/if}>Hotspot</option>
                        <option value="PPPoE" {if $d['service_type'] eq 'PPPoE' }selected{/if}>PPPoE</option>
                        <option value="VPN" {if $d['service_type'] eq 'VPN' }selected{/if}>VPN</option>
                        <option value="Others" {if $d['service_type'] eq 'Others' }selected{/if}>Others</option>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Account Type')}</label>
                <div class="col-md-9">
                    <select class="form-select" id="account_type" name="account_type">
                        <option value="Personal" {if $d['account_type'] eq 'Personal' }selected{/if}>Personal</option>
                        <option value="Business" {if $d['account_type'] eq 'Business' }selected{/if}>Business</option>
                    </select>
                </div>
            </div>
            
        </div>
        <div class="card-header">PPPOE</div>
        <div class="card-body">
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Username')} <span class="badge bg-danger" id="warning_username"></span></label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="pppoe_username" name="pppoe_username" onkeyup="checkUsername(this, {$d['id']})" value="{$d['pppoe_username']}">
                    <span class="form-text text-muted">{Lang::T('Not Working with Freeradius Mysql')}</span>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Password')}</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="pppoe_password" name="pppoe_password" value="{$d['pppoe_password']}" onmouseleave="this.type = 'password'" onmouseenter="this.type = 'text'">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">Remote IP <span class="badge bg-danger" id="warning_ip"></span></label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="pppoe_ip" name="pppoe_ip" onkeyup="checkIP(this, {$d['id']})" value="{$d['pppoe_ip']}">
                    <span class="form-text text-muted">{Lang::T('Not Working with Freeradius Mysql')}</span>
                </div>
            </div>
            
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Username')} <span class="badge bg-danger" id="warning_username"></span></label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="pppoe_username" name="pppoe_username" onkeyup="checkUsername(this, {$d['id']})" value="{$d['pppoe_username']}">
                    <span class="form-text text-muted">{Lang::T('Not Working with Freeradius Mysql')}</span>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('Password')}</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="pppoe_password" name="pppoe_password" value="{$d['pppoe_password']}" onmouseleave="this.type = 'password'" onmouseenter="this.type = 'text'">
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">Remote IP <span class="badge bg-danger" id="warning_ip"></span></label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="pppoe_ip" name="pppoe_ip" onkeyup="checkIP(this, {$d['id']})" value="{$d['pppoe_ip']}">
                    <span class="form-text text-muted">{Lang::T('Not Working with Freeradius Mysql')}</span>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-md-3 col-form-label">{Lang::T('NAS IP')}</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" name="pppoe_nas_ip" value="{$d['pppoe_nas_ip']}">
                </div>
            </div>
            <div class="d-flex gap-2 mt-3">
                <button type="submit" class="btn btn-primary">{Lang::T('Save Changes')}</button>
                <a href="{$_url}customers" class="btn btn-secondary">{Lang::T('Cancel')}</a>
            </div>
        </div>
    </div>
</form>

<tbody>
    {foreach $d as $ds}
        <tr {if $ds['status'] != 'Active'}class="table-danger" {/if}>
            <td onclick="window.location.href = '{$_url}customers/view/{$ds['id']}'"
                style="cursor:pointer;">{$ds['username']}</td>
            <td>{$ds['service_type']}</td>
            <td>{Lang::T($ds['status'])}</td>
            <td align="center">
                <a href="{$_url}customers/view/{$ds['id']}" id="{$ds['id']}"
                    class="btn btn-success btn-sm">{Lang::T('View')}</a>
                <a href="{$_url}customers/edit/{$ds['id']}&token={$csrf_token}" id="{$ds['id']}"
                    class="btn btn-info btn-sm">{Lang::T('Edit')}</a>
                <a href="{$_url}customers/sync/{$ds['id']}&token={$csrf_token}" id="{$ds['id']}"
                    class="btn btn-success btn-sm">{Lang::T('Sync')}</a>
                <a href="{$_url}plan/recharge/{$ds['id']}&token={$csrf_token}" id="{$ds['id']}"
                    class="btn btn-primary btn-sm">{Lang::T('Recharge')}</a>
            </td>
        </tr>
    {/foreach}
</tbody>

</form>

{include file="sections/footer.tpl"}
{literal}
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            var customFieldsContainer = document.getElementById('custom-fields-container');
            var addCustomFieldButton = document.getElementById('add-custom-field');

            addCustomFieldButton.addEventListener('click', function() {
                var fieldIndex = customFieldsContainer.children.length;
                var newField = document.createElement('div');
                newField.className = 'form-group';
                newField.innerHTML = `
                <div class="col-md-4">
                    <input type="text" class="form-control" name="custom_field_name[]" placeholder="Name">
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" name="custom_field_value[]" placeholder="Value">
                </div>
                <div class="col-md-2">
                    <button type="button" class="remove-custom-field btn btn-danger btn-sm">-</button>
                </div>
            `;
                customFieldsContainer.appendChild(newField);
            });

            customFieldsContainer.addEventListener('click', function(event) {
                if (event.target.classList.contains('remove-custom-field')) {
                    var fieldContainer = event.target.parentNode.parentNode;
                    fieldContainer.parentNode.removeChild(fieldContainer);
                }
            });
        });
    </script>

    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
    <script>
        function getLocation() {
            if (window.location.protocol == "https:" && navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                setupMap(51.505, -0.09);
            }
        }

        function showPosition(position) {
            setupMap(position.coords.latitude, position.coords.longitude);
        }

        function setupMap(lat, lon) {
            var map = L.map('map').setView([lat, lon], 13);
            L.tileLayer('https://{s}.basemaps.cartocdn.com/rastertiles/light_all/{z}/{x}/{y}.png', {
            attribution:
                '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>',
                subdomains: 'abcd',
                maxZoom: 20
        }).addTo(map);
        var marker = L.marker([lat, lon]).addTo(map);
        map.on('click', function(e) {
            var coord = e.latlng;
            var lat = coord.lat;
            var lng = coord.lng;
            var newLatLng = new L.LatLng(lat, lng);
            marker.setLatLng(newLatLng);
            $('#coordinates').val(lat + ',' + lng);
        });
        }
        window.onload = function() {
        {/literal}
        {if $d['coordinates']}
            setupMap({$d['coordinates']});
        {else}
            getLocation();
        {/if}
        {literal}
        }
    </script>
{/literal}


{include file="sections/footer.tpl"}