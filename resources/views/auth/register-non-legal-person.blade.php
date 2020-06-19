  <div class="form-group form-group-half pr-1 pl-1">
    <input type="text" name="nationality" class="form-control" placeholder="{{{ trans('lang.ph_nationality') }}}" v-bind:class="{ 'is-invalid': form_step3.is_nationality_error }" v-model="nationality">
    <span class="help-block" v-if="form_step3.nationality_error">
        <strong v-cloak>@{{form_step3.nationality_error}}</strong>
      </span>
  </div>
  <div class="form-group form-group-half pr-1 pl-1">
    <input type="date" name="birthdate" class="form-control" placeholder="{{{ trans('lang.ph_birthdate') }}}" v-bind:class="{ 'is-invalid': form_step3.is_birthdate_error }" v-model="birthdate">
    <span class="help-block" v-if="form_step3.birthdate_error">
        <strong v-cloak>@{{form_step3.birthdate_error}}</strong>
    </span>
  </div>      
  @if (!empty($id_types))
    <div class="form-group form-group-half pr-1 pl-1">
      <span class="wt-select">
          {!! Form::select('id_type', $id_types, null, array('v-bind:class' => '{ "is-invalid": form_step3.is_id_types_error }')) !!}
          <span class="help-block" v-if="form_step3.id_types_error">
              <strong v-cloak>@{{form_step3.id_types_error}}</strong>
          </span>
      </span>
    </div>
  @endif    
  <div class="form-group form-group-half pr-1 pl-1">
    <input type="text" name="id_number" class="form-control" placeholder="{{{ trans('lang.ph_id_number') }}}" v-bind:class="{ 'is-invalid': form_step3.is_id_number_error }" v-model="id_number">
    <span class="help-block" v-if="form_step3.id_number_error">
        <strong v-cloak>@{{form_step3.id_number_error}}</strong>
    </span>
  </div>  
  @if (!empty($professions))
    <div class="form-group form-group-half pr-1 pl-1">
        <span class="wt-select">
            {!! Form::select('profession_id', $professions, null, array('placeholder' => trans('lang.profession'), 'v-model' => 'profession_id', 'v-bind:class' => '{ "is-invalid": form_step3.is_professions_error }')) !!}
            <span class="help-block" v-if="form_step3.professions_error">
                <strong v-cloak>@{{form_step3.professions_error}}</strong>
            </span>
        </span>
    </div>
  @endif
  @if (!empty($grades))
      <div class="form-group form-group-half pr-1 pl-1">
          <span class="wt-select">
              {!! Form::select('grade_id', \Illuminate\Support\Arr::pluck($grades, 'title', 'id'), null, array('placeholder' => trans('lang.grade'), 'v-model' => 'grade_id', 'v-bind:class' => '{ "is-invalid": form_step3.is_grades_error }')) !!}
              <span class="help-block" v-if="form_step3.grades_error">
                  <strong v-cloak>@{{form_step3.grades_error}}</strong>
              </span>
          </span>
      </div>
  @endif