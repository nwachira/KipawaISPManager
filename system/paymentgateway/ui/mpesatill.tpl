{include file="sections/header.tpl"}
<div class="container-fluid">
<form class="form-horizontal" method="post" role="form" action="{$_url}paymentgateway/MpesatillStk">
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="card shadow-sm border-5 mb-4">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0 text-white">M-Pesa Configuration</h4>
                </div>
                <div class="card-body">
                    <!-- Consumer Key -->
                    <div class="form-group row">
                        <label for="mpesa_consumer_key" class="col-md-4 col-form-label">Consumer Key</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="mpesa_consumer_key" name="mpesa_consumer_key" placeholder="xxxxxxxxxxxxxxxxx" value="{$_c['mpesa_till_consumer_key']}">
                            <small class="form-text text-muted">
                                <a href="https://developer.safaricom.co.ke/MyApps" target="_blank" class="text-info">https://developer.safaricom.co.ke/MyApps</a>
                            </small>
                        </div>
                    </div>

                    <!-- Consumer Secret -->
                    <div class="form-group row">
                        <label for="mpesa_consumer_secret" class="col-md-4 col-form-label">Consumer Secret</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="mpesa_consumer_secret" name="mpesa_consumer_secret" placeholder="xxxxxxxxxxxxxxxxx" value="{$_c['mpesa_till_consumer_secret']}">
                        </div>
                    </div>

                    <!-- Business Shortcode (Store number) -->
                    <div class="form-group row">
                        <label for="mpesa_business_code" class="col-md-4 col-form-label">Business Shortcode (Store number/H.O)</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="mpesa_business_code" name="mpesa_business_code" placeholder="xxxxxxx" maxlength="7" value="{$_c['mpesa_till_shortcode_code']}">
                        </div>
                    </div>

                    <!-- Business Shortcode (Till number) -->
                    <div class="form-group row">
                        <label for="mpesa_till" class="col-md-4 col-form-label">Business Shortcode (Till number)</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="mpesa_till" name="mpesa_till" placeholder="xxxxxxx" maxlength="7" value="{$_c['mpesa_till_partyb']}">
                        </div>
                    </div>

                    <!-- Pass Key -->
                    <div class="form-group row">
                        <label for="mpesa_pass_key" class="col-md-4 col-form-label">Pass Key</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="mpesa_pass_key" name="mpesa_pass_key" placeholder="bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919" value="{$_c['mpesa_till_pass_key']}">
                        </div>
                    </div>

                    <!-- M-Pesa Environment -->
                    <div class="form-group row">
                        <label for="mpesa_env" class="col-md-4 col-form-label">M-Pesa Environment</label>
                        <div class="col-md-8">
                            <select class="form-control" name="mpesa_env" id="mpesa_env">
                                {foreach $env as $environment}
                                    <option value="{$environment['id']}" {if $environment['id'] == $_c['mpesa_env']}selected{/if}>
                                        {$environment['id']} - {$environment['name']}
                                    </option>
                                {/foreach}
                            </select>
                            <small class="form-text text-muted">
                                <span class="text-danger"><b>Sandbox</b></span> is for testing. Switch to <span class="text-success"><b>Live</b></span> for production.
                            </small>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group row">
                        <div class="col-md-8 offset-md-4">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa fa-save"></i> Save Changes
                            </button>
                        </div>
                    </div>

                    <!-- Walled Garden Command -->
                    <div class="mt-4">
                        <pre class="bg-light p-3 border rounded">/ip hotspot walled-garden
add dst-host=safaricom.co.ke
add dst-host=*.safaricom.co.ke
                        </pre>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</div>
{include file="sections/footer.tpl"}

