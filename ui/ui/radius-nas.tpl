{include file="sections/header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Radius</h5>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between mb-4">
                    <!-- Search Form -->
                    <div class="col-md-8">
                        <form id="site-search" method="post" action="{$_url}radius/nas-list">
                            <div class="input-group">
                                <div class="input-group-text">
                                    <i class="fa fa-search"></i>
                                </div>
                                <input type="text" name="name" class="form-control" value="{$name}" placeholder="{Lang::T('Search by Name')}...">
                                <div class="input-group-append">
                                    <button class="btn btn-success" type="submit">{Lang::T('Search')}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- Add New NAS Button -->
                    <div class="col-md-4 text-end">
                        <a href="{$_url}radius/nas-add" class="btn btn-primary"><i class="ion ion-android-add"></i> {Lang::T('New NAS')}</a>
                    </div>
                </div>
                <!-- Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>{Lang::T('Name')}</th>
                                <th>IP</th>
                                <th>{Lang::T('Type')}</th>
                                <th>Port</th>
                                <th>Server</th>
                                <th>Community</th>
                                <th>Routers</th>
                                <th>{Lang::T('Manage')}</th>
                                <th>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $nas as $ds}
                                <tr>
                                    <td>{$ds['shortname']}</td>
                                    <td>{$ds['nasname']}</td>
                                    <td>{$ds['type']}</td>
                                    <td>{$ds['ports']}</td>
                                    <td>{$ds['server']}</td>
                                    <td>{$ds['community']}</td>
                                    <td>{$ds['routers']}</td>
                                    <td class="text-center">
                                        <a href="{$_url}radius/nas-edit/{$ds['id']}" class="btn btn-info btn-sm">{Lang::T('Edit')}</a>
                                        <a href="{$_url}radius/nas-delete/{$ds['id']}" id="{$ds['id']}" onclick="return ask(this, '{Lang::T('Delete')}?')" class="btn btn-danger btn-sm">
                                            <i class="glyphicon glyphicon-trash"></i>
                                        </a>
                                    </td>
                                    <td class="text-center">{$ds['id']}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                <!-- Pagination -->
                {include file="pagination.tpl"}
                <!-- Information Callout -->
                <div class="alert alert-info mt-4">
                    <h4 class="alert-heading">RADIUS REST</h4>
                    <p>{Lang::T("For Radius REST, you don't need to add NAS, NAS need to add to client.conf manually")}</p>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}

