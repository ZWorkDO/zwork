@php
    $id_types       = Helper::getIDTypeList();
    $grades         = App\Grade::select('title', 'id')->get()->pluck('title', 'id')->toArray();
    $professions    = App\Profession::select('title', 'id')->get()->pluck('title', 'id')->toArray();
    $camaras        = App\Camara::select('title', 'id')->get()->pluck('title', 'id')->toArray();
@endphp
<div class="wt-tabscontenttitle">
    <h2>{{{ trans('lang.your_personal_info') }}}</h2>
</div>
<div class="wt-formtheme">
    <fieldset>
        <div class="form-group form-group-half">
            {!! Form::text( 'first_name', e(Auth::user()->first_name), ['class' =>'form-control', 'placeholder' => trans('lang.ph_first_name')] ) !!}
        </div>
        <div class="form-group form-group-half">
            {!! Form::text( 'last_name', e(Auth::user()->last_name), ['class' =>'form-control', 'placeholder' => trans('lang.ph_last_name')] ) !!}
        </div>
        <div class="form-group  form-group-half">
            {!! Form::text( 'nationality', e($nationality), ['class' =>'form-control', 'placeholder' => trans('lang.ph_nationality')] ) !!}
        </div> 
        <div class="form-group  form-group-half">
            {!! Form::date( 'birthdate', e($birthdate), ['class' =>'form-control', 'placeholder' => trans('lang.ph_birthdate')] ) !!}
        </div>  
        <div class="form-group  form-group-half">
            <span class="wt-select">
              {!! Form::select('id_type', $id_types, e($id_type), []) !!} 
            </span>
        </div> 
        <div class="form-group  form-group-half">
            {!! Form::text( 'id_number', e($id_number), ['class' =>'form-control', 'placeholder' => trans('lang.ph_id_number')] ) !!}
        </div>  
        <div class="form-group  form-group-half">
            <span class="wt-select">
              {!! Form::select('profession_id', $professions, e($profession_id), ['class' =>'form-control', 'placeholder' => trans('lang.profession')]) !!} 
            </span>
        </div> 
        <div class="form-group  form-group-half">
            <span class="wt-select">
              {!! Form::select('grade_id', $grades, e($grade_id), ['class' =>'form-control', 'placeholder' => trans('lang.grade')]) !!} 
            </span>
        </div> 
        @if($is_legal_person)
          {!! Form::hidden('is_legal_person', $is_legal_person) !!}
          <div class="form-group form-group-half">
              {!! Form::text( 'company_name', e($company_name), ['class' =>'form-control', 'placeholder' => trans('lang.ph_company_name')] ) !!}
          </div>
          <div class="form-group form-group-half">
              {!! Form::text( 'rnc', e($rnc), ['class' =>'form-control', 'placeholder' => trans('lang.ph_rnc')] ) !!}
          </div>
          <div class="form-group form-group-half">
              {!! Form::text( 'contact_name', e($contact_name), ['class' =>'form-control', 'placeholder' => trans('lang.ph_contact_name')] ) !!}
          </div>
          <div class="form-group form-group-half">
              {!! Form::text( 'position', e($position), ['class' =>'form-control', 'placeholder' => trans('lang.ph_position')] ) !!}
          </div>
          <div class="form-group  form-group-half">
            <span class="wt-select">
              {!! Form::select('camara_id', $camaras, e($camara_id), ['placeholder' => trans('lang.select_camaras')]) !!} 
            </span>
          </div> 
          <div class="form-group form-group-half">
              {!! Form::text( 'nr', e($nr), ['class' =>'form-control', 'placeholder' => trans('lang.ph_nr')] ) !!}
          </div>
       @endif
    </fieldset>
</div>