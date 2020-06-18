<div class="wt-dashboardtabs">
    <ul class="wt-tabstitle nav navbar-nav">
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='personalDetail'? 'active': '' }}}" href="{{{ route('employerPersonalDetail') }}}">{{{ trans('lang.profile_detail') }}}</a>
        </li>
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='employerPersonalInfo'? 'active': '' }}}" href="{{{ route('employerPersonalInfo') }}}">{{{ trans('lang.personal_info') }}}</a>
        </li>
    </ul>
</div>