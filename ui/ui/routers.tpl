{include file="sections/header.tpl"}

<!-- Routers -->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-primary mb-4">
            <div class="panel-heading d-flex justify-content-between align-items-center">
                <span>{Lang::T('Routers')}</span>
                <a class="btn btn-primary btn-xs" title="save" href="{$_url}routers/maps">
                    <span class="glyphicon glyphicon-map-marker"></span>
                </a>
            </div>
            <div class="panel-body">
                <!-- Search and New Router -->
                <div class="row mb-4">
                    <div class="col-md-8">
                        <form id="site-search" method="post" action="{$_url}routers/list/">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    
                                </div>
                                <input type="text" name="name" class="form-control" placeholder="{Lang::T('Search by Name')}...">
                                <div class="input-group-btn">
                                    <button class="btn btn-success" type="submit">{Lang::T('Search')}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4">
                        <a href="{$_url}routers/add" class="btn btn-primary btn-block">
                            <i class="ion ion-android-add"></i> {Lang::T('New Router')}
                        </a>

                        <a href="{$_url}radius/nas-list" class="btn btn-primary btn-block">
                            <i class="ion ion-android-add"></i> {Lang::T('Radius Nas')}
                        </a>
                    </div>

                    <div class="col-md-4">
                        
                    </div>
                </div>

                <!-- Routers Table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>{Lang::T('Router Name')}</th>
                                <th>{Lang::T('IP Address')}</th>
                                <th>{Lang::T('Username')}</th>
                                <th>{Lang::T('Description')}</th>
                                {if $_c['router_check']}
                                    <th>{Lang::T('Online Status')}</th>
                                    <th>{Lang::T('Last Seen')}</th>
                                {/if}
                                <th>{Lang::T('Status')}</th>
                                <th>{Lang::T('Manage')}</th>
                                <th>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $d as $ds}
                                <tr {if $ds['enabled'] != 1}class="table-danger" title="disabled" {/if}>
                                    <td>
                                        {if $ds['coordinates']}
                                            <a href="https://www.google.com/maps/dir//{$ds['coordinates']}/" target="_blank" class="btn btn-default btn-xs" title="{$ds['coordinates']}">
                                                <i class="glyphicon glyphicon-map-marker"></i>
                                            </a>
                                        {/if}
                                        {$ds['name']}
                                    </td>
                                    <td class="router-info" data-content="IP Address: {$ds['ip_address']}">{$ds['ip_address']}</td>
                                    <td class="router-info" data-content="Username: {$ds['username']}">{$ds['username']}</td>
                                    <td>{$ds['description']}</td>
                                    {if $_c['router_check']}
                                        <td>
                                            <span class="label {if $ds['status'] == 'Online'}label-success{else}label-danger{/if}">
                                                {if $ds['status'] == 'Online'}{Lang::T('Online')}{else}{Lang::T('Offline')}{/if}
                                            </span>
                                        </td>
                                        <td>{$ds['last_seen']}</td>
                                    {/if}
                                    <td>{if $ds['enabled'] == 1}{Lang::T('Enabled')}{else}{Lang::T('Disabled')}{/if}</td>
                                    <td>
                                        <a href="{$_url}routers/edit/{$ds['id']}" class="btn btn-info btn-xs">{Lang::T('Edit')}</a>
                                        <a href="{$_url}routers/delete/{$ds['id']}" id="{$ds['id']}" onclick="return ask(this, '{Lang::T('Delete')}?')" class="btn btn-danger btn-xs">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </td>
                                    <td>{$ds['id']}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                {include file="pagination.tpl"}

               
            </div>
        </div>
    </div>
</div>



{include file="sections/footer.tpl"}
