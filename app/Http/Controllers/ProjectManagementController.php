<?php
/**
 * Class ProjectManagementController.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @version <PHP: 1.0.0>
 * @link    http://www.amentotech.com
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use DB;
use App\User;
use App\Helper;
use Auth;
use Carbon\Carbon;
use App\SiteManagement;

/**
 * Class ProjectManagementController
 *
 */
class ProjectManagementController extends Controller
{
    protected $message;

    /**
     * Create a new controller instance.
     *
     * @param mixed $message make instance
     *
     * @return void
     */
    public function __construct(Message $message)
    {
        $this->message = $message;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::user()) {
            $users = '';
            $users =  $this->message::select('user_id')->where('receiver_id', auth()->user()->id)->groupBy('user_id')->get();
            
            return View(
                'back-end.project-management.index', 
                compact('users')
            );
        }
           
    }

}
