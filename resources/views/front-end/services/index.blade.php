@extends(file_exists(resource_path('views/extend/front-end/master.blade.php')) ? 
'extend.front-end.master':
 'front-end.master', ['body_class' => 'wt-innerbgcolor'] )
@push('stylesheets')
    <link href="{{ asset('css/owl.carousel.min.css') }}" rel="stylesheet">
@endpush
@section('title'){{ $service_list_meta_title }} @stop
@section('description', $service_list_meta_desc)
@section('keywords', $service_list_meta_keywords)
@section('content')
    @if ($show_service_banner == 'true')
        @php $breadcrumbs = Breadcrumbs::generate('searchResults'); @endphp
        <div class="wt-haslayout wt-innerbannerholder" style="background-image:url({{{ asset(Helper::getBannerImage($service_inner_banner, 'uploads/settings/general')) }}})">
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-8 push-lg-3">
                        <div class="wt-innerbannercontent">
                            <div class="wt-title">
                                <h2>{{ trans('lang.services') }}</h2>
                            </div>
                            @if (!empty($show_breadcrumbs) && $show_breadcrumbs === 'true')
                                @if (count($breadcrumbs))
                                    <ol class="wt-breadcrumb">
                                        @foreach ($breadcrumbs as $breadcrumb)
                                            @if ($breadcrumb->url && !$loop->last)
                                                <li><a href="{{{ $breadcrumb->url }}}">{{{ $breadcrumb->title }}}</a></li>
                                            @else
                                                <li class="active">{{{ $breadcrumb->title }}}</li>
                                            @endif
                                        @endforeach
                                    </ol>
                                @endif
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif
    @if (!empty($categories) && $categories->count() > 0)
        <div class="wt-categoriesslider-holder wt-haslayout {{$show_service_banner == 'false' ? 'la-categorty-top-mt' : ''}}">
            <div id="wt-categoriesslider" class="wt-categoriesslider owl-carousel">
                @foreach ($categories as $cat)
                    @php
                        $category = \App\Category::find($cat->id);
                        $active = (!empty($_GET['category']) && in_array($cat->id, $_GET['category'])) ? 'active-category' : '';
                        $active_wrapper = ( !empty($_GET['category']) && in_array($cat->id, $_GET['category'])) ? 'active-category-wrapper' : '';
                    @endphp
                    <div class="wt-categoryslidercontent item {{$active_wrapper}}">
                        <figure><img src="{{{ asset(Helper::getCategoryImage($cat->image)) }}}" alt="{{{ $cat->title }}}"></figure>
                        <div class="wt-cattitle">
                        <h3><a href="{{{url('search-results?type=service&category%5B%5D='.$cat->slug)}}}" class="{{$active}}">{{{ $cat->title }}}</a></h3>
                            <span>Items: {{{$category->services->count()}}}
                            </span>

                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @endif
    <div class="wt-haslayout wt-main-section" id="services">
        @if (Session::has('payment_message'))
            @php $response = Session::get('payment_message') @endphp
            <div class="flash_msg">
                <flash_messages :message_class="'{{{$response['code']}}}'" :time ='5' :message="'{{{ $response['message'] }}}'" v-cloak></flash_messages>
            </div>
        @endif
        <div class="wt-haslayout">
            <div class="container">
                <div class="row">
                    <div id="wt-twocolumns" class="wt-twocolumns wt-haslayout">
                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-4 float-left">
                            @if (file_exists(resource_path('views/extend/front-end/services/filters.blade.php'))) 
                                @include('extend.front-end.services.filters')
                            @else 
                                @include('front-end.services.filters')
                            @endif
                        </div>

                        <div class="col-12 col-sm-12 col-md-7 col-lg-7 col-xl-8 float-left">
                            <div class="wt-userlistingholder wt-haslayout">
                                <div class="wt-userlistingtitle">
                                    @if (!empty($services))
                                        <span>{{$services->count()}} de {{$services_total_records}} resultado @if (!empty($keyword)) for <em>"{{{$keyword}}}"</em> @endif</span>
                                    @endif
                                </div> 
                                    @if (!empty($services) && $services->count() > 0)
                                        @foreach ($services as $service)
                                            @php 
                                                $service_reviews = $service->seller->count() > 0 ? Helper::getServiceReviews($service->seller[0]->id, $service->id) : ''; 
                                                $service_rating=0;
                                                if(!empty($service_reviews)) {
                                                    $service_rating = $service_reviews->sum('avg_rating') != 0 ? round($service_reviews->sum('avg_rating') / $service_reviews->count()) : 0;
                                                }
                                                $attachments = Helper::getUnserializeData($service->attachments);
                                                $no_attachments = empty($attachments) ? 'la-service-info' : '';
                                                $enable_slider = !empty($attachments) ? 'wt-servicesslider' : '';
                                                $total_orders = Helper::getServiceCount($service->id, 'hired');
                                            @endphp
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 float-left">
                                                <div class="wt-freelancers-info {{$no_attachments}}">
                                                    @if ($service->seller->count() > 0)
                                                        @if (!empty($attachments))
                                                            @php $enable_slider = count($attachments) > 1 ? 'wt-freelancerslider owl-carousel' : ''; @endphp
                                                            <div class="wt-freelancers {{{$enable_slider}}}">
                                                                @foreach ($attachments as $attachment)
                                                                    <figure class="item">
                                                                        <a href="{{{url('service/'.$service->slug)}}}"><img src="{{{asset(Helper::getImageWithSize('uploads/services/'.$service->seller[0]->id, $attachment, 'medium'))}}}" alt="img description" class="item"></a>
                                                                    </figure>
                                                                @endforeach
                                                            </div>
                                                        @endif
                                                    @endif
                                                    @if ($service->is_featured == 'true')
                                                        <span class="wt-featuredtagvtwo">{{ trans('lang.featured') }}</span>
                                                    @endif
                                                    <div class="wt-freelancers-details">
                                                        @if ($service->seller->count() > 0)
                                                            <figure class="wt-freelancers-img">
                                                                <img src="{{ asset(Helper::getProfileImage($service->seller[0]->id)) }}" alt="img description">
                                                            </figure>
                                                        @endif
                                                        <div class="wt-freelancers-content">
                                                            <div class="dc-title">
                                                                @if ($service->seller->count() > 0)
                                                                    <a href="{{{url('service/'.$service->slug)}}}"><i class="fa fa-check-circle"></i> {{{Helper::getUserName($service->seller[0]->id)}}}</a>
                                                                @endif
                                                                <a href="{{{url('service/'.$service->slug)}}}"><h3>{{{$service->title}}}</h3></a>
                                                                <span><strong>{{ (!empty($symbol['symbol'])) ? $symbol['symbol'] : '$' }}{{{$service->price}}}</strong> {{trans('lang.starting_from')}}</span>
                                                            </div>
                                                        </div>
                                                        <div class="wt-freelancers-rating">
                                                            <ul>
                                                                <li><span><i class="fa fa-star"></i>{{{ $service_rating }}}/<i>5</i> ({{{!empty($service_reviews) ? $service_reviews->count() : ''}}})</span></li>
                                                                <li>
                                                                    @if ($total_orders > 0)
                                                                        <i class="fa fa-spinner fa-spin"></i>
                                                                    @endif
                                                                    {{{$total_orders}}} {{ trans('lang.in_queue') }}
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                        @if ( method_exists($services,'links') )
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-12 float-left">
                                                {{ $services->links('pagination.custom') }}
                                            </div>
                                        @endif
                                    @else
                                        @if (file_exists(resource_path('views/extend/errors/no-record.blade.php'))) 
                                            @include('extend.errors.no-record')
                                        @else 
                                            @include('errors.no-record')
                                        @endif
                                    @endif
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection
@push('scripts')
    <script src="{{ asset('js/owl.carousel.min.js') }}"></script>
    <script>
        var _wt_freelancerslider = jQuery('.wt-freelancerslider')
        _wt_freelancerslider.owlCarousel({
            items: 1,
            loop:true,
            nav:true,
            margin: 0,
            autoplay:false,
            navClass: ['wt-prev', 'wt-next'],
            navContainerClass: 'wt-search-slider-nav',
            navText: ['<span class="lnr lnr-chevron-left"></span>', '<span class="lnr lnr-chevron-right"></span>'],
        });
    </script>
    <script>
        if (APP_DIRECTION == 'rtl') {
            var direction = true;
        } else {
            var direction = false;
        }
        
        jQuery("#wt-categoriesslider").owlCarousel({
            item: 6,
            rtl:direction,
            loop:true,
            nav:true,
            margin: 0,
            autoplay:true,
            center: true,
            responsiveClass:true,
            navText:["<img src='images/prettyPhoto/dark_rounded/owlPrev.png'>","<img src='images/prettyPhoto/dark_rounded/owlNext.png'>"],
            responsive:{
                0:{items:1,},
                481:{items:2,},
                768:{items:3,},
                1280:{items:5,},
                1440:{items:5,},
                1760:{items:6,}
            }
        });
    </script>
@endpush
