<?php
/**
 * Class ResetPasswordController
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @version <PHP: 1.0.0>
 * @link    http://www.amentotech.com
 */
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Support\Facades\Password;
/**
 * Class ResetPasswordController
 *
 */
class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    use ResetsPasswords;

    /**
     * Where to redirect users after resetting their password.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    protected function rules()
    {
        return [
            'token' => 'required',
            'email' => 'required|email',
            'password' => [
              'required',
              'string',
              'min:8',
              function ($attribute, $value, $fail) {
                  if ($value === strtolower($value)) {
                    $fail(trans('validation.alpha_with_uppercase_and_numeric', ['attribute' => $attribute]));
                  }
                  if (preg_match('~[0-9]~', $value) !== 1) {
                    $fail(trans('validation.alpha_with_uppercase_and_numeric', ['attribute' => $attribute]));
                  }
                }
            ],
        ];
    }
}
