@php
    $countries      = Helper::getCountries();
@endphp
<div class="wt-tabscontenttitle">
    <h2>{{{ trans('lang.your_billing_address') }}}</h2>
</div>
<div class="wt-settingscontent">
    <fieldset>
        <div class="form-group form-group-half">
            {!! Form::text( 'first_name', e($first_name), ['class' =>'form-control', 'placeholder' => trans('lang.ph_first_name')] ) !!}
        </div>
        <div class="form-group form-group-half">
            {!! Form::text( 'last_name', e($last_name), ['class' =>'form-control', 'placeholder' => trans('lang.ph_last_name')] ) !!}
        </div>
        <div class="form-group form-group">
            {!! Form::text( 'address_line1', e($address_line1), ['class' =>'form-control', 'placeholder' => trans('lang.ba_address_line_1')] ) !!}
        </div>
        <div class="form-group form-group">
            {!! Form::text( 'address_line2', e($address_line2), ['class' =>'form-control', 'placeholder' => trans('lang.ba_address_line_2')] ) !!}
        </div>
        <div class="form-group form-group-half">
            {!! Form::text( 'city', e($city), ['class' =>'form-control', 'placeholder' => trans('lang.ba_city')] ) !!}
        </div>
        <div class="form-group form-group-half">
            {!! Form::text( 'state', e($state), ['class' =>'form-control', 'placeholder' => trans('lang.ba_state')] ) !!}
        </div>
        <div class="form-group form-group-half">
            {!! Form::select('country', $countries, e($country), array('class' => '', 'placeholder' => trans('lang.ba_country'))) !!}
        </div>
    </fieldset>
</div>