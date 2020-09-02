<?php
/**
 * Class VerificationController
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\VerifiesEmails;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Verified;
use Illuminate\Auth\Access\AuthorizationException;
use Session;
use App\User;

/**
 * Class VerificationController
 *
 */
class VerificationController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Email Verification Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling email verification for any
    | user that recently registered with the application. Emails may also
    | be re-sent if the user didn't receive the original email message.
    |
    */

    use VerifiesEmails;

    /**
     * Where to redirect users after verification.
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
        //$this->middleware('auth');
        $this->middleware('signed')->only('verify');
        $this->middleware('throttle:6,1')->only('verify', 'resend');
    }

     /**
     * Mark the authenticated user's email address as verified.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function verify(Request $request)
    {
      
        if(!$request->user()){
          session()->put(['verify_redirect_url' => $request->fullUrl()]);
          session()->put(['verify_user_id' => $request->route('id')]);
          return redirect('/login');
        }

        if ($request->route('id') != $request->user()->getKey()) {
            throw new AuthorizationException;
        }

        if ($request->user()->hasVerifiedEmail()) {
            return redirect($this->redirectPath());
        }

        if ($request->user()->markEmailAsVerified()) {
            event(new Verified($request->user()));
        }

        $user_role_type = User::getUserRoleType($request->route('id'));
        if (empty($user_role_type)) {
            Session::flash('error', trans('Unfortunately you have been logged out due to in-sufficient role privileges for you account, For Further details contact to administrator'));
            Auth::logout();
            return redirect('/');
        }
        Session::flash("message", "Su cuenta ha sido verificada");
        $user_role = $user_role_type->role_type;
        if ($user_role === 'freelancer') {
            return redirect('professional/dashboard');
        } elseif ($user_role === 'employer') {
            return  redirect('employer/dashboard');
        } else {
          return redirect($this->redirectPath())->with('verified', true);
        }
    }
}
