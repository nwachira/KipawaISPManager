{include file="./sections/header.tpl"}

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12 mb-3">
            <div class="alert" style="background: #1976D2; margin-bottom: 15px; border-radius: 6px; padding: 10px 15px;">
                <div class="text-center">
                    <span style="color: #FDD835; font-weight: bold; font-size: 16px;">
                        🔥 FLASH OFFER:
                    </span>
                    <span style="color: white; font-size: 16px;">
                        Create an account now and get Unlimited Internet for just
                        <span style="color: #FDD835; font-weight: bold; font-size: 18px;">Ksh 10/=</span>
                        per day!
                    </span>
                    <span style="color: #FDD835; font-weight: bold;">
                        ⚡ Limited time offer!
                    </span>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" style="font-size: 18px">{Lang::T('About KipawaIsp Management System')}</h3>
                </div>
                <div class="panel-body" style="font-size: 16px; line-height: 1.6;">
                    <p>
                        KipawaIsp is an advanced management system designed to simplify the operations of internet service providers. 
                        It offers comprehensive solutions for managing both Hotspot and PPP clients, providing features such as 
                        user account management, billing automation, and real-time monitoring.
                    </p>
                    <p>
                        With KipawaIsp, ISPs can enhance their efficiency, streamline service delivery, and ensure customer satisfaction 
                        with a user-friendly interface and powerful backend features.
                    </p>
                    <p>
                        For inquiries, contact us at: <strong>0111723138</strong>
                    </p>
                    <div class="text-center mt-4">
                        <a href="{$_url}admin" class="btn btn-primary btn-lg" style="font-size: 16px;">
                            <i class="glyphicon glyphicon-lock"></i> Admin Login
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Keep the modal for announcements -->
<div class="modal fade" id="HTMLModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" style="font-size: 24px">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="HTMLModal_konten"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">&times;</button>
            </div>
        </div>
    </div>
</div>

{include file="./sections/footer.tpl"}
