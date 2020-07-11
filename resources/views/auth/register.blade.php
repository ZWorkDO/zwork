@extends(file_exists(resource_path('views/extend/front-end/master.blade.php')) ? 'extend.front-end.master' : 'front-end.master')
@section('content')
@php
    $employees      = Helper::getEmployeesList();
    $categories     = App\Category::all();
    $marital_status = Helper::getMaritalStatusList();
    $id_types       = Helper::getIDTypeList();
    $genders        = Helper::getGender();
    $departments    = App\Department::all();
    $grades         = App\Grade::all();
    $rtes           = App\Rte::select('title', 'id')->get()->pluck('title', 'id')->toArray();
    $camaras        = App\Camara::select('title', 'id')->get()->pluck('title', 'id')->toArray();
    $professions    = App\Profession::select('title', 'id')->get()->pluck('title', 'id')->toArray();
    $gender         = !empty($profile->gender) ? $profile->gender : '';
    $locations      = App\Location::select('title', 'id')->get()->pluck('title', 'id')->toArray();
    $roles          = Spatie\Permission\Models\Role::all()->toArray();
    $register_form = App\SiteManagement::getMetaValue('reg_form_settings');
    $reg_one_title = !empty($register_form) && !empty($register_form[0]['step1-title']) ? $register_form[0]['step1-title'] : trans('lang.join_for_good');
    $reg_one_subtitle = !empty($register_form) && !empty($register_form[0]['step1-subtitle']) ? $register_form[0]['step1-subtitle'] : trans('lang.join_for_good_reason');
    $reg_two_title = !empty($register_form) && !empty($register_form[0]['step2-title']) ? $register_form[0]['step2-title'] : trans('lang.register_step_2');
    $reg_two_subtitle = !empty($register_form) && !empty($register_form[0]['step2-subtitle']) ? $register_form[0]['step2-subtitle'] : '';
    $term_note = !empty($register_form) && !empty($register_form[0]['step2-term-note']) ? $register_form[0]['step2-term-note'] : trans('lang.agree_terms');
    $reg_three_title = !empty($register_form) && !empty($register_form[0]['step3-title']) ? $register_form[0]['step3-title'] : trans('lang.pro_info');
    $reg_three_subtitle = !empty($register_form) && !empty($register_form[0]['step3-subtitle']) ? $register_form[0]['step3-subtitle'] : '';
    $register_image = !empty($register_form) && !empty($register_form[0]['register_image']) ? '/uploads/settings/home/'.$register_form[0]['register_image'] : 'images/work.jpg';
    $verify_code_image = !empty($register_form) && !empty($register_form[0]['verify_code_image']) ? '/uploads/settings/home/'.$register_form[0]['verify_code_image'] : 'images/verify-code.png';
    $reg_page = !empty($register_form) && !empty($register_form[0]['step3-page']) ? $register_form[0]['step3-page'] : '';
    $reg_four_title = !empty($register_form) && !empty($register_form[0]['step4-title']) ? $register_form[0]['step4-title'] : trans('lang.congrats');
    $reg_four_subtitle = !empty($register_form) && !empty($register_form[0]['step4-subtitle']) ? $register_form[0]['step4-subtitle'] : trans('lang.acc_creation_note');
    $show_emplyr_inn_sec = !empty($register_form) && !empty($register_form[0]['show_emplyr_inn_sec']) ? $register_form[0]['show_emplyr_inn_sec'] : 'true';
    $show_freelancer_inn_sec = !empty($register_form) && !empty($register_form[0]['show_freelancer_inn_sec']) ? $register_form[0]['show_freelancer_inn_sec'] : 'true';
    $show_reg_form_banner = !empty($register_form) && !empty($register_form[0]['show_reg_form_banner']) ? $register_form[0]['show_reg_form_banner'] : 'true';
    $reg_form_banner = !empty($register_form) && !empty($register_form[0]['reg_form_banner']) ? $register_form[0]['reg_form_banner'] : null;
    $breadcrumbs_settings = \App\SiteManagement::getMetaValue('show_breadcrumb');
    $show_breadcrumbs = !empty($breadcrumbs_settings) ? $breadcrumbs_settings : 'true';
@endphp


@if (!empty($show_reg_form_banner) && $show_reg_form_banner === 'true')
    <div class="wt-haslayout wt-innerbannerholder" style="background-image:url({{{ asset(Helper::getBannerImage('uploads/settings/home/'.$reg_form_banner)) }}})">
        <div class="container"> 
            <div class="row justify-content-md-center">
                <div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
                    <div class="wt-innerbannercontent">
                        <div class="wt-title">
                            <h2>{{ trans('lang.join_for_free') }}</h2>
                        </div>
                        @if (!empty($show_breadcrumbs) && $show_breadcrumbs === 'true')
                            <ol class="wt-breadcrumb">
                                <li><a href="{{ url('/') }}">{{ trans('lang.home') }}</a></li>
                                <li class="wt-active">{{ trans('lang.join_now') }}</li>
                            </ol>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
