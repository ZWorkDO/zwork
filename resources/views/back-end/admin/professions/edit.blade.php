@extends(file_exists(resource_path('views/extend/back-end/master.blade.php')) ? 'extend.back-end.master' : 'back-end.master')
@section('content') 
    <div class="dpts-listing" id="dpt-list"></div>
        @if (Session::has('message'))
            <div class="flash_msg">
                <flash_messages :message_class="'success'" :time ='5' :message="'{{{ Session::get('message') }}}'" v-cloak></flash_messages>
            </div>
        @elseif (Session::has('error'))
            <div class="flash_msg">
                <flash_messages :message_class="'danger'" :time ='5' :message="'{{{ Session::get('error') }}}'" v-cloak></flash_messages>
            </div>
        @endif
        <section class="wt-haslayout wt-dbsectionspace">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-6 float-left">
                    <div class="wt-dashboardbox">
                        <div class="wt-dashboardboxtitle">
                            <h2>{{{ trans('lang.edit_profession') }}}</h2>
                        </div>
                        <div class="wt-dashboardboxcontent">
                            {!! Form::open([
                                'url' => url('admin/professions/update-professions/'.$professions->id.''), 'class' =>'wt-formtheme
                                wt-formprojectinfo wt-formcategory','id' => 'professions'])
                            !!}
                                <fieldset>
                                    <div class="form-group">
                                        {!! Form::text('profession_title', e($professions['title']), ['class' =>'form-control'.($errors->has('profession_title') ? ' is-invalid' : '')]) !!}
                                        <span class="form-group-description">{{{ trans('lang.desc') }}}</span>
                                        @if ($errors->has('profession_title'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('profession_title') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        {!! Form::textarea( 'profession_desc', e($professions['description']), ['class' =>'form-control',
                                            'placeholder' => trans('lang.ph_desc')] )
                                        !!}
                                        <span class="form-group-description">{{{ trans('lang.cat_desc') }}}</span>
                                    </div>
                                    <div class="form-group wt-btnarea">
                                        {!! Form::submit(trans('lang.update_profession'), ['class' => 'wt-btn']) !!}
                                    </div>
                                </fieldset>
                            {!! Form::close(); !!}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
