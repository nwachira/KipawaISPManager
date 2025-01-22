{include file="sections/header.tpl"}
<style>
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        display: inline-block;
        padding: 5px 10px;
        margin-right: 5px;
        border: 1px solid #ccc;
        background-color: #fff;
        color: #333;
        cursor: pointer;
    }
</style>

<div class="row">
    <div class="col-12">
        <div class="panel panel-hovered mb-4 panel-primary">
          
            <div class="panel-body ">
                <form id="site-search" method="post" action="{$_url}customers">
                    <input type="hidden" name="csrf_token" value="{$csrf_token}">
                    <div class="md-whiteframe-z1 mb-4 d-flex m-2 text-center" >
                        
            
                           
                        
                    
                         
                  <div class="input-group">
    <input type="text" name="search" class="form-control" placeholder="{Lang::T('Search')}..." value="{$search}">
    <div class="input-group-append">
        <button class="btn btn-primary ms-2" type="submit">
            <span class="fa fa-search"></span> {Lang::T('Search')}
        </button>
        <button class="btn btn-info ms-2" type="submit" name="export" value="csv">
            <span class="glyphicon glyphicon-download" aria-hidden="true"></span> CSV
        </button>
    </div>
</div>

                      
                    
                       
                       
    <a href="{$_url}customers/add" class="btn btn-success text-white" title="{Lang::T('Add')}">
        <i class="ion ion-android-add"></i> <i class="glyphicon glyphicon-user text-white"></i>{Lang::T('Add')}
    </a>
</div>
                    
    <a href="{$_url}plan/list" class="btn btn-success text-white" title="{Lang::T('Add')}">
        <i class="ion ion-android-add"></i> <i class="glyphicon glyphicon-user text-white"></i>{Lang::T('Users')}
    </a>
                   
                </form>
                <br>&nbsp;
                <div class="table-responsive table_mobile">
                    <table id="customerTable" class="table table-bordered table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>{Lang::T('Username')}</th>
                               
                              
                               
                                
                             
                             
                                <th>{Lang::T('Service Type')}</th>
                               
                                <th>{Lang::T('Status')}</th>
                              
                                <th>{Lang::T('Manage')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $d as $ds}
                                <tr {if $ds['status'] != 'Active'}class="table-danger" {/if}>
                                    <td onclick="window.location.href = '{$_url}customers/view/{$ds['id']}'"
                                        style="cursor:pointer;">{$ds['username']}</td>
                                  
                                   
                                   
                                  
</td>

                                    <td>{$ds['service_type']}</td>
                                   
                                    <td>{Lang::T($ds['status'])}</td>
                                    
                                    <td align="center">
                                        <a href="{$_url}customers/view/{$ds['id']}" id="{$ds['id']}"
                                            class="btn btn-success btn-sm">{Lang::T('View')}</a>
                                        <a href="{$_url}customers/edit/{$ds['id']}&token={$csrf_token}" id="{$ds['id']}"
                                            class="btn btn-info btn-sm">{Lang::T('Edit')}</a>
                                        <a href="{$_url}customers/sync/{$ds['id']}&token={$csrf_token}" id="{$ds['id']}"
                                            class="btn btn-success btn-sm">{Lang::T('Sync')}</a>
                                        <a href="{$_url}plan/recharge/{$ds['id']}&token={$csrf_token}" id="{$ds['id']}"
                                            class="btn btn-primary btn-sm">{Lang::T('Recharge')}</a>
                                    </td>
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
