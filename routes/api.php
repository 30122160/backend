<?php

use Illuminate\Http\Request;

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

//region CURD APIs of department
Route::get('/department', [
    'uses' => 'DepartmentController@getAllDepartments'
]);

Route::post('/department', [
    'uses' => 'DepartmentController@postDepartment'
]);

Route::put('/department/{department_id}', [
    'uses' => 'DepartmentController@putDepartment'
]);

Route::delete('/department/{department_id}', [
    'uses' => 'DepartmentController@deleteDepartment'
]);
//endregion
