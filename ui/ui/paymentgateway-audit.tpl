{include file="sections/header.tpl"}

<div class="panel panel-hovered mb-4 shadow-sm">
    <div class="panel-heading bg-primary text-white p-3">
        <h5 class="panel-title">{ucwords($pg)}</h5>
    </div>
    <div class="panel-body">
        <form id="site-search" method="post" action="{$_url}paymentgateway/audit/{$pg}">
            <div class="input-group mb-3">
                <input type="text" name="q" class="form-control" placeholder="{Lang::T('Search')}..." value="{$q}">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-outline-success">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <div class="table-responsive">
            <table class="table table-hover table-striped table-bordered table-sm">
                <thead class="thead-dark">
                    <tr>
                        <th>{Lang::T('TRX ID')}</th>
                        <th>{Lang::T('PG ID')}</th>
                        <th>{Lang::T('Username')}</th>
                        <th>{Lang::T('Plan Name')}</th>
                        <th>{Lang::T('Routers')}</th>
                        <th>{Lang::T('Price')}</th>
                        <th>{Lang::T('Payment Link')}</th>
                        <th>{Lang::T('Channel')}</th>
                        <th>{Lang::T('Created')}</th>
                        <th>{Lang::T('Expired')}</th>
                        <th>{Lang::T('Paid')}</th>
                        <th>{Lang::T('Invoice')}</th>
                        <th>{Lang::T('Status')}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $pgs as $pg}
                        <tr class="{if $pg['status'] == 1}bg-warning{elseif $pg['status'] == 2}bg-success{else}bg-danger{/if}">
                            <td>{$pg['id']}</td>
                            <td><a href="{$_url}paymentgateway/audit-view/{$pg['id']}" class="text-primary">{$pg['gateway_trx_id']}</a></td>
                            <td><a href="{$_url}customers/viewu/{$pg['username']}" class="text-primary">{$pg['username']}</a></td>
                            <td>{$pg['plan_name']}</td>
                            <td>{$pg['routers']}</td>
                            <td>{Lang::moneyFormat($pg['price'])}</td>
                            <td>
                                {if $pg['pg_url_payment']}
                                    <a href="{$pg['pg_url_payment']}" target="_blank" class="btn btn-info btn-sm" rel="noopener noreferrer">{Lang::T('open')}</a>
                                {/if}
                            </td>
                            <td>{$pg['payment_method']} - {$pg['payment_channel']}</td>
                            <td>{if $pg['created_date'] != null}{Lang::dateTimeFormat($pg['created_date'])}{/if}</td>
                            <td>{if $pg['expired_date'] != null}{Lang::dateTimeFormat($pg['expired_date'])}{/if}</td>
                            <td>{if $pg['paid_date'] != null}{Lang::dateTimeFormat($pg['paid_date'])}{/if}</td>
                            <td>
                                {if $pg['trx_invoice']}
                                    <a href="{$_url}reports/activation&q={$pg['trx_invoice']}" class="text-primary">
                                        <i class="glyphicon glyphicon-file"></i> {$pg['trx_invoice']}
                                    </a>
                                {/if}
                            </td>
                            <td>{if $pg['status'] == 1}UNPAID{elseif $pg['status'] == 2}PAID{elseif $pg['status'] == 3}FAILED{else}CANCELED{/if}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
        {include file="pagination.tpl"}
        <a href="{$_url}paymentgateway/" class="btn btn-outline-secondary btn-sm mt-3">{Lang::T('back')}</a>
    </div>
</div>

{include file="sections/footer.tpl"}

