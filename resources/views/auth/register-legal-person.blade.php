  <div class="form-group form-group-half pr-1 pl-1">
      <input type="text" name="company_name" class="form-control" placeholder="{{{ trans('lang.ph_company_name') }}}" v-bind:class="{ 'is-invalid': form_step3.is_company_name_error }" v-model="company_name">
      <span class="help-block" v-if="form_step3.company_name_error">
          <strong v-cloak>@{{form_step3.company_name_error}}</strong>
      </span>
  </div>
  <div class="form-group form-group-half pr-1 pl-1">
      <input type="text" name="rnc" class="form-control" placeholder="{{{ trans('lang.ph_rnc') }}}" v-bind:class="{ 'is-invalid': form_step3.is_rnc_error }" v-model="rnc">
      <span class="help-block" v-if="form_step3.rnc_error">
          <strong v-cloak>@{{form_step3.rnc_error}}</strong>
      </span>
  </div>
  <div class="form-group form-group-half pr-1 pl-1">
      <input type="text" name="contact_name" class="form-control" placeholder="{{{ trans('lang.ph_contact_name') }}}" v-bind:class="{ 'is-invalid': form_step3.is_contact_name_error }" v-model="contact_name">
      <span class="help-block" v-if="form_step3.contact_name_error">
          <strong v-cloak>@{{form_step3.contact_name_error}}</strong>
      </span>
  </div>
  <div class="form-group form-group-half pr-1 pl-1">
      <input type="text" name="position" class="form-control" placeholder="{{{ trans('lang.ph_position') }}}" v-bind:class="{ 'is-invalid': form_step3.is_position_error }" v-model="position">
      <span class="help-block" v-if="form_step3.position_error">
          <strong v-cloak>@{{form_step3.position_error}}</strong>
      </span>
  </div>
  @if (!empty($camaras))
      <div class="form-group form-group-half pr-1 pl-1">
          <span class="wt-select">
              {!! Form::select('camara_id', $camaras, null, array('placeholder' => trans('lang.select_camaras'), 'v-model' => 'camara_id', 'v-bind:class' => '{ "is-invalid": form_step3.is_camaras_error }')) !!}
              <span class="help-block" v-if="form_step3.camaras_error">
                  <strong v-cloak>@{{form_step3.camaras_error}}</strong>
              </span>
          </span>
      </div>
  @endif
  <div class="form-group form-group-half pr-1 pl-1">
      <input type="text" name="nr" class="form-control" placeholder="{{{ trans('lang.ph_nr') }}}" v-bind:class="{ 'is-invalid': form_step3.is_nr_error }" v-model="nr">
      <span class="help-block" v-if="form_step3.nr_error">
          <strong v-cloak>@{{form_step3.nr_error}}</strong>
      </span>
  </div>