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
Route::get('/property_unit', [
    'uses' => 'PropertyUnitController@getAllUnits'
]);

Route::post('/property_unit', [
    'uses' => 'PropertyUnitController@postUnit'
]);

Route::put('/property_unit/{property_unit_id}', [
    'uses' => 'PropertyUnitController@putUnit'
]);

Route::delete('/property_unit/{property_unit_id}', [
    'uses' => 'PropertyUnitController@deleteUnit'
]);
//endregion

//region CURD APIs of approval_record_status
Route::get('/approval_record_status',[
    'uses' => 'ApprovalRecordStatusController@getAllApprovalRecordStatuses'
]);

Route::post('/approval_record_status',[
    'uses' => 'ApprovalRecordStatusController@postApprovalRecordStatus'
]);

Route::put('/approval_record_status/{approval_record_status_id}',[
    'uses' => 'ApprovalRecordStatusController@putApprovalRecordStatus'
]);

Route::delete('/approval_record_status/{approval_record_status_id}',[
    'uses' => 'ApprovalRecordStatusController@deleteApprovalRecordStatus'
]);
//endregion



//region CURD APIs of approval_record_status zj
Route::get('/asset_purchase_approval_record',[
    'uses' => 'AssetPurchaseApprovalRecordController@getAllAssetPurchaseApprovalRecord'
]);

Route::post('/asset_purchase_approval_record',[
    'uses' => 'AssetPurchaseApprovalRecordController@postAssetPurchaseApprovalRecord'
]);

Route::put('/asset_purchase_approval_record/{asset_purchase_approval_record_id}',[
    'uses' => 'AssetPurchaseApprovalRecordController@putAssetPurchaseApprovalRecord'
]);

Route::delete('/asset_purchase_approval_record/{asset_purchase_approval_record_id}',[
    'uses' => 'AssetPurchaseApprovalRecordController@deleteAssetPurchaseApprovalRecord'
]);
//endregion


//endregion
