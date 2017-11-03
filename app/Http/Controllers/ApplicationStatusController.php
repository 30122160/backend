<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\application_status;

class ApplicationStatusController extends Controller {
    public function getAllStatuses() {
        $statuses = application_status::all();

        $response = [
            'number' => count($statuses),
            'statuses' => $statuses
        ];

        return response()->json($response, 200);
    }

    public function postStatus(Request $request) {
        $status = new application_status();

        /*
         * Dont have to generate application_status_id cause it is defined as 'AUTO INCREMENT'
         */
//        $status->application_status_id = $request->input("application_status_id");
//        // Have to find whether the given id exists
//        // If exists, error
//        $test = application_status::where('application_status_id', $status->application_status_id)->first();
//        if($test){
//            return response()->json(['error_code'=>102, 'error_msg'=>'状态id重复！'], 201);
//        }

        $status->application_status_name = $request->input('application_status_name');
        $status->application_status_remark = $request->input('application_status_remark');
        $status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '申请状态新增成功！'], 201);
    }

    public function putStatus(Request $request, $application_status_id) {
        $status = application_status::where('application_status_id', $status->application_status_id)->first();
        if (!$status) {
            return response()->json(['error_code' => 404, 'error_msg' => '指定id的状态不存在！'], 404);
        }

        $status->application_status_name = $request->input('application_status_name');
        $status->application_status_remark = $request->input('application_status_remark');
        $status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '申请状态信息修改成功！'], 201);
    }

    public function deleteStatus($application_status_id) {
        $status = application_status::where('application_status_id', $status->application_status_id)->first();
        if (!$status) {
            return response()->json(['error_code' => 404, 'error_msg' => '指定id的状态不存在！'], 404);
        }

        // To do: have to check whether this status
        // is referenced in other tables.
        //$status->delete();
        //$status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '申请状态信息删除成功！'], 201);
    }
}
