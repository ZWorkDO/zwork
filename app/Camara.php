<?php
/**
 * Class Camara.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App;

use DB;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Camara
 *
 */
class Camara extends Model
{

    /**
     * Fillables for the database
     *
     * @access protected
     *
     * @var array $fillable
     */
    protected $fillable = array(
        'title', 'slug', 'description'
    );

    /**
     * Protected Date
     *
     * @access protected
     * @var    array $dates
     */
    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * Get the employers for the camara.
     *
     * @return relation
     */
    public function employers()
    {
        return $this->hasMany('App\Profile');
    }

    /**
     * Set slug before saving in DB
     *
     * @param string $value value
     *
     * @access public
     *
     * @return string
     */
    public function setSlugAttribute($value)
    {
        if (!empty($value)) {
            $temp = str_slug($value, '-');
            if (!Camara::all()->where('slug', $temp)->isEmpty()) {
                $i = 1;
                $new_slug = $temp . '-' . $i;
                while (!Camara::all()->where('slug', $new_slug)->isEmpty()) {
                    $i++;
                    $new_slug = $temp . '-' . $i;
                }
                $temp = $new_slug;
            }
            $this->attributes['slug'] = $temp;
        }
    }

    /**
     * For saving camaras in Database
     *
     * @param string $request get request attributes
     *
     * @return \Illuminate\Http\Response
     */
    public function saveCamaras($request)
    {
        if (!empty($request)) {
            $this->title = filter_var($request['camara_title'], FILTER_SANITIZE_STRING);
            $this->slug = filter_var($request['camara_title'], FILTER_SANITIZE_STRING);
            $this->description = filter_var($request['camara_desc'], FILTER_SANITIZE_STRING);
            return $this->save();
        }
    }

    /**
     * For updating Camaras
     *
     * @param string $request get request attributes
     * @param int    $id      get camara id for updation
     *
     * @return \Illuminate\Http\Response
     */
    public function updateCamaras($request, $id)
    {
        if (!empty($request)) {
            $dpts = self::find($id);
            if ($dpts->title != $request['camara_title']) {
                $dpts->slug  =  filter_var($request['camara_title'], FILTER_SANITIZE_STRING);
            }
            $dpts->title = filter_var($request['camara_title'], FILTER_SANITIZE_STRING);
            $dpts->description = filter_var($request['camara_desc'], FILTER_SANITIZE_STRING);
            $dpts->save();
        }
    }
}
