<?php
/**
 * Class GradeController.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App\Http\Controllers;

use App\Grade;
use View;
use DB;
use Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Helper;

/**
 * Class GradeController
 *
 */
class GradeController extends Controller
{
    /**
     * Defining scope of the variable
     *
     * @access public
     * @var    array $grade
     */
    protected $grade;

    /**
     * Create a new controller instance.
     *
     * @param instance $grade instance
     *
     * @return void
     */
    public function __construct(Grade $grade)
    {
        $this->grade = $grade;
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
            $grades = $this->grade::where('title', 'like', '%' . $keyword . '%')->paginate(7)->setPath('');
            $pagination = $grades->appends(
                array(
                    'keyword' => Input::get('keyword')
                )
            );
        } else {
            $grades = $this->grade->paginate(7);
        }
        if (file_exists(resource_path('views/extend/back-end/admin/grades/index.blade.php'))) {
            return View::make('extend.back-end.admin.grades.index', compact('grades'));
        } else {
            return View::make(
                'back-end.admin.grades.index',
                compact('grades')
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
                    'grade_title' => 'required',
                ]
            );
            $this->grade->saveGrades($request);
        }
        Session::flash('message', trans('lang.save_grade'));
        return Redirect::back();
    }

    /**
     * Edit grades.
     *
     * @param int $id integer
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!empty($id)) {
            $grades = $this->grade::find($id);
            if (!empty($grades)) {
                if (file_exists(resource_path('views/extend/back-end/admin/grades/edit.blade.php'))) {
                    return View::make('extend.back-end.admin.grades.edit', compact('grades'));
                } else {
                    return View::make(
                        'back-end.admin.grades.edit', compact('id', 'grades')
                    );
                }
                Session::flash('message', trans('lang.dpt_updated'));
                return Redirect::to('admin/grades');
            }
        }
    }

    /**
     * Update grades.
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
            'grade_title' => 'required',
            ]
        );
        $this->grade->updateGrades($request, $id);
        Session::flash('message', trans('lang.dpt_updated'));
        return Redirect::to('admin/grades');
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
            $this->grade::where('id', $id)->delete();
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
            $this->grade::where("id", $id)->delete();
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
