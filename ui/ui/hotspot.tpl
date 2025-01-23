{include file="sections/header.tpl"}

<div class="row">
    <div class="col-12">
        <div class="card mb-3">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span>{Lang::T('Hotspot Plans')}</span>
                <div class="btn-group">
                    <a class="btn btn-primary btn-sm" title="save" href="{$_url}services/sync/hotspot"
                        onclick="return ask(this, 'This will sync/send hotspot package to Mikrotik?')">
                        <span class="bi bi-arrow-repeat" aria-hidden="true"></span> sync
                    </a>
                </div>
            </div>
            <form id="site-search" method="post" action="{$_url}services/hotspot/">
                <div class="card-body">
                   <div class="row g-2 align-items-center" style="padding: 5px;">
    <div class="col-lg-8 col-md-6">
        <div class="input-group">
        <button class="btn btn-danger" type="button" title="Clear Search Query"
                onclick="location.href='{$_url}services/hotspot/'">
                <span class="bi bi-x-circle"></span>
            </button>
            <input type="text" name="name" class="form-control" placeholder="{Lang::T('Search by Name')}...">
            
        </div>
    </div>

    <div class="col-lg-4 col-md-6 d-flex justify-content-end">
        <button class="btn btn-success me-2" type="submit">
            <span class="bi bi-search"></span>
        </button>
        <a href="{$_url}services/add" class="btn btn-primary" title="{Lang::T('New Service Package')}">
            <i class="bi bi-plus-lg"></i>
        </a>
    </div>
</div>

                </div>
            </form>
            <div class="table-responsive">
                <div style="margin-left: 5px; margin-right: 5px;">
                    <table class="table table-bordered table-striped table-sm">
                        <thead>
                            <tr>
                                <th></th>
                                <th colspan="5" class="text-center">{Lang::T('Internet Package')}</th>
                                <th colspan="2" class="text-center" style="background-color: #f6f4f4;">
                                    {Lang::T('Limit')}</th>
                                <th colspan="2"></th>
                                <th colspan="2" class="text-center" style="background-color: #f3f1ac;">
                                    {Lang::T('Expired')}</th>
                                <th colspan="3"></th>
                            </tr>
                            <tr>
                                <th>{Lang::T('Name')}</th>
                                <th>{Lang::T('Type')}</th>
                                <th><a href="{$_url}bandwidth/list">Bandwidth</a></th>
                                <th>{Lang::T('Category')}</th>
                                <th>{Lang::T('Price')}</th>
                                <th>{Lang::T('Validity')}</th>
                                <th style="background-color: #f6f4f4;">{Lang::T('Time')}</th>
                                <th style="background-color: #f6f4f4;">{Lang::T('Data')}</th>
                                <th><a href="{$_url}routers/list">{Lang::T('Location')}</a></th>
                                <th>{Lang::T('Device')}</th>
                                <th style="background-color: #f3f1ac;">{Lang::T('Internet Package')}</th>
                                <th style="background-color: #f3f1ac;">{Lang::T('Date')}</th>
                                <th>{Lang::T('ID')}</th>
                                <th>{Lang::T('Manage')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $d as $ds}
                                <tr {if $ds['enabled'] !=1}class="table-danger" title="disabled" {elseif $ds['prepaid'] !='yes'}class="table-warning" title="Postpaid" {/if}>
                                    <td>{$ds['name_plan']}</td>
                                    <td>{if $ds['prepaid'] == no}<b>Postpaid</b>{else}Prepaid{/if} {$ds['plan_type']}</td>
                                    <td>{$ds['name_bw']}</td>
                                    <td>{$ds['typebp']}</td>
                                    <td>{Lang::moneyFormat($ds['price'])}
                                        {if !empty($ds['price_old'])}
                                            <sup style="text-decoration: line-through; color: red">{Lang::moneyFormat($ds['price_old'])}</sup>
                                        {/if}
                                    </td>
                                    <td>{$ds['validity']} {$ds['validity_unit']}</td>
                                    <td>{$ds['time_limit']} {$ds['time_unit']}</td>
                                    <td>{$ds['data_limit']} {$ds['data_unit']}</td>
                                    <td>
                                        {if $ds['is_radius']}
                                            <span class="badge bg-primary">RADIUS</span>
                                        {else}
                                            {if $ds['routers']!=''}
                                                <a href="{$_url}routers/edit/0&name={$ds['routers']}">{$ds['routers']}</a>
                                            {/if}
                                        {/if}
                                    </td>
                                    <td>{$ds['device']}</td>
                                    <td>{if $ds['plan_expired']}<a href="{$_url}services/edit/{$ds['plan_expired']}">{Lang::T('Yes')}</a>{else}{Lang::T('No')}{/if}</td>
                                    <td>{if $ds['prepaid'] == no}{$ds['expired_date']}{/if}</td>
                                    <td>{$ds['id']}</td>
                                    <td>
                                        <a href="{$_url}services/edit/{$ds['id']}" class="btn btn-info btn-sm">{Lang::T('Edit')}</a>
                                        <a href="{$_url}services/delete/{$ds['id']}" id="{$ds['id']}"
                                            onclick="return ask(this, '{Lang::T('Delete')}?')" class="btn btn-danger btn-sm">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer">
                {include file="pagination.tpl"}
                <div class="alert alert-info" role="alert">
                    <h4 class="alert-heading">{Lang::T('Create expired Internet Package')}</h4>
                    <p>{Lang::T('When customer expired, you can move it to Expired Internet Package')}</p>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}