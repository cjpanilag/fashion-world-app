<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class RegisterUserController extends Controller
{
    /**
     * invoke the request to 
     * register new user
     * 
     * @param Request
     * @return Reponse
     */
    public function __invoke(Request $request)
    {
        //assigning request
        $email = $request->input('email');
        $name = $request->input('name');
        $password = bcrypt($request->input('password'));

        $data = array(
            'name' => $name,
            'email' => $email,
            'password' => $password,
            'email_verified_at' => now(),
            'created_at' => now(),
            'updated_at' => now(),
            'remember_token' => Str::random(10),
        );

        if(DB::table('users')->insert($data)) {
            return response()->json('success', 200);
        } else {
            return response()->json('fail');
        }
        
        //return response()->json($password);
    }
}
