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

//region CURD of all database tables

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

//region CURD APIs of application_status
Route::get('/application_status', [
    'uses' => 'ApplicationStatusController@getAllStatuses'
]);

Route::post('/application_status', [
    'uses' => 'ApplicationStatusController@postStatus'
]);

Route::put('/application_status/{application_status_id}', [
    'uses' => 'ApplicationStatusController@putStatus'
]);

Route::delete('/application_status/{application_status_id}', [
    'uses' => 'ApplicationStatusController@deleteStatus'
]);
//endregion

//region CURD APIs of property_unit
Route::get();

Route::post();

Route::put();

Route::delete();
//endregion

//endregion
