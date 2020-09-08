<?php

namespace Illuminate\Auth\Notifications;

use Illuminate\Support\Facades\Lang;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPassword extends Notification
{
    /**
     * The password reset token.
     *
     * @var string
     */
    public $token;

    /**
     * The callback that should be used to build the mail message.
     *
     * @var \Closure|null
     */
    public static $toMailCallback;

    /**
     * Create a notification instance.
     *
     * @param  string  $token
     * @return void
     */
    public function __construct($token)
    {
        $this->token = $token;
    }

    /**
     * Get the notification's channels.
     *
     * @param  mixed  $notifiable
     * @return array|string
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Build the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        if (static::$toMailCallback) {
            return call_user_func(static::$toMailCallback, $notifiable, $this->token);
        }

        $mail = (new MailMessage)
            // ->from("ZWork")
            ->subject(Lang::getFromJson('Reset Password Notification'))
            ->line(Lang::getFromJson('Nos enteramos de que olvidaste la contraseña de tu cuenta, pero no te preocupes. Haciendo click en el botón debajo podrás volver a crear una nueva.'))
            ->action(Lang::getFromJson('Restablecer contraseña'), url(config('app.url').route('password.reset', $this->token, false)))
            ->line(Lang::getFromJson('Ese enlace se expira en :count minutos.', ['count' => config('auth.passwords.users.expire')]))
            ->line(Lang::getFromJson('Si no fuiste quién solicitó un cambio de contraseña, por favor ignorar este mensaje.'));
        // dd($mail);    

        return $mail;
    }
    /**
     * Set a callback that should be used when building the notification mail message.
     *
     * @param  \Closure  $callback
     * @return void
     */
    public static function toMailUsing($callback)
    {
        static::$toMailCallback = $callback;
    }
}
