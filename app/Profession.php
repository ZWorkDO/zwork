<?php
/**
 * Class Profession.
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
use Elasticquent\ElasticquentTrait;

/**
 * Class Profession
 *
 */
class Profession extends Model
{
    /* ElasticSearch */
    use ElasticquentTrait;
    protected $mappingProperties = array(
        'title' => [
            'type' => 'text',
            'analyzer' => 'standard',
        ],
        'description' => [
            'type' => 'text',
            'analyzer' => 'standard',
        ],
    );

    function getIndexName() {
        return 'profession_index';
    }

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
     * Get the employers for the profession.
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
            if (!Profession::all()->where('slug', $temp)->isEmpty()) {
                $i = 1;
                $new_slug = $temp . '-' . $i;
                while (!Profession::all()->where('slug', $new_slug)->isEmpty()) {
                    $i++;
                    $new_slug = $temp . '-' . $i;
                }
                $temp = $new_slug;
            }
            $this->attributes['slug'] = $temp;
        }
    }

    /**
     * For saving professions in Database
     *
     * @param string $request get request attributes
     *
     * @return \Illuminate\Http\Response
     */
    public function saveProfessions($request)
    {
        if (!empty($request)) {
            $this->title = filter_var($request['profession_title'], FILTER_SANITIZE_STRING);
            $this->slug = filter_var($request['profession_title'], FILTER_SANITIZE_STRING);
            $this->description = filter_var($request['profession_desc'], FILTER_SANITIZE_STRING);
            return $this->save();
        }
    }

    /**
     * For updating Professions
     *
     * @param string $request get request attributes
     * @param int    $id      get profession id for updation
     *
     * @return \Illuminate\Http\Response
     */
    public function updateProfessions($request, $id)
    {
        if (!empty($request)) {
            $dpts = self::find($id);
            if ($dpts->title != $request['profession_title']) {
                $dpts->slug  =  filter_var($request['profession_title'], FILTER_SANITIZE_STRING);
            }
            $dpts->title = filter_var($request['profession_title'], FILTER_SANITIZE_STRING);
            $dpts->description = filter_var($request['profession_desc'], FILTER_SANITIZE_STRING);
            $dpts->save();
        }
    }
}
