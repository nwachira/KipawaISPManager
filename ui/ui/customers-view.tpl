{include file="sections/header.tpl"}

<div class="row">
    <div class="col-md-4">
        <div class="card text-center {if $d['status'] == 'Active'}border-primary{else}border-danger{/if}">
            
            <div class="card-body">
                <h5 class="card-title">{$d['fullname']}</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong>{Lang::T('Status')}</strong> <span class="badge {if $d['status'] != 'Active'}bg-danger{/if}">{Lang::T($d['status'])}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Username')}</strong> <span class="float-end">{$d['username']}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Phone Number')}</strong> <span class="float-end">{$d['phonenumber']}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Email')}</strong> <span class="float-end">{$d['email']}</span>
                    </li>
                    <li class="list-group-item">{Lang::nl2br($d['address'])}</li>
                    
                    {if in_array($_admin['user_type'],['SuperAdmin','Admin'])}
                        <li class="list-group-item">
                            <strong>{Lang::T('Password')}</strong>
                            <input type="password" value="{$d['password']}" class="form-control" style="text-align: right;" onmouseleave="this.type = 'password'" onmouseenter="this.type = 'text'" onclick="this.select()">
                        </li>
                    {/if}
                    {if $d['pppoe_username'] != ''}
                        <li class="list-group-item">
                            <strong>PPPOE {Lang::T('Username')}</strong> <span class="float-end">{$d['pppoe_username']}</span>
                        </li>
                    {/if}
                    {if $d['pppoe_password'] != '' && in_array($_admin['user_type'],['SuperAdmin','Admin'])}
                        <li class="list-group-item">
                            <strong>PPPOE {Lang::T('Password')}</strong>
                            <input type="password" value="{$d['pppoe_password']}" class="form-control" style="text-align: right;" onmouseleave="this.type = 'password'" onmouseenter="this.type = 'text'" onclick="this.select()">
                        </li>
                    {/if}
                    {if $d['pppoe_ip'] != ''}
                        <li class="list-group-item">
                            <strong>PPPOE Remote IP</strong> <span class="float-end">{$d['pppoe_ip']}</span>
                        </li>
                    {/if}
                    <!-- Customers Attributes -->
                    {if $customFields}
                        {foreach $customFields as $customField}
                            <li class="list-group-item">
                                <strong>{$customField.field_name}</strong> <span class="float-end">
                                    {if strpos($customField.field_value, ':0') === false}
                                        {$customField.field_value}
                                    {else}
                                        <strong>{Lang::T('Paid')}</strong>
                                    {/if}
                                </span>
                            </li>
                        {/foreach}
                    {/if}
                    <!-- End Attributes -->
                    <li class="list-group-item">
                        <strong>{Lang::T('Service Type')}</strong> <span class="float-end">{Lang::T($d['service_type'])}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Account Type')}</strong> <span class="float-end">{Lang::T($d['account_type'])}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Balance')}</strong> <span class="float-end">{Lang::moneyFormat($d['balance'])}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Auto Renewal')}</strong> <span class="float-end">{if $d['auto_renewal']}yes{else}no{/if}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Created On')}</strong> <span class="float-end">{Lang::dateTimeFormat($d['created_at'])}</span>
                    </li>
                    <li class="list-group-item">
                        <strong>{Lang::T('Last Login')}</strong> <span class="float-end">{Lang::dateTimeFormat($d['last_login'])}</span>
                    </li>
                    {if $d['coordinates']}
                        <li class="list-group-item">
                            <strong>{Lang::T('Coordinates')}</strong> <span class="float-end">
                                <i class="bi bi-geo-alt"></i> <a href="https://www.google.com/maps/dir//{$d['coordinates']}/" target="_blank">Get Directions</a>
                            </span>
                            <div id="map" style="height: 200px;"></div>
                        </li>
                    {/if}
                </ul>
                <div class="d-flex justify-content-between">
                    <a href="{$_url}customers/delete/{$d['id']}&token={$csrf_token}" class="btn btn-danger btn-sm" onclick="return ask(this, '{Lang::T('Delete')}?')">
                        <i class="fa fa-trash"></i> {Lang::T('Delete')}
                    </a>
                    <a href="{$_url}customers/edit/{$d['id']}&token={$csrf_token}" class="btn btn-warning btn-sm">
                        <i class="fa fa-edit"></i> {Lang::T('Edit')}
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-8">
        <div class="card">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link {if $v == 'order'}active{/if}" href="{$_url}customers/view/{$d['id']}/order">30 {Lang::T('Order History')}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {if $v == 'activation'}active{/if}" href="{$_url}customers/view/{$d['id']}/activation">30 {Lang::T('Activation History')}</a>
                    </li>
                </ul>
            </div>
            <div class="card-body table-responsive">
                <table class="table table-bordered table-striped">
                    {if Lang::arrayCount($activation)}
                        <thead>
                            <tr>
                                <th>{Lang::T('Invoice')}</th>
                                <th>{Lang::T('Username')}</th>
                                <th>{Lang::T('Plan Name')}</th>
                                <th>{Lang::T('Plan Price')}</th>
                                <th>{Lang::T('Type')}</th>
                                <th>{Lang::T('Created On')}</th>
                                <th>{Lang::T('Expires On')}</th>
                                <th>{Lang::T('Method')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $activation as $ds}
                                <tr>
                                    <td>{$ds['invoice']}</td>
                                    <td>{$ds['username']}</td>
                                    <td>{$ds['plan_name']}</td>
                                    <td>{Lang::moneyFormat($ds['price'])}</td>
                                    <td>{$ds['type']}</td>
                                    <td>{Lang::dateAndTimeFormat($ds['recharged_on'], $ds['recharged_time'])}</td>
                                    <td>{Lang::dateAndTimeFormat($ds['expiration'], $ds['time'])}</td>
                                    <td>{$ds['method']}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    {/if}
                    {if Lang::arrayCount($order)}
                        <thead>
                            <tr>
                                <th>{Lang::T('Plan Name')}</th>
                                <th>{Lang::T('Gateway')}</th>
                                <th>{Lang::T('Routers')}</th>
                                <th>{Lang::T('Type')}</th>
                                <th>{Lang::T('Plan Price')}</th>
                                <th>{Lang::T('Created On')}</th>
                                <th>{Lang::T('Expires On')}</th>
                                <th>{Lang::T('Date Done')}</th>
                                <th>{Lang::T('Method')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $order as $ds}
                                <tr>
                                    <td>{$ds['plan_name']}</td>
                                    <td>{$ds['gateway']}</td>
                                    <td>{$ds['routers']}</td>
                                    <td>{$ds['payment_channel']}</td>
                                    <td>{Lang::moneyFormat($ds['price'])}</td>
                                    <td>{Lang::dateTimeFormat($ds['created_date'])}</td>
                                    <td>{Lang::dateTimeFormat($ds['expired_date'])}</td>
                                    <td>{if $ds['status'] != 1}{Lang::dateTimeFormat($ds['paid_date'])}{/if}</td>
                                    <td>{if $ds['status'] == 1}{Lang::T('UNPAID')}
                                        {elseif $ds['status'] == 2}{Lang::T('PAID')}
                                        {else}Unknown{/if}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    {/if}
                </table>
            </div>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}
