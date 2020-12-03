<?php
/**
 * Class Category
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
use Intervention\Image\Facades\Image;
use File;
use Storage;
use Elasticquent\ElasticquentTrait;

/**
 * Class Category
 *
 */
class Category extends Model
{
    /**
     * Fillables for the database
     *
     * @access protected
     *
     * @var array $fillable
     */
    protected $fillable = array(
        'title', 'slug', 'abstract'
    );

    /* ElasticSearch */
    use ElasticquentTrait;

    protected $mappingProperties = array(
        'title' => [
            'type' => 'string',
            'analyzer' => 'standard',
        ],
        'slug' => [
            'type' => 'string',
            'analyzer' => 'standard',
        ],
        'abstract' => [
            'type' => 'text',
            'analyzer' => 'standard',
        ],
    );

    function getIndexName() {
        return 'category_index';
    }

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
     * Get all of the users that are assigned this category.
     *
     * @return relation
     */
    public function freelancers()
    {
        return $this->morphedByMany('App\User', 'catable');
    }


    /**
     * Get all of the jobs that are assigned this category.
     *
     * @return relation
     */
    public function jobs()
    {
        return $this->morphedByMany('App\Job', 'catable');
    }

    /**
     * Get all of the services that are assigned this category.
     *
     * @return relation
     */
    public function services()
    {
        return $this->morphedByMany('App\Service', 'catable');
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
            if (!Category::all()->where('slug', $temp)->isEmpty()) {
                $i = 1;
                $new_slug = $temp . '-' . $i;
                while (!Category::all()->where('slug', $new_slug)->isEmpty()) {
                    $i++;
                    $new_slug = $temp . '-' . $i;
                }
                $temp = $new_slug;
            }
            $this->attributes['slug'] = $temp;
        }
    }

    /**
     * Saving categories
     *
     * @param string $request get req attributes
     *
     * @return \Illuminate\Http\Response
     */
    public function saveCategories($request)
    {
        if (!empty($request)) {
            $this->title = filter_var($request['category_title'], FILTER_SANITIZE_STRING);
            $this->slug = filter_var($request['category_title'], FILTER_SANITIZE_STRING);
            $this->abstract = filter_var($request['category_abstract'], FILTER_SANITIZE_STRING);
            
            $this->updateCategoryImageField($request,'image');
            $this->updateCategoryImageField($request,'image_highlighted');
            
            $this->save();
            $json['type'] = 'success';
            $json['message'] = trans('lang.cat_created');
            $this->addToIndex();
            return $json;
        }
    }

    private function updateCategoryImageField($request, $image_field) {
      $old_path = Helper::PublicPath() . '/uploads/categories/temp';
      $request_field = 'uploaded_'.$image_field;
      if (!empty($request[$request_field])) {
          $filename = $request[$request_field];
          if (file_exists($old_path . '/' . $request[$request_field])) {
              $new_path = Helper::PublicPath().'/uploads/categories/';
              if (!file_exists($new_path)) {
                  File::makeDirectory($new_path, 0755, true, true);
              }
              $filename = time() . '-' . $request[$request_field];
              rename($old_path . '/' . $request[$request_field], $new_path . '/' . $filename);
              rename($old_path . '/small-' . $request[$request_field], $new_path . '/small-' . $filename);
              rename($old_path . '/medium-' . $request[$request_field], $new_path . '/medium-' . $filename);
          }
          $this[$image_field] = filter_var($filename, FILTER_SANITIZE_STRING);
      } else {
          $this[$image_field] = '';
      }
    }

    /**
     * Updating Categories
     *
     * @param string $request get request attributes
     * @param int    $id      get department id for updation
     *
     * @return \Illuminate\Http\Response
     */
    public function updateCategories($request, $id)
    {
        if (!empty($request)) {
            $cats = self::find($id);
            if ($cats->title != $request['category_title']) {
                $cats->slug  =  filter_var($request['category_title'], FILTER_SANITIZE_STRING);
            }
            $cats->title = filter_var($request['category_title'], FILTER_SANITIZE_STRING);
            $cats->abstract = filter_var($request['category_abstract'], FILTER_SANITIZE_STRING);

            $cats->updateCategoryImageField($request,'image');
            $cats->updateCategoryImageField($request,'image_highlighted');
/*
            $old_path = Helper::PublicPath() . '/uploads/categories/temp';
            if (!empty($request['uploaded_image'])) {
                $filename = $request['uploaded_image'];
                if (file_exists($old_path . '/' . $request['uploaded_image'])) {
                    $new_path = Helper::PublicPath().'/uploads/categories/';
                    if (!file_exists($new_path)) {
                        File::makeDirectory($new_path, 0755, true, true);
                    }
                    $filename = time() . '-' . $request['uploaded_image'];
                    rename($old_path . '/' . $request['uploaded_image'], $new_path . '/' . $filename);
                    rename($old_path . '/small-' . $request['uploaded_image'], $new_path . '/small-' . $filename);
                    rename($old_path . '/medium-' . $request['uploaded_image'], $new_path . '/medium-' . $filename);
                }
                $cats->image = filter_var($filename, FILTER_SANITIZE_STRING);
            } else {
                $cats->image = null;
            }
            */
            return $cats->save();
        }
    }
}
