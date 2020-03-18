<?php

// use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//routing for API authintication
Route::group(['prefix' => 'auth', 'namespace' => 'Auth'], function(){
    Route::post('signin', 'SignInController');
    Route::post('register', 'RegisterUserController');
    Route::post('signout', 'SignOutController');
    Route::get('me', 'MeController');

    Route::post('emailchecker', 'EmailCheckerController');

    Route::post('saveimage', 'ProfileImageController@saveImage');
    Route::get('profileimage/{id}', 'ProfileImageController@viewImage');

    Route::post('edit', 'EditUserController');  
});

//routing for application post
Route::group(['prefix' => 'post', 'namespace' => 'Post'], function(){
    Route::get('posts/{id}', 'ViewAllPostController');
    Route::get('post/{id}', 'ViewSinglePostController');
    Route::post('update', 'UpdatePostController');
    Route::post('create', 'CreatePostController');
    Route::get('delete/{id}', 'DeletePostController');

    Route::post('like', 'LikesController@commit');
    Route::post('likes', 'LikesController@allLikes');
    Route::post('unlike', 'LikesController@abstain');
    Route::get('trends', 'LikesController@trends');
});