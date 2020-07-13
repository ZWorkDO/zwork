@extends(file_exists(resource_path('views/extend/front-end/master.blade.php')) ? 'extend.front-end.master' : 'front-end.master')

@section('content')

<div class="container">
   <div class="row">
      <div class="col-12 col-sm-12 col-md-12 col-lg-12 float-left">
         <div class="dc-howitwork-hold dc-haslayout">
            <div class="dc-haslayout dc-main-section">
               <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                  <div class="wt-greeting-holder m-4">
                     <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-7 float-left">
                           <div class="wt-greetingcontent">
                              <div class="wt-sectionhead">
                                <div class="wt-sectiontitle">
                                  <h2>{{ __('Verifica tu correo electrónico') }}</h2>
                                </div>
                                <div class="wt-description">
                                  @if (session('resent'))
                                    <div class="alert alert-success" role="alert">
                                        {{ __('Un nuevo enlace de verificación ha sido enviado a tu correo electrónico.') }}
                                    </div>
                                  @endif
                                  <br>
                                  {{ __('Antes de proceder, por favor verifica tu cuenta usando el enlace de verificación que hemos enviado a tu correo electrónico.') }}
                                  <br>
                                  <br>
                                  {{ __('Si no has recibido un correo electrónico de verificación de tu cuenta') }}, <a href="{{ route('verification.resend') }}">{{ __('haz click aquí para solicitar otro') }}</a>.
                                </div>
                              </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

@endsection
