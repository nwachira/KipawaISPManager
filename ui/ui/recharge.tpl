{include file="sections/header.tpl"}

<div class="row">
    <div class="col-12">
        <div class="card mb-3">
            <div class="card-header">{Lang::T('Recharge Account')}</div>
            <div class="card-body">
                <form class="form-horizontal" method="post" action="{$_url}plan/recharge-confirm">
                    <div class="mb-3 row">
                        <label for="id_customer" class="col-md-2 col-form-label">{Lang::T('Select Account')}</label>
                        <div class="col-md-6">
                            <select {if $cust}{else}id="personSelect"{/if} class="form-select"
                                name="id_customer" style="width: 100%" aria-label="{Lang::T('Select a customer')}..."
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                data-bs-live-search="true">
                                {if $cust}
                                    <option value="{$cust['id']}">{$cust['username']} &bull; {$cust['fullname']} &bull; {$cust['email']}</option>
                                {/if}
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Type')}</label>
                        <div class="col-md-6">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="Hot" name="type" value="Hotspot">
                                <label class="form-check-label" for="Hot">{Lang::T('Hotspot Plans')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="POE" name="type" value="PPPOE">
                                <label class="form-check-label" for="POE">{Lang::T('PPPOE Plans')}</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="VPN" name="type" value="VPN">
                                <label class="form-check-label" for="VPN">{Lang::T('VPN Plans')}</label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="server" class="col-md-2 col-form-label">{Lang::T('Routers')}</label>
                        <div class="col-md-6">
                            <select id="server" data-type="server" name="server" class="form-select"
                                aria-label="{Lang::T('Select Routers')}..."
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                data-bs-live-search="true">
                                <option value=''>{Lang::T('Select Routers')}</option>
                                <!-- Add router options here dynamically -->
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="plan" class="col-md-2 col-form-label">{Lang::T('Service Plan')}</label>
                        <div class="col-md-6">
                            <select id="plan" name="plan" class="form-select"
                                aria-label="{Lang::T('Select Plans')}..."
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                data-bs-live-search="true">
                                <option value=''>{Lang::T('Select Plans')}</option>
                                <!-- Add plan options here dynamically -->
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="using" class="col-md-2 col-form-label">{Lang::T('Using')}</label>
                        <div class="col-md-6">
                            <select name="using" class="form-select"
                                aria-label="{Lang::T('Select Payment Method')}..."
                                data-bs-toggle="dropdown"
                                data-bs-auto-close="outside"
                                data-bs-live-search="true">
                                {foreach $usings as $using}
                                    <option value="{trim($using)}">{trim(ucWords($using))}</option>
                                {/foreach}
                                {if $_c['enable_balance'] eq 'yes'}
                                    <option value="balance">{Lang::T('Customer Balance')}</option>
                                {/if}
                                <option value="zero">{$_c['currency_code']} 0</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <small class="form-text text-muted">{Lang::T('Postpaid Recharge for the first time use')} {$_c['currency_code']} 0</small>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-10 offset-md-2">
                            <button class="btn btn-success" type="submit">{Lang::T('Recharge')}</button>
                            {Lang::T('Or')} <a href="{$_url}customers/list" class="btn btn-secondary">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}