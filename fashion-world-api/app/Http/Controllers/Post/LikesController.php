<?php

namespace App\Http\Controllers\Post;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LikesController extends Controller
{
    /**
     * @param HTTP_Request
     * 
     * @return HTTP_Response
     * commiting likes, adding the data to database
     */
    public function commit(Request $request)
    {   
        $post_id = $request->input('post_id');
        $user_id = $request->input('user_id');

        $data = array(
            'post_id' => $post_id,
            'user_id' => $user_id
        );

        if(DB::table('likes')->insert($data)) {
            return response()->json('success', 200);
        } else {
            return response()->json('fail');
        }
    }

    /**
     * @param HTTP_Request
     * 
     * @return HTTP_Response
     * abstaining likes, deleting data from the database
     */
    public function abstain(Request $request)
    {   
        $post_id = $request->input('post_id');
        $user_id = $request->input('user_id');

        $data = array(
            'post_id' => $post_id,
            'user_id' => $user_id
        );

        if(DB::table('likes')->where('post_id', $post_id)->where('user_id', $user_id)->delete()) {
            return response()->json('success', 200);
        } else {
            return response()->json('fail');
        }
    }

    /**
     * @param HTTP_Request
     * getting all trending post 
     * 
     * @return HTTP_Response
     */
    public function trends(Request $request)
    {
        $trends = DB::table('likes')->select(DB::raw('count(post_id) as counted, post_id'))
                ->groupBy('post_id')->orderBy('counted', 'desc')->limit(5)->get();

        $data = array();

        if(count($trends) > 0) {
            foreach($trends as $trend) {
                $trend_data = array(
                    'post_id' => $trend->post_id,
                    'title' => $this->postTitle($trend->post_id),
                    'counted' => $trend->counted,
                    'posted_by' => $this->postOwner($trend->post_id),
                    'image' => $this->postImage($trend->post_id)
                );
                array_push($data, $trend_data);
            }
            return response()->json($data, 200);
        } else {
            return response()->json('fail');
        }
    }

    /**
     * @param post_id
     * executable in trends function
     * getting owner of the post
     * 
     * @return name 
     */
    public function postOwner($id)
    {
        $result = DB::table('posts')->join('users', 'posts.posted_by', '=', 'users.id')
                ->select(array('posts.*', DB::raw('users.name')))
                ->where('posts.id', '=', $id)->limit(1)->get();

        foreach($result as $res) {
            return $res->name;
        }
    }

    /**
     * @param POST_ID
     * getting image of the post
     * 
     * @return base64 image
     */
    public function postImage($id)
    {
        $result = DB::table('posts')->select('*')->where('id', '=', $id)->get();

        foreach($result as $res) {
            return $res->image;
        }
    }

    /**
     * @param POST_ID
     * getting the post title
     * 
     * @return String title
     */
    public function postTitle($id)
    {
        $result = DB::table('posts')->select('*')->where('id', '=', $id)->get();

        foreach($result as $res) {
            return $res->title;
        }
    }
}
