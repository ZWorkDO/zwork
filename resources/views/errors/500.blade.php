@extends(file_exists(resource_path('views/extend/front-end/master.blade.php')) ? 'extend.front-end.master' : 'front-end.master')
@section('content')
    @php
    if (Schema::hasTable('site_managements')) {
        $breadcrumbs_settings = \App\SiteManagement::getMetaValue('show_breadcrumb');
        $show_breadcrumbs = !empty($breadcrumbs_settings) ? $breadcrumbs_settings : 'true';
    } else {
        $show_breadcrumbs ='';
    }
    
    @endphp
    <div class="wt-haslayout wt-main-section">
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-xs-12 col-sm-12 col-md-10 push-md-1 col-lg-8 push-lg-2">
                    <div class="wt-500errorpage">
                        <figure class="wt-500errorimg"><img src="{{{ asset('images/500-img.png') }}}" alt="{{ trans('lang.500_img') }}"></figure>
                        <div class="wt-500errorcontent">
                            <div class="wt-title">
                                <h3>{{ trans('lang.link_crashed') }}</h3>
                            </div>
                            <div class="wt-description">
                                <p>{{ trans('lang.crashed_note') }} <a href="{{{ url('/') }}}">{{ trans('lang.homepage') }}</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection