<div class="wt-dashboardtabs">
    <ul class="wt-tabstitle nav navbar-nav">
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='personalDetail'? 'active': '' }}}" href="{{{ route('personalDetail') }}}">{{{ trans('lang.personal_detail') }}}</a>
        </li>
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='personalInfo'? 'active': '' }}}" href="{{{ route('personalInfo') }}}">{{{ trans('lang.personal_info') }}}</a>
        </li>
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='experienceEducation'? 'active': '' }}}" href="{{{ route('experienceEducation') }}}">{{{ trans('lang.experience_education') }}}</a>
        </li>
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='projectAwards'? 'active': '' }}}" href="{{{ route('projectAwards') }}}">{{{ trans('lang.project_awards') }}}</a>
        </li>
        <li class="nav-item">
            <a class="{{{ \Request::route()->getName()==='billingAddress'? 'active': '' }}}" href="{{{ route('billingAddress') }}}">{{{ trans('lang.billing_address') }}}</a>
        </li>
    </ul>
</div>
