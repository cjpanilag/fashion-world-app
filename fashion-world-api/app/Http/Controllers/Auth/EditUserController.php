<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EditUserController extends Controller
{
    /**
     * @param HTTP_Request
     * invoking user update
     * 
     * @return HTTP_Response
     */
    public function __invoke(Request $request)
    {
        $id = $request->input('user_id');
        $name = $request->input('name');

        if(DB::table('users')->where('id', $id)->update(['name' => $name])) {
            return response()->json('success', 200);
        }
    }
}
