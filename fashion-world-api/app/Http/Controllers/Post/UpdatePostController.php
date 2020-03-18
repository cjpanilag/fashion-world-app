<?php

namespace App\Http\Controllers\Post;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UpdatePostController extends Controller
{
    /**
     * @param HTTP_Request
     * invoking update on post
     * 
     * @return HTTP_Response
     */
    public function __invoke(Request $request)
    {
        $id = $request->input('id');
        $title = $request->input('title');
        $body = $request->input('body');
        
        if($update = DB::table('posts')->where('id', $id)->update([
            'title' => $title,
            'body' => $body,
            'updated_at' => now()
        ])) {
            return response()->json('success', 200);
        } else {
            return response()->json('fail');
        }
    }
}
