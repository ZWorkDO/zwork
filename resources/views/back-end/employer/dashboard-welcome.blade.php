@extends(file_exists(resource_path('views/extend/back-end/master.blade.php')) ? 'extend.back-end.master' : 'back-end.master')
@section('content')
    <section class="wt-haslayout wt-dbsectionspace wt-insightuser" id="dashboard">
        @if (Session::has('message'))
            <div class="flash_msg">
                <flash_messages :message_class="'success'" :time ='5' :message="'{{{ Session::get('message') }}}'" v-cloak></flash_messages>
            </div>
            @php session()->forget('message');  @endphp
        @endif
        <div class="wt-textdefault ">
            <h1 class="wt-textdefault ">¡Bienvenido a tu Z|Cuenta!</h1>
            <h3 class="wt-textdefault ">Recuerda mantener la configuración de tu perfil siempre actualizada, para aumentar la visibilidad de tus propuestas y generar mas oportunidades de colaboración en la plataforma Z|.</h3>
        </div>
        <div class="wt-welcomebackground">
            <img class="wt-welcomebackground" src="{{ url('../images/Diseño-500x500-Branding-Cuenta-del-Cliente.jpg.png') }}" alt="">
        </div>
        
    </section>
@endsection
