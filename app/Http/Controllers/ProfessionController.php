<?php
/**
 * Class ProfessionController.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App\Http\Controllers;

use App\Profession;
use View;
use DB;
use Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Helper;

/**
 * Class ProfessionController
 *
 */
class ProfessionController extends Controller
{
    /**
     * Defining scope of the variable
     *
     * @access public
     * @var    array $profession
     */
    protected $profession;

    /**
     * Create a new controller instance.
     *
     * @param instance $profession instance
     *
     * @return void
     */
    public function __construct(Profession $profession)
    {
        $this->profession = $profession;
    }

    /**
     * Display a listing of the resource.
     *
     * @param mixed $request Request Attributes
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (!empty($_GET['keyword'])) {
            $keyword = $_GET['keyword'];
            $professions = $this->profession::where('title', 'like', '%' . $keyword . '%')->paginate(7)->setPath('');
            $pagination = $professions->appends(
                array(
                    'keyword' => Input::get('keyword')
                )
            );
        } else {
            $professions = $this->profession->paginate(7);
        }
        if (file_exists(resource_path('views/extend/back-end/admin/professions/index.blade.php'))) {
            return View::make('extend.back-end.admin.professions.index', compact('professions'));
        } else {
            return View::make(
                'back-end.admin.professions.index',
                compact('professions')
            );
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param string $request string
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $server_verification = Helper::worketicIsDemoSite();
        if (!empty($server_verification)) {
            Session::flash('error', $server_verification);
            return Redirect::back();
        }
        if (!empty($request)) {
            $this->validate(
                $request, [
                    'profession_title' => 'required',
                ]
            );
            $this->profession->saveProfessions($request);
        }
        Session::flash('message', trans('lang.save_profession'));
        return Redirect::back();
    }

    /**
     * Edit professions.
     *
     * @param int $id integer
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!empty($id)) {
            $professions = $this->profession::find($id);
            if (!empty($professions)) {
                if (file_exists(resource_path('views/extend/back-end/admin/professions/edit.blade.php'))) {
                    return View::make('extend.back-end.admin.professions.edit', compact('professions'));
                } else {
                    return View::make(
                        'back-end.admin.professions.edit', compact('id', 'professions')
                    );
                }
                Session::flash('message', trans('lang.dpt_updated'));
                return Redirect::to('admin/professions');
            }
        }
    }

    /**
     * Update professions.
     *
     * @param string $request string
     * @param int    $id      integer
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $server_verification = Helper::worketicIsDemoSite();
        if (!empty($server_verification)) {
            Session::flash('error', $server_verification);
            return Redirect::back();
        }
        $this->validate(
            $request, [
            'profession_title' => 'required',
            ]
        );
        $this->profession->updateProfessions($request, $id);
        Session::flash('message', trans('lang.dpt_updated'));
        return Redirect::to('admin/professions');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param mixed $request request attributes
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $server = Helper::worketicIsDemoSiteAjax();
        if (!empty($server)) {
            $json['type'] = 'error';
            $json['message'] = $server->getData()->message;
            return $json;
        }
        $json = array();
        $id = $request['id'];
        if (!empty($id)) {
            $this->profession::where('id', $id)->delete();
            $json['type'] = 'success';
            $json['message'] = trans('lang.dpt_deleted');
            return $json;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param mixed $request request attributes
     *
     * @return \Illuminate\Http\Response
     */
    public function deleteSelected(Request $request)
    {
        $server = Helper::worketicIsDemoSiteAjax();
        if (!empty($server)) {
            $json['type'] = 'error';
            $json['message'] = $server->getData()->message;
            return $json;
        }
        $json = array();
        $checked = $request['ids'];
        foreach ($checked as $id) {
            $this->profession::where("id", $id)->delete();
        }
        if (!empty($checked)) {
            $json['type'] = 'success';
            $json['message'] = trans('lang.dpt_deleted');
            return $json;
        } else {
            $json['type'] = 'error';
            $json['message'] = trans('lang.something_wrong');
            return $json;
        }
    }
}
