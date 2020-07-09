<template>
    <div class="wt-haslayout wt-bannerholdervtwo wt-bannerholderthree">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                    <div class="wt-bannercontent" v-bind:class="{ 'float-right': alignRight }">
                        <div class="wt-bannerhead">
                          <div v-for="(slide, index) in slider.slider_image" :key="index">
                            <div class="wt-title" v-if="sliderIndex === index" >
                                <h1><span><em>{{trans('lang.home_slider.'+(index+1)+'.title')}}</em></span>
                                    {{trans('lang.home_slider.' +(index+1)+'.subtitle')}}
                                </h1>
                            </div>
                          </div>
                          <div class="wt-description" v-if="slider.description" v-html="slider.description"></div>
                        </div>
                        
                        <search-form v-if="!linkToJobs && !linkToFreelancer"
                        :widget_type="'home'"
                        :placeholder="trans('lang.looking_for')"
                        :freelancer_placeholder="trans('lang.search_filter_list.freelancer')"
                        :employer_placeholder="trans('lang.search_filter_list.employers')"
                        :job_placeholder="trans('lang.search_filter_list.jobs')"
                        :service_placeholder="trans('lang.search_filter_list.services')"
                        :no_record_message="trans('lang.no_record')"
                        @on-activate="handleOnActivate"
                        @on-deactivate="handleOnDeactivate"
                        >
                        </search-form>
                        <div v-if="linkToFreelancer || linkToJobs" class="cta-btn">
                          <a v-if="linkToFreelancer" v-bind:href="appUrl + '/search-results?type=freelancer'" class="wt-btn">{{trans('lang.connect_to_a_freelancer')}}</a>
                          <a v-if="linkToJobs" v-bind:href="appUrl + '/search-results?type=job'" class="wt-btn">{{trans('lang.join_to_a_project')}}</a>
                        </div>
                        <div class="wt-videoholder" v-if="slider.video_link && slider.video_link !='#'">
                            <div class="wt-videoshow">
                                <a data-rel="prettyPhoto[video]" :href="slider.video_link" rel="prettyPhoto[video]"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="wt-videocontent" v-if="slider.video_description">
                                 <span><em>{{slider.video_description}}</em></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                    <div class="wt-bannerslider-holder">
                        <div id="wt-bannerslider-two" class="wt-bannerslider-two owl-carousel">
                            <div class="item" v-for="(slide, index) in slider.slider_image" :key="index">
                                <figure class="wt-bannerimg">
                                    <img :src="imageUrl+slide" alt="slideimg">
                                </figure>
                            </div>
                        </div>
                        <figure class="wt-slidericons">
                             <img :src="imageUrl+slider.floating_image01" alt="img description">
                             <img :src="imageUrl+slider.floating_image02" alt="img description">
                        </figure>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props:['page_id'],
    data() {
        return {
            imageUrl:APP_URL+'/uploads/pages/'+this.page_id+'/',
            appUrl: APP_URL,
            slider:[],
            sliderIndex:0,
            alignRight: true,
            linkToJobs: false,
            linkToFreelancer: false,
        }
    },
    updated() {
        var self = this;
        var slider = jQuery('.owl-carousel')
        var carousel = slider.owlCarousel({
            items: 1,
            animateOut: 'fadeOut',
            animateIn: 'fadeIn',
            loop:true,
            nav:false,
            margin: 0,
            autoplay:true,
        });
        carousel.on('changed.owl.carousel', function(event) {
            self.sliderIndex = event.page.index;
            self.alignRight = (self.sliderIndex == 0);
            self.linkToFreelancer =(self.sliderIndex == 1);
            self.linkToJobs = (self.sliderIndex == 2);
        })
        jQuery("a[data-rel]").each(function () {
            jQuery(this).attr("rel", jQuery(this).data("rel"));
        });
        jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({
            animation_speed: 'normal',
            theme: 'dark_square',
            slideshow: 3000,
            default_width: 800,
            default_height: 500,
            allowfullscreen: true,
            autoplay_slideshow: false,
            social_tools: false,
            iframe_markup: "<iframe src='{path}' width='{width}' height='{height}' frameborder='no' allowfullscreen='true'></iframe>",
            deeplinking: false
        });
    },
    methods:{
        getSlider: function() {
            var self = this;
            axios
            .get(APP_URL + "/get-home-slider/"+self.page_id)
            .then(function(response) {
                if (response.data.type == "success") {
                   self.slider = response.data.slider
                }
            })
            .catch(function(error) {  });
        },
        handleOnActivate(event) {
          var slider = jQuery('.owl-carousel');
          slider.trigger('stop.owl.autoplay');
        },
        handleOnDeactivate(event) {
          var slider = jQuery('.owl-carousel');
          slider.trigger('play.owl.autoplay',[1000]);
        }
    },
    created: function() {
        this.getSlider()
    },
};
</script>