<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProfileImageController extends Controller
{
    /**
     * @param HTTP_Request
     *  POST Request
     * 
     *  updating user image 
     * 
     * @return HTTP_Response 
     */
    public function saveImage(Request $request)
    {
        $id = $request->input('id');
        $image = $request->input('image');
        
        if(DB::table('users')->where('id', $id)->update(['image' => $image])) {
            return response()->json('success', 200);
        }
    }

    /**
     * @param HTTP_Request
     * @param id
     * GET Request
     * 
     * getting user image 
     * 
     * @return HTTP_Response
     */
    public function viewImage(Request $request, $id) 
    {
        $users = DB::table('users')->select('image')->where('id', $id)->get();

        if(count($users) > 0) {
            foreach($users as $user) {
                if($user->image) {
                    $user_image = array(
                        'image' => $user->image
                    );
                } else {
                    $user_image = 'no image';
                }
            }
            return response()->json($user_image, 200);
        } else {
            return response()->json('no image');
        }
    }    
}
