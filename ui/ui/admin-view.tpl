{include file="sections/header.tpl"}


<div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg bg-transparent shadow-none position-absolute px-4 w-100 z-index-2">
      <div class="container-fluid py-1">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 ps-2 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="text-white opacity-5" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">Profile</li>
          </ol>
          <h6 class="text-white font-weight-bolder ms-2">Profile</h6>
        </nav>
        <div class="collapse navbar-collapse me-md-0 me-sm-4 mt-sm-0 mt-2" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              
          </div>
          <ul class="navbar-nav justify-content-end">
           
            <li class="user-footer">
      <div class="text-end">
        <a href="{$_url}logout" class="btn btn-sm btn-outline-white">
          <i class="ion ion-power"></i> {Lang::T('Logout')}
        </a>
      </div>
    </li>
            <li class="nav-item d-xl-none ps-3 pe-0 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                  <div class="sidenav-toggler-inner">
                    <i class="sidenav-toggler-line bg-white"></i>
                    <i class="sidenav-toggler-line bg-white"></i>
                    <i class="sidenav-toggler-line bg-white"></i>
                  </div>
                </a>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell cursor-pointer"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end px-2 py-3 ms-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="../assets/img/team-2.jpg" class="avatar avatar-sm me-3">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New message</span> from Laur
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          13 minutes ago
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="../assets/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark me-3">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New album</span> by Travis Scott
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          1 day
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="avatar avatar-sm bg-gradient-secondary me-3 my-auto">
                        <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                              <g transform="translate(1716.000000, 291.000000)">
                                <g transform="translate(453.000000, 454.000000)">
                                  <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" opacity="0.593633743"></path>
                                  <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                </g>
                              </g>
                            </g>
                          </g>
                        </svg>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          Payment successfully completed
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          2 days
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid">
      <div class="page-header min-height-250 border-radius-lg mt-4 d-flex flex-column justify-content-end">
        <span class="mask bg-primary opacity-9"></span>
        <div class="w-100 position-relative p-3">
          <div class="d-flex justify-content-between align-items-end">
            <div class="d-flex align-items-center">
              <div class="avatar avatar-xl position-relative me-3">
                    <center>
                            <a href="{$UPLOAD_PATH}{$d['photo']}" target="foto">
                                <img src="{$UPLOAD_PATH}{$d['photo']}.thumb.jpg" width="200"
                                    onerror="this.src='{$UPLOAD_PATH}/admin.default.png'" class="img-circle img-responsive" alt="Foto">
                            </a>
                        </center><br>              </div>
                      <div>
                <h5 class="mb-1 text-white font-weight-bolder">
                 {$d['fullname']}
                </h5>
                 <p class="mb-0 text-white text-sm">
                  {$d['user_type']}
                </p>
                
              </div>
            </div>
          
          </div>
        </div>
      </div>
    </div>

     <div class=" m-2 mb-4 justify-content-center align-items-center min-vh-100">
  <div class="col-12 col-xl-6">
    <div class="card h-100">
      <div class="card-header pb-0 p-3">
        <div class="row">
          <div class="col-md-8 d-flex align-items-center">
            <h6 class="mb-0">Profile Information</h6>
          </div>
          <div class="col-md-4 text-end">
            <a href="{$_url}settings/users-edit/{$d['id']}">
              <i class="fas fa-user-edit text-secondary text-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit Profile"></i>
            </a>
          </div>
        </div>
      </div>
      <div class="card-body p-3">
        <p class="text-sm">
          Hi, I’m {$d['username']}.
        </p>
        <hr class="horizontal gray-light my-4">
        <ul class="list-group">
          <li class="list-group-item border-0 ps-0 pt-0 text-sm"><strong class="text-dark">{Lang::T('Username')}:</strong> &nbsp; {$d['username']}</li>
          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">{Lang::T('Phone Number')}:</strong> &nbsp; {$d['phone']}</li>
          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">{Lang::T('Email')}:</strong> &nbsp; {$d['email']}</li>
          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">{Lang::T('City')}:</strong> &nbsp; {$d['city']}</li>
          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">{Lang::T('Sub District')}:</strong> &nbsp; {$d['subdistrict']}</li>
          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">{Lang::T('Ward')}:</strong> &nbsp; {$d['city']}</li>
          <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">{Lang::T('User Type')}:</strong> &nbsp; {$d['user_type']}</li>
          <li class="list-group-item border-0 ps-0 text-sm">
            <strong class="text-dark text-sm">Social:</strong> &nbsp;
            <a class="btn btn-facebook btn-simple mb-0 ps-1 pe-2 py-0" href="javascript:;">
              <i class="fab fa-facebook fa-lg"></i>
            </a>
            <a class="btn btn-twitter btn-simple mb-0 ps-1 pe-2 py-0" href="javascript:;">
              <i class="fab fa-twitter fa-lg"></i>
            </a>
            <a class="btn btn-instagram btn-simple mb-0 ps-1 pe-2 py-0" href="javascript:;">
              <i class="fab fa-instagram fa-lg"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>



{include file="sections/footer.tpl"}