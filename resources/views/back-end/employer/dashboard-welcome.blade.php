@extends(file_exists(resource_path('views/extend/back-end/master.blade.php')) ? 'extend.back-end.master' : 'back-end.master')
@section('content')
    <section class="wt-haslayout wt-dbsectionspace wt-insightuser" id="dashboard">
        <div class="wt-textwelcome">
            <h2 class="wt-textwelcome">¡Bienvenido a tu Z|Cuenta!</h2>
            <h3 class="wt-textwelcome">Recuerda mantener la configuración de tu perfil siempre actualizada, para aumentar la visibilidad de tus propuestas y generar mas oportunidades de colaboración en la plataforma Z|.</h3>
        </div>
        <div class="wt-welcomebackground">
            <img class="wt-welcomebackground" src="{{ url('images/Welcome-500x500-Branding-Cuenta-del-Cliente.jpg.png') }}" alt="">
        </div>
        
    </section>
@endsection
