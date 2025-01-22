{include file="sections/header.tpl"}

<div class="row">
    <div class="col-12">
        <div class="card mb-4">
            <div class="card-header d-flex">
                {Lang::T('Send Personal Message')}
                <div class="col-lg-offset-2 col-lg-10">
                            <a href="{$_url}message/send_bulk" class="btn btn-success">{Lang::T('Bulk Customers')}</a>
                </div>
            </div>
            <div class="card-body">
                <form method="post" role="form" action="{$_url}message/send-post">
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Customer')}</label>
                        <div class="col-md-6">
                            <select {if $cust}{else}id="personSelect" {/if} class="form-select"
                                name="id_customer" style="width: 100%"
                                data-placeholder="{Lang::T('Select a customer')}...">
                                {if $cust}
                                <option value="{$cust['id']}">{$cust['username']} &bull; {$cust['fullname']} &bull;
                                    {$cust['email']}</option>
                                {/if}
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Send Via')}</label>
                        <div class="col-md-6">
                            <select class="form-select" name="via" id="via">
                                <option value="sms" selected> {Lang::T('via SMS')}</option>
                                <option value="wa"> {Lang::T('Via WhatsApp')}</option>
                                <option value="both"> {Lang::T('Via WhatsApp and SMS')}</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Message')}</label>
                        <div class="col-md-6">
                            <textarea class="form-control" id="message" name="message"
                                placeholder="{Lang::T('Compose your message...')}" rows="5"></textarea>
                        </div>
                        <p class="help-block col-md-4 mt-2">
                            {Lang::T('Use placeholders:')}
                            <br>
                            <b>[[name]]</b> - {Lang::T('Customer Name')}
                            <br>
                            <b>[[user_name]]</b> - {Lang::T('Customer Username')}
                            <br>
                            <b>[[phone]]</b> - {Lang::T('Customer Phone')}
                            <br>
                            <b>[[company_name]]</b> - {Lang::T('Your Company Name')}
                        </p>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button class="btn btn-success" onclick="return ask(this, 'Continue the process of sending messages?')" type="submit">{Lang::T('Send Message')}</button>
                            <a href="{$_url}dashboard" class="btn btn-secondary">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}
