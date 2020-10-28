<?php
/**
 * Class RteController.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App\Http\Controllers;

use App\Rte;
use View;
use DB;
use Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Helper;

/**
 * Class RteController
 *
 */
class RteController extends Controller
{
    /**
     * Defining scope of the variable
     *
     * @access public
     * @var    array $rte
     */
    protected $rte;

    /**
     * Create a new controller instance.
     *
     * @param instance $rte instance
     *
     * @return void
     */
    public function __construct(Rte $rte)
    {
        $this->rte = $rte;
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
            $rtes = $this->rte::where('title', 'like', '%' . $keyword . '%')->paginate(7)->setPath('');
            $pagination = $rtes->appends(
                array(
                    'keyword' => Input::get('keyword')
                )
            );
        } else {
            $rtes = $this->rte->paginate(7);
        }
        if (file_exists(resource_path('views/extend/back-end/admin/rtes/index.blade.php'))) {
            return View::make('extend.back-end.admin.rtes.index', compact('rtes'));
        } else {
            return View::make(
                'back-end.admin.rtes.index',
                compact('rtes')
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
                    'rte_title' => 'required',
                ]
            );
            $this->rte->saveRtes($request);
        }
        Session::flash('message', trans('lang.save_rte'));
        return Redirect::back();
    }

    /**
     * Edit rtes.
     *
     * @param int $id integer
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!empty($id)) {
            $rtes = $this->rte::find($id);
            if (!empty($rtes)) {
                if (file_exists(resource_path('views/extend/back-end/admin/rtes/edit.blade.php'))) {
                    return View::make('extend.back-end.admin.rtes.edit', compact('rtes'));
                } else {
                    return View::make(
                        'back-end.admin.rtes.edit', compact('id', 'rtes')
                    );
                }
                Session::flash('message', trans('lang.dpt_updated'));
                return Redirect::to('admin/rtes');
            }
        }
    }

    /**
     * Update rtes.
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
            'rte_title' => 'required',
            ]
        );
        $this->rte->updateRtes($request, $id);
        Session::flash('message', trans('lang.dpt_updated'));
        return Redirect::to('admin/rtes');
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
            $this->rte::where('id', $id)->delete();
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
            $this->rte::where("id", $id)->delete();
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
