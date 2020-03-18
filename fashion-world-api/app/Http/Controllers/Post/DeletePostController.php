<?php

namespace App\Http\Controllers\Post;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DeletePostController extends Controller
{
    /**
     * invoke query to delete post
     * 
     * @param HTTP_Request
     * @param GET {id} -> post id
     * 
     * @return HTTP_Response
     */
    public function __invoke(Request $request, $id)
    {
        if(DB::table('likes')->where('post_id', $id)->delete()) {
            //if the post is successfully deleted send HTTP response 200
            DB::table('posts')->where('id', $id)->delete();
            return response()->json('success', 200); 
        } else {
            //if fail to delete send fail response
            return response()->json('fail'); 
        }
    }
}
