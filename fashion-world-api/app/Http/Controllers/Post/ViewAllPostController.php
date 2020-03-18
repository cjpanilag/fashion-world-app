<?php

namespace App\Http\Controllers\Post;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ViewAllPostController extends Controller
{
    protected $data = array();
    private $user_id;

    /**
     * @param HTTP_Request 
     * @param user_id
     * 
     * @return HTTP_Response
     */
    public function __invoke(Request $request, $id) 
    {   
        $this->user_id = $id;
        $this->extraction();
        return response()->json($this->data ,200);      
    }

    /**
     * @runnable function
     */
    public function extraction()
    {
        $posts = DB::table('posts')
            ->join('users', 'posts.posted_by', '=', 'users.id')
            ->select('posts.*','users.name', 'users.email', 'users.image as user_image')
            ->orderByRaw('created_at DESC')->get();

        foreach($posts as $post) {
            $result = array(
                'id' => $post->id,
                'title' => $post->title,
                'body' => $post->body,
                'posted_by' => $post->name,
                'image' => $post->image,
                'user_image' => $post->user_image,
                'email' => $post->email,
                'liked' => $this->getLikes($post->id),
                'countedLikes' => $this->countLikes($post->id),
                'created_at' => $post->created_at,
                'updated_at' => $post->updated_at
            );
            array_push($this->data, $result);    
        }
    }

    /**
     * @param POST_ID
     * function to be used in extraction
     * getting all likes from the database
     * 
     * @return Boolean
     * true if the user already liked the post
     * false if the user is not like the post
     */
    public function getLikes($post_id)
    {
        $likes = DB::table('likes')
                ->select('*')->where('post_id', $post_id)
                ->where('user_id', $this->user_id)->get();
        if(count($likes) > 0)
            return true;
        else 
            return false;      
    }

    /**
     * @param POST_ID
     * function to be used in extraction
     * counting all likes
     * 
     * @return Integer
     * getting all counted likes from the database
     */
    public function countLikes($post_id)
    {
        $likes = DB::table('likes')->select('*')->where('post_id', $post_id)->get();
        if(count($likes) > 0) {
            return (count($likes));
        } else {
            return 0;
        }
    }
}


