<?php

namespace App\Http\Controllers\Post;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ViewSinglePostController extends Controller
{
    /**
     * invoking get request from the client
     * and making query
     * 
     * @param HTTP_Request
     * 
     * @return HTTP_Response
     */
    public function __invoke(Request $request, $id)
    {
        $posts = DB::table('posts')
            ->join('users', 'posts.posted_by', '=', 'users.id')
            ->select('posts.*', 'users.name', 'users.email')
            ->where('posted_by', $id)
            ->get();
            
        $data = array();

        foreach($posts as $post) {
            $post_arr = array(
                'id' => $post->id,
                'title' => $post->title,
                'body' => $post->body,
                'posted_by' => $post->name,
                'image' => $post->image,
                'created_at' => $post->created_at,
                'updated_at' => $post->updated_at
            );
            array_push($data, $post_arr);
        }

        return response()->json($data, 200);
    }
}
