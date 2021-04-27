@php
  $user = !empty(Auth::user()) ? Auth::user() : '';
  $is_freelancer = Helper::userHasRole($user->id, "freelancer");
  $is_employer = Helper::userHasRole($user->id, "employer");
@endphp
<nav id="wt-profiledashboard" class="wt-usernav">
        <ul>
            @if ($role === 'admin')
                <li class="menu-item-has-children">
                    <span class="wt-dropdowarrow"><i class="lnr lnr-chevron-right"></i></span>
                    <a href="javascript:void(0)">
                        <i class="ti-layers"></i>
                        <span>{{ trans('lang.manage_articles') }}</span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="{{{ route('articles') }}}">{{ trans('lang.articles') }}</a></li>
                        <li><a href="{{{ route('articleCategories') }}}">{{ trans('lang.categories') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a href="{{{ route('orderList') }}}">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <span>{{ trans('lang.orders') }}</span>
                    </a>
                </li>
                @if (Helper::getAccessType() == 'both' || Helper::getAccessType() == 'jobs')
                    <li>
                        <a href="{{{ route('allJobs') }}}">
                            <i class="ti-briefcase"></i>
                            <span>{{ trans('lang.all_jobs') }}</span>
                        </a>
                    </li>
                @endif
                @if (Helper::getAccessType() == 'both' || Helper::getAccessType() == 'services')
                    <li>
                        <a href="{{{ route('allServices') }}}">
                            <i class="ti-briefcase"></i>
                            <span>{{ trans('lang.services') }}</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{{ route('ServiceOrders') }}}">
                            <i class="ti-briefcase"></i>
                            <span>{{ trans('lang.service_orders') }}</span>
                        </a>
                    </li>
                @endif
                <li>
                    <a href="{{{ route('reviewOptions') }}}">
                        <i class="ti-check-box"></i>
                        <span>{{ trans('lang.review_options') }}</span>
                    </a>
                </li>
                <li>
                    <a href="{{{ route('userListing') }}}">
                        <i class="ti-user"></i>
                        <span>{{ trans('lang.manage_users') }}</span>
                    </a>
                </li>
                <li>
                    <a href="{{{ route('emailTemplates') }}}">
                        <i class="ti-email"></i>
                        <span>{{ trans('lang.email_templates') }}</span>
                    </a>
                </li>
                <li class="menu-item-has-children">
                    <span class="wt-dropdowarrow"><i class="lnr lnr-chevron-right"></i></span>
                    <a href="{{{ route('pages') }}}">
                        <i class="ti-layers"></i>
                        <span>{{ trans('lang.pages') }}</span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="{{{ route('pages') }}}">{{ trans('lang.all_pages') }}</a></li>
                        <li><a href="{{{ route('createPage') }}}">{{ trans('lang.add_pages') }}</a></li>
                    </ul>
                </li>
                <li>
                    <a href="{{{ route('createPackage') }}}">
                        <i class="ti-package"></i>
                        <span>{{ trans('lang.packages') }}</span>
                    </a>
                </li>
                <li>
                    <a href="{{{ route('adminPayouts') }}}">
                        <i class="ti-money"></i>
                        <span>{{ trans('lang.payouts') }}</span>
                    </a>
                </li>
                <li>
                    <a href="{{{ route('homePageSettings') }}}">
                        <i class="ti-home"></i>
                        <span>{{ trans('lang.home_page_settings') }}</span>
                    </a>
                </li>
                <li class="menu-item-has-children">
                    <span class="wt-dropdowarrow"><i class="lnr lnr-chevron-right"></i></span>
                    <a href="{{{ route('adminProfile') }}}">
                        <i class="ti-settings"></i>
                        <span>{{ trans('lang.settings') }}</span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="{{{ route('adminProfile') }}}">{{ trans('lang.acc_settings') }}</a></li>
                        <li><a href="{{{ route('settings') }}}">{{ trans('lang.general_settings') }}</a></li>
                        <li><a href="{{{ route('resetPassword') }}}">{{ trans('lang.reset_pass') }}</a></li>
                    </ul>
                </li>
                <li class="menu-item-has-children">
                    <span class="wt-dropdowarrow"><i class="ti-layers"></i></span>
                    <a href="{{{ route('categories') }}}">
                        <i class="ti-layers"></i>
                        <span>{{ trans('lang.taxonomies') }}</span>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="{{{ route('skills') }}}">{{ trans('lang.skills') }}</a></li>
                        <li><a href="{{{ route('categories') }}}">{{ trans('lang.job_cats') }}</a></li>
                        <li><a href="{{{ route('departments') }}}">{{ trans('lang.dpts') }}</a></li>
                        <li><a href="{{{ route('grades') }}}">{{ trans('lang.grades') }}</a></li>
                        <li><a href="{{{ route('camaras') }}}">{{ trans('lang.camaras') }}</a></li>
                        <li><a href="{{{ route('rtes') }}}">{{ trans('lang.rtes') }}</a></li>
                        <li><a href="{{{ route('professions') }}}">{{ trans('lang.professions') }}</a></li>
                        <li><a href="{{{ route('languages') }}}">{{ trans('lang.langs') }}</a></li>
                        <li><a href="{{{ route('locations') }}}">{{ trans('lang.locations') }}</a></li>
                        <li><a href="{{{ route('badges') }}}">{{ trans('lang.badges') }}</a></li>
                        <li><a href="{{{ route('deliveryTime') }}}">{{ trans('lang.delivery_time') }}</a></li>
                        <li><a href="{{{ route('ResponseTime') }}}">{{ trans('lang.response_time') }}</a></li>
                    </ul>
                </li>
            @endif
          
            @if ($is_freelancer && $is_employer)
            <li>
                <a style="color:var(--color-2)"href="{{{ url($role.'/switch-to-'.($role === 'freelancer'? 'employer': 'freelancer')) }}}">
                    <i class="lnr lnr-enter"></i>
                    <span>{{($role === 'freelancer'? trans('lang.switch_to_employer'): trans('lang.switch_to_freelancer')) }}</span>
                </a>
            </li>
            @endif
            <li>
                <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('profile-logout-form').submit();">
                    <i class="lnr lnr-exit"></i>
                    {{{trans('lang.logout')}}}
                </a>
                <form id="profile-logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    {{ csrf_field() }}
                </form>
            </li>
        </ul>
    </nav>
