<?php

namespace App\Http\Controllers\Post;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CreatePostController extends Controller
{
    public function __invoke(Request $request)
    {
        /*
         data input from the client side
        */
        $posted_by = $request->input('posted_by'); // id of the user making a post
        $title = $request->input('title'); // title of the post
        $body = $request->input('body'); // body of the post
        $image = $request->input('image'); // image of the post

        /*
         array data to be stored
        */
        $data = array(
            'posted_by' => $posted_by,
            'title' => $title,
            'body' => $body,
            'image' => $image,
            'created_at' => now(),
            'updated_at' => now()
        );

        /*
         if the post is successfully stored 
         return success response with 200
        */
        if(DB::table('posts')->insert($data)) {
            return response()->json('success', 200);
        } else {
            return response()->json('fail');
        }
    }
}
