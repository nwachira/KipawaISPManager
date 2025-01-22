{include file="sections/header.tpl"}
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

<div class="row">
    <div class="col-12">
        <div class="card mb-4">
            <div class="card-header">
                {Lang::T('Send Bulk Message')}
            </div>
            <div class="card-body">
                <form method="post" role="form" id="bulkMessageForm" action="">
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Group')}</label>
                        <div class="col-md-6">
                            <select class="form-select" name="group" id="group">
                                <option value="all" selected>{Lang::T('All Customers')}</option>
                                <option value="new">{Lang::T('New Customers')}</option>
                                <option value="expired">{Lang::T('Expired Customers')}</option>
                                <option value="active">{Lang::T('Active Customers')}</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Send Via')}</label>
                        <div class="col-md-6">
                            <select class="form-select" name="via" id="via">
                                <option value="sms" selected>{Lang::T('SMS')}</option>
                                <option value="wa">{Lang::T('WhatsApp')}</option>
                                <option value="both">{Lang::T('SMS and WhatsApp')}</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Message per time')}</label>
                        <div class="col-md-6">
                            <select class="form-select" name="batch" id="batch">
                                <option value="5">{Lang::T('5 Messages')}</option>
                                <option value="10" selected>{Lang::T('10 Messages')}</option>
                                <option value="15">{Lang::T('15 Messages')}</option>
                                <option value="20">{Lang::T('20 Messages')}</option>
                                <option value="30">{Lang::T('30 Messages')}</option>
                                <option value="40">{Lang::T('40 Messages')}</option>
                                <option value="50">{Lang::T('50 Messages')}</option>
                                <option value="60">{Lang::T('60 Messages')}</option>
                            </select>
                            <small>{Lang::T('Use 20 and above if you are sending to all customers to avoid server time out')}</small>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Delay')}</label>
                        <div class="col-md-6">
                            <select class="form-select" name="delay" id="delay">
                                <option value="0" selected>{Lang::T('No Delay')}</option>
                                <option value="5">{Lang::T('5 Seconds')}</option>
                                <option value="10">{Lang::T('10 Seconds')}</option>
                                <option value="15">{Lang::T('15 Seconds')}</option>
                                <option value="20">{Lang::T('20 Seconds')}</option>
                            </select>
                            <small>{Lang::T('Use at least 5 secs if you are sending to all customers to avoid being banned by your message provider')}</small>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-2 col-form-label">{Lang::T('Message')}</label>
                        <div class="col-md-6">
                            <textarea class="form-control" id="message" name="message"
                                placeholder="{Lang::T('Compose your message...')}" rows="5"></textarea>
                            <div class="form-check mt-2">
                                <input name="test" type="checkbox" class="form-check-input" id="test">
                                <label class="form-check-label" for="test">{Lang::T('Testing [if checked no real message is sent]')}</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <p class="help-block">
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
                    </div>
                    <div class="mb-3 row">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button class="btn btn-success" onclick="return ask(this, 'Continue the process of sending mass messages?')" type="submit" name="send" value="now">
                                {Lang::T('Send Message')}
                            </button>
                            <a href="{$_url}dashboard" class="btn btn-secondary">{Lang::T('Cancel')}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

{if $batchStatus}
<p>
    <span class="badge bg-success">{Lang::T('Total SMS Sent')}: {$totalSMSSent}</span> 
    <span class="badge bg-danger">{Lang::T('Total SMS Failed')}: {$totalSMSFailed}</span> 
    <span class="badge bg-success">{Lang::T('Total WhatsApp Sent')}: {$totalWhatsappSent}</span> 
    <span class="badge bg-danger">{Lang::T('Total WhatsApp Failed')}: {$totalWhatsappFailed}</span>
</p>
{/if}

<div class="card">
    <div class="card-header">
        <h5 class="card-title">{Lang::T('Message Results')}</h5>
    </div>
    <div class="card-body">
        <table id="messageResultsTable" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>{Lang::T('Name')}</th>
                    <th>{Lang::T('Phone')}</th>
                    <th>{Lang::T('Message')}</th>
                    <th>{Lang::T('Status')}</th>
                </tr>
            </thead>
            <tbody>
                {foreach $batchStatus as $customer}
                <tr>
                    <td>{$customer.name}</td>
                    <td>{$customer.phone}</td>
                    <td>{$customer.message}</td>
                    <td>{$customer.status}</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
    var $j = jQuery.noConflict();

    $j(document).ready(function () {
        $j('#messageResultsTable').DataTable();
    });
</script>

{include file="sections/footer.tpl"}
