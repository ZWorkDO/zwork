<?php
/**
 * Class CamaraController.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App\Http\Controllers;

use App\Camara;
use View;
use DB;
use Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Helper;

/**
 * Class CamaraController
 *
 */
class CamaraController extends Controller
{
    /**
     * Defining scope of the variable
     *
     * @access public
     * @var    array $camara
     */
    protected $camara;

    /**
     * Create a new controller instance.
     *
     * @param instance $camara instance
     *
     * @return void
     */
    public function __construct(Camara $camara)
    {
        $this->camara = $camara;
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
            $camaras = $this->camara::where('title', 'like', '%' . $keyword . '%')->paginate(7)->setPath('');
            $pagination = $camaras->appends(
                array(
                    'keyword' => Input::get('keyword')
                )
            );
        } else {
            $camaras = $this->camara->paginate(7);
        }
        if (file_exists(resource_path('views/extend/back-end/admin/camaras/index.blade.php'))) {
            return View::make('extend.back-end.admin.camaras.index', compact('camaras'));
        } else {
            return View::make(
                'back-end.admin.camaras.index',
                compact('camaras')
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
                    'camara_title' => 'required',
                ]
            );
            $this->camara->saveCamaras($request);
        }
        Session::flash('message', trans('lang.save_camara'));
        return Redirect::back();
    }

    /**
     * Edit camaras.
     *
     * @param int $id integer
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!empty($id)) {
            $camaras = $this->camara::find($id);
            if (!empty($camaras)) {
                if (file_exists(resource_path('views/extend/back-end/admin/camaras/edit.blade.php'))) {
                    return View::make('extend.back-end.admin.camaras.edit', compact('camaras'));
                } else {
                    return View::make(
                        'back-end.admin.camaras.edit', compact('id', 'camaras')
                    );
                }
                Session::flash('message', trans('lang.dpt_updated'));
                return Redirect::to('admin/camaras');
            }
        }
    }

    /**
     * Update camaras.
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
            'camara_title' => 'required',
            ]
        );
        $this->camara->updateCamaras($request, $id);
        Session::flash('message', trans('lang.dpt_updated'));
        return Redirect::to('admin/camaras');
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
            $this->camara::where('id', $id)->delete();
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
            $this->camara::where("id", $id)->delete();
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
