{include file="sections/header.tpl"}
<!-- user-edit -->

<form class="form-horizontal" method="post" enctype="multipart/form-data" role="form"
    action="{$_url}settings/users-edit-post">
    <input type="hidden" name="csrf_token" value="{$csrf_token}">
    <div class="row">
        <div class="col-sm-6 col-md-6">
            <div
                class="card {if $d['status'] != 'Active'}border-danger{else}border-primary{/if} card-hovered mb-4">
                <div class="card-header">{Lang::T('Profile')}</div>
                <div class="card-body">
                    <input type="hidden" name="id" value="{$d['id']}">
                    <div class="text-center">
                        <img src="{$UPLOAD_PATH}{$d['photo']}.thumb.jpg" width="200"
                            onerror="this.src='{$UPLOAD_PATH}/admin.default.png'" class="rounded-circle img-fluid" alt="Foto"
                            onclick="return deletePhoto({$d['id']})">
                    </div><br>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Photo')}</label>
                        <div class="col-md-6">
                            <input type="file" class="form-control" name="photo" accept="image/*">
                        </div>
                        <div class="col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" checked name="faceDetect" value="yes">
                                <label class="form-check-label">{Lang::T('Face Detect')}</label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Full Name')}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="fullname" name="fullname" value="{$d['fullname']}">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Phone')}</label>
                        <div class="col-md-9">
                            <input type="number" class="form-control" id="phone" name="phone" value="{$d['phone']}">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Email')}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="email" name="email" value="{$d['email']}">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="city" name="city" placeholder="{Lang::T('City')}" value="{$d['city']}">
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="subdistrict" name="subdistrict" placeholder="{Lang::T('Sub District')}" value="{$d['subdistrict']}">
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="ward" name="ward" placeholder="{Lang::T('Ward')}" value="{$d['ward']}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-6">
            <div
                class="card {if $d['status'] != 'Active'}border-danger{else}border-primary{/if} card-hovered mb-4">
                <div class="card-header">{Lang::T('Credentials')}</div>
                <div class="card-body">
                    {if ($_admin['id']) neq ($d['id'])}
                        <div class="mb-3 row">
                            <label class="col-md-3 col-form-label">{Lang::T('Status')}</label>
                            <div class="col-md-9">
                                <select name="status" id="status" class="form-select">
                                    <option value="Active" {if $d['status'] eq 'Active'}selected="selected" {/if}>
                                        {Lang::T('Active')}</option>
                                    <option value="Inactive" {if $d['status'] eq 'Inactive'}selected="selected" {/if}>
                                        {Lang::T('Inactive')}</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-md-3 col-form-label">{Lang::T('User Type')}</label>
                            <div class="col-md-9">
                                <select name="user_type" id="user_type" class="form-select" onchange="checkUserType(this)">
                                    {if $_admin['user_type'] eq 'Agent'}
                                        <option value="Sales" {if $d['user_type'] eq 'Sales'}selected="selected" {/if}>Sales
                                        </option>
                                    {/if}
                                    {if $_admin['user_type'] eq 'Admin' || $_admin['user_type'] eq 'SuperAdmin'}
                                        <option value="Report" {if $d['user_type'] eq 'Report'}selected="selected" {/if}>Report
                                            Viewer</option>
                                        <option value="Agent" {if $d['user_type'] eq 'Agent'}selected="selected" {/if}>Agent
                                        </option>
                                        <option value="Sales" {if $d['user_type'] eq 'Sales'}selected="selected" {/if}>Sales
                                        </option>
                                    {/if}
                                    {if $_admin['user_type'] eq 'SuperAdmin'}
                                        <option value="Admin" {if $d['user_type'] eq 'Admin'}selected="selected" {/if}>
                                            Administrator</option>
                                        <option value="SuperAdmin" {if $d['user_type'] eq 'SuperAdmin'}selected="selected"
                                            {/if}>Super Administrator</option>
                                    {/if}
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row {if $d['user_type'] neq 'Sales'}d-none{/if}" id="agentChooser">
                            <label class="col-md-3 col-form-label">{Lang::T('Agent')}</label>
                            <div class="col-md-9">
                                <select name="root" id="root" class="form-select">
                                    {foreach $agents as $agent}
                                        <option value="{$agent['id']}">{$agent['username']} | {$agent['fullname']} |
                                            {$agent['phone']}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    {/if}
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Username')}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="username" name="username" value="{$d['username']}">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Password')}</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" id="password" name="password">
                            <span class="form-text">{Lang::T('Keep Blank to do not change Password')}</span>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">{Lang::T('Confirm Password')}</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" id="cpassword" name="cpassword"
                                placeholder="{Lang::T('Confirm Password')}">
                            <span class="form-text">{Lang::T('Keep Blank to do not change Password')}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center">
        <button class="btn btn-primary" onclick="return ask(this, 'Continue the Admin change process?')" type="submit">{Lang::T('Save Changes')}</button>
        Or <a href="{$_url}settings/users">{Lang::T('Cancel')}</a>
    </div>
</form>

<script>
    function checkUserType($field) {
        if ($field.value == 'Sales') {
            $('#agentChooser').removeClass('d-none');
        } else {
            $('#agentChooser').addClass('d-none');
        }
    }

    function deletePhoto(id) {
        if (confirm('Delete photo?')) {
            if (confirm('Are you sure to delete photo?')) {
                window.location.href = '{$_url}settings/users-edit/'+id+'/deletePhoto'
            }
        }
    }
</script>
{include file="sections/footer.tpl"}
