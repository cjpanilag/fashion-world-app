<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EmailCheckerController extends Controller
{
    public function __invoke(Request $request)
    {
        $email = $request->input('email');

        //checking if email already exist
        $emailChecker = DB::table('users')->select('email')->where('email', $email)->get();

        if(count($emailChecker) > 0) {
            return response()->json("not available", 200);
        } else 
            return response()->json("available", 200);
    }
}
