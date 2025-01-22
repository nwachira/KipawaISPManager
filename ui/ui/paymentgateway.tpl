{include file="sections/header.tpl"}

<form method="post">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- Payment Gateway Panel -->
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="m-0 text-white">{Lang::T('Payment Gateway')}</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-hover">
                                <tbody>
                                    {foreach $pgs as $pg}
                                        <tr>
                                            <td class="align-middle" style="width: 5%;">
                                                <input type="checkbox" name="pgs[]"
                                                    {if in_array($pg, $actives)}checked{/if} value="{$pg}">
                                            </td>
                                            <td class="align-middle">
                                                <a href="{$_url}paymentgateway/{$pg}"
                                                    class="btn btn-{if in_array($pg, $actives)}info{else}secondary{/if} w-100 text-left">
                                                    {ucwords($pg)}
                                                </a>
                                            </td>
                                            <td class="text-end align-middle" style="width: 150px;">
                                                <div class="btn-group">
                                                    <a href="{$_url}paymentgateway/audit/{$pg}"
                                                        class="btn btn-success text-white">
                                                        Audit
                                                    </a>
                                                   
                                                </div>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Save Changes Button -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary btn-block" name="save" value="actives">
                            {Lang::T('Save Changes')}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

{include file="sections/footer.tpl"}