<div class="wt-haslayout wt-main-section">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-xs-12 col-sm-12 col-md-10 push-md-1 col-lg-8 push-lg-2" id="registration">
                <div class="preloader-section" v-if="loading" v-cloak>
                    <div class="preloader-holder">
                        <div class="loader"></div>
                    </div>
                </div>
                <div class="wt-registerformhold">
                    <div class="wt-registerformmain">
                        <div class="wt-joinforms">
                            <form method="POST" action="{{{ url('register/form-step1-custom-errors') }}}" class="wt-formtheme wt-formregister" @submit.prevent="checkStep1" id="register_form">
                                @csrf
                                <fieldset class="wt-registerformgroup">
                                    <div class="wt-haslayout" v-if="step === 1" v-cloak>
                                        <div class="wt-registerhead">
                                            <div class="wt-title">
                                                <h3>{{{ $reg_one_title }}}</h3>
                                            </div>
                                            <div class="wt-description">
                                                <p>{{{ $reg_one_subtitle }}}</p>
                                            </div>
                                        </div>
                                        <ul class="wt-joinsteps">
                                            <li class="wt-active"><a href="javascrip:void(0);">{{{ trans('lang.01') }}}</a></li>
                                            <li><a href="javascrip:void(0);">{{{ trans('lang.02') }}}</a></li>
                                            <li><a href="javascrip:void(0);">{{{ trans('lang.03') }}}</a></li>
                                            <li><a href="javascrip:void(0);">{{{ trans('lang.04') }}}</a></li>
                                        </ul>
                                        <div class="form-group form-group-half">
                                            <input type="text" name="first_name" class="form-control" placeholder="{{{ trans('lang.ph_first_name') }}}" v-bind:class="{ 'is-invalid': form_step1.is_first_name_error }" v-model="first_name">
                                            <span class="help-block" v-if="form_step1.first_name_error">
                                                <strong v-cloak>@{{form_step1.first_name_error}}</strong>
                                            </span>
                                        </div>
                                        <div class="form-group form-group-half">
                                            <input type="text" name="last_name" class="form-control" placeholder="{{{ trans('lang.ph_last_name') }}}" v-bind:class="{ 'is-invalid': form_step1.is_last_name_error }" v-model="last_name">
                                            <span class="help-block" v-if="form_step1.last_name_error">
                                                <strong v-cloak>@{{form_step1.last_name_error}}</strong>
                                            </span>
                                        </div>
                                        <div class="form-group form-group-half">
                                            <input id="user_email" type="email" class="form-control" name="email" placeholder="{{{ trans('lang.ph_email') }}}" value="{{ old('email') }}" v-bind:class="{ 'is-invalid': form_step1.is_email_error }" v-model="user_email">
                                            <span class="help-block" v-if="form_step1.email_error">
                                                <strong v-cloak>@{{form_step1.email_error}}</strong>
                                            </span>
                                        </div>
                                        <div class="form-group form-group-half">
                                            <input type="text" name="phone" class="form-control" placeholder="{{{ trans('lang.ph_phone') }}}" v-bind:class="{ 'is-invalid': form_step1.is_phone_error }" v-model="phone">
                                            <span class="help-block" v-if="form_step1.phone_error">
                                                <strong v-cloak>@{{form_step1.phone_error}}</strong>
                                            </span>
                                        </div>
                                        <div class="form-group form-group-half">
                                            <input id="password" type="password" class="form-control" name="password" placeholder="{{{ trans('lang.ph_pass') }}}" v-bind:class="{ 'is-invalid': form_step1.is_password_error }" v-model="password">
                                            <span class="help-block" v-if="form_step1.password_error">
                                                <strong v-cloak>@{{form_step1.password_error}}</strong>
                                            </span>
                                        </div>
                                        <div class="form-group form-group-half">
                                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="{{{ trans('lang.ph_retry_pass') }}}" v-bind:class="{ 'is-invalid': form_step1.is_password_confirm_error }">
                                            <span class="help-block" v-if="form_step1.password_confirm_error">
                                                <strong v-cloak>@{{form_step1.password_confirm_error}}</strong>
                                            </span>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="wt-btn">{{{  trans('lang.btn_startnow') }}}</button>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset class="wt-registerformgroup">
                                  <div class="wt-haslayout" v-if="step === 2" v-cloak>
                                      <fieldset class="wt-registerformgroup">
                                          <div class="wt-registerhead">
                                              <div class="wt-title">
                                                  <h3>{{{ $reg_two_title }}}</h3>
                                              </div>
                                              @if (!empty($reg_two_subtitle))
                                                  <div class="wt-description">
                                                      <p>{{{ $reg_two_subtitle }}}</p>
                                                  </div>
                                              @endif
                                          </div>
                                          <ul class="wt-joinsteps">
                                              <li class="wt-done-next"><a href="javascrip:void(0);"><i class="fa fa-check"></i></a></li>
                                              <li class="wt-active"><a href="javascrip:void(0);">{{{ trans('lang.02') }}}</a></li>
                                              <li><a href="javascrip:void(0);">{{{ trans('lang.03') }}}</a></li>
                                              <li><a href="javascrip:void(0);">{{{ trans('lang.04') }}}</a></li>
                                          </ul>
                                          @if (!empty($locations) && false)
                                              <div class="form-group">
                                                  <span class="wt-select">
                                                      {!! Form::select('locations', $locations, null, array('placeholder' => trans('lang.select_locations'), 'v-bind:class' => '{ "is-invalid": form_step2.is_locations_error }')) !!}
                                                      <span class="help-block" v-if="form_step2.locations_error">
                                                          <strong v-cloak>@{{form_step2.locations_error}}</strong>
                                                      </span>
                                                  </span>
                                              </div>
                                          @endif
                                          @if(!empty($roles))
                                          <div class="wt-roles justify-content-md-center mt-4 mb-4">
                                            <div class="wt-roles-group btn-group justify-content-md-center" data-toggle="buttons">
                                            @foreach ($roles as $key => $role)
                                              @if (!in_array($role['id'] == 1, $roles))
                                              <label for="wt-role-{{{$role['id']}}}" class="btn btn-outline-primary" v-on:click.prevent="selectedRole('{{ $role['role_type'] }}','wt-role-{{$role['id']}}' )">
                                                <input class="mr-2"type="checkbox" id="wt-role-{{{$role['id']}}}" name="roles[]"  value="{{{ $role['role_type'] }}}" >
                                                      {{  trans('lang.choose_'.$role['name']) }}
                                              </label>
                                              @endif
                                            @endforeach
                                            </div>
                                          </div>
                                          @endif
                                          @if(!empty($categories))
                                          <div class="wt-registerhead">
                                            <div class="wt-description">
                                                    <p class="m-0">{{ trans('lang.choose_interest_categories') }}</p>
                                            </div>
                                          </div>
                                          <div class="wt-categories">                                          
                                            <div class="wt-categories-group justify-content-md-center" data-toggle="buttons">
                                            @foreach ($categories as $key => $category)
                                              <div class="col-6 col-lg-4 col-md-3 col-xl-3 pr-0 pl-0">
                                              <label for="wt-category-{{{$category->id}}}" class="btn btn-outline-primary m-1">
                                                <figure>
                                                  <img class="img"
                                                      src="{{{ asset(Helper::getCategoryImage($category->image)) }}}" alt="{{{ $category->title }}}">
                                                  <img  class="img_highlighted"
                                                      src="{{{ asset(Helper::getCategoryImage($category->image_highlighted)) }}}" alt="{{{ $category->title }}}">
                                                </figure>
                                                <input type="checkbox" id="wt-category-{{{$category->id}}}"  name="categories[]"  value="{{{$category->id}}}" style="clip:rect(0,0,0,0); position: absolute"> {{{ $category['title'] }}}
                                              </label>
                                              </div>
                                            @endforeach
                                            </div>
                                          </div>
                                          @endif 
                                          <div class="mt-4" style="float:left">
                                              <a href="#" @click.prevent="prev()" class="wt-btn">{{{ trans('lang.previous') }}}</a>
                                              <a href="#" @click.prevent="checkStep2('{{ trans('lang.email_not_config') }}')" class="wt-btn">{{{ trans('lang.continue') }}}</a>
                                          </div>                                       
                                      </fieldset>
                                  </div>
                                </fieldset>
                                <fieldset class="wt-registerformgroup">
                                  <div class="wt-haslayout" v-if="step === 3" v-cloak>
                                    <fieldset class="wt-registerformgroup">
                                      <div class="wt-registerhead">
                                        <div class="wt-title">
                                            <h3>{{{ $reg_three_title }}}</h3>
                                        </div>
                                        @if (!empty($reg_three_subtitle))
                                            <div class="wt-description">
                                                <p>{{{ $reg_three_subtitle }}}</p>
                                            </div>
                                        @endif
                                      </div>
                                      <ul class="wt-joinsteps">
                                          <li class="wt-done-next"><a href="javascrip:void(0);"><i class="fa fa-check"></i></a></li>
                                          <li class="wt-done-next"><a href="javascrip:void(0);"><i class="fa fa-check"></i></a></li>
                                          <li class="wt-active"><a href="javascrip:void(0);">{{{ trans('lang.03') }}}</a></li>
                                          <li><a href="javascrip:void(0);">{{{ trans('lang.04') }}}</a></li>
                                      </ul>
                                      <div class="wt-person-type justify-content-md-center mt-4 mb-4">
                                        <div class="wt-person-type-group btn-group btn-group-toggle justify-content-md-center" data-toggle="buttons">
                                          <label for="wt-person-type-1" class="btn btn-outline-primary active" v-on:click="setIsLegalPerson(false)">
                                            <input class="mr-2"type="radio" checked="" id="wt-person-type-1"  name="person_type" value="1">
                                            {{{ trans('lang.physical_person') }}}
                                          </label>
                                          <label for="wt-person-type-2" class="btn btn-outline-primary" v-on:click="setIsLegalPerson(true)">
                                            <input class="mr-2"type="radio" id="wt-person-type-2"  name="person_type" value="2">
                                            {{{ trans('lang.legal_person') }}}
                                          </label>
                                        </div>
                                      </div>
                                      <div v-if="!is_legal_person">
                                        @include('auth.register-non-legal-person')
                                      </div>                   
                                      <div v-if="is_legal_person">
                                        @include('auth.register-legal-person')   
                                      </div>                          
                                      <div class="mt-4 ml-1" style="float:left">
                                          <span class="wt-checkbox mb-4">
                                                <input id="termsconditions" type="checkbox" name="termsconditions" checked="">
                                                <label for="termsconditions"><span>{{{ $term_note }}}</span></label>
                                                <span class="help-block" v-if="form_step3.termsconditions_error">
                                                    <strong style="color: red;" v-cloak>{{trans('lang.register_termsconditions_error')}}</strong>
                                                </span>
                                          </span>
                                          <a href="#" @click.prevent="checkStep3('{{ trans('lang.email_not_config') }}')" class="wt-btn">{{{ trans('lang.continue') }}}</a>
                                      </div>  
                                    </fieldset>
                                  </div>
                                </fieldset>
                            </form>
                            <div class="wt-joinformc" v-if="step === 4" v-cloak>
                                <form method="POST" action="" class="wt-formtheme wt-formregister" id="verification_form">
                                    <div class="wt-registerhead">
                                        <div class="wt-title">
                                            <h3>{{{ $reg_three_title }}}</h3>
                                        </div>
                                        <div class="wt-description">
                                            <p>{{{ $reg_three_subtitle }}}</p>
                                        </div>
                                    </div>
                                    <ul class="wt-joinsteps">
                                        <li class="wt-done-next"><a href="javascrip:void(0);"><i class="fa fa-check"></i></a></li>
                                        <li class="wt-done-next"><a href="javascrip:void(0);"><i class="fa fa-check"></i></a></li>
                                        <li class="wt-done-next"><a href="javascrip:void(0);"><i class="fa fa-check"></i></a></li>
                                        <li class="wt-active"><a href="javascrip:void(0);">{{{ trans('lang.04') }}}</a></li>
                                    </ul>
                                    <figure class="wt-joinformsimg">
                                        <img src="{{ asset($verify_code_image)}}" alt="{{{ trans('lang.verification_code_img') }}}">
                                    </figure>
                                    <fieldset>
                                        <div class="form-group">
                                            <label>
                                                {{{ trans('lang.verify_code_note') }}}
                                                @if (!empty($reg_page))
                                                    <a target="_blank" href="{{{url($reg_page)}}}">
                                                        {{{ trans('lang.why_need_code') }}}
                                                    </a>
                                                @else
                                                    <a href="javascript:void(0)">
                                                        {{{ trans('lang.why_need_code') }}}
                                                    </a>
                                                @endif
                                            </label>
                                            <input type="text" name="code" class="form-control" placeholder="{{{ trans('lang.enter_code') }}}">
                                            <label class="mt-2">
                                              <a href="#" @click.prevent="resendCode()">{{{ trans('lang.resend_code') }}}</a>
                                            </label>
                                        </div>
                                        <div class="form-group wt-btnarea">
                                            <a href="#" @click.prevent="verifyCode()" class="wt-btn">{{{ trans('lang.continue') }}}</a>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="wt-registerformfooter">
                        <span>{{{ trans('lang.have_account') }}} <a id="wt-lg" href="javascript:void(0);" @click.prevent='scrollTop()'> {{{ trans('lang.btn_login_now') }}}</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection