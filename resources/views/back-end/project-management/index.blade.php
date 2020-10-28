@extends(file_exists(resource_path('views/extend/back-end/master.blade.php')) ? 'extend.back-end.master' : 'back-end.master')
@section('content')
    <section class="wt-haslayout wt-dbsectionspace">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="wt-dashboardbox wt-messages-holder">
                    <div class="wt-dashboardboxtitle">
                        <h2>{{ trans('lang.manage_tasks') }}</h2>
                        <!-- <h2>{{ trans('lang.msgs') }}</h2> -->
                    </div>
                    <iframe class="clickup-embed" src="https://share.clickup.com/b/h/5-10781634-2/b02c2a3055e00bd" frameborder="0" onmousewheel="" width="100%" height="700px" style="background: transparent; border: 1px solid #ccc;"></iframe>
                </div>
            </div>
        </div>
    </section>
@endsection
