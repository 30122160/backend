<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\approval_record_status;

class ApprovalRecordStatusController extends Controller
{
    public function getAllApprovalRecordStatuses(){
        $statuses = approval_record_status::all();

        $response = [
            'number' => count($statuses),
            'statuses' => $statuses
        ];

        return response()->json($response, 200);
    }

    public function postApprovalRecordStatus(Request $request){
        $status = new approval_record_status();

        $status->approval_record_status_name = $request->input('approval_record_status_name');
        $status->approval_record_status_remark = $request->input('approval_record_status_remark');
        $status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '审核状态新增成功！'], 200);
    }

    public function putApprovalRecordStatus(Request $request, $approval_record_status_id){
        $status = approval_record_status::where('approval_record_status_id', $approval_record_status_id)->first();
        if (!$status) {
            return response()->json(['error_code' => 404, 'error_msg' => 'Invalid approval_record_status_id!'], 404);
        }

        $status->approval_record_status_name = $request->input('approval_record_status_name');
        $status->approval_record_status_remark = $request->input('approval_record_status_remark');
        $status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '审核状态修改成功！'], 200);
    }

    public function deleteApprovalRecordStatus($approval_record_status_id){
        $status = approval_record_status::where('approval_record_status_id', $approval_record_status_id)->first();
        if (!$status) {
            return response()->json(['error_code' => 404, 'error_msg' => 'Invalid approval_record_status_id!'], 404);
        }

        $status->delete();

        return response()->json(['error_code' => 001, 'error_msg' => '审核状态信息删除成功！'], 200);
    }
}
