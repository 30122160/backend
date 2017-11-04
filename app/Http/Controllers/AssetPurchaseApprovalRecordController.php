<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\asset_purchase_approval_record;

class AssetPurchaseApprovalRecordController extends Controller
{
    public function getAllAssetPurchaseApprovalRecord(){
        $statuses = asset_purchase_approval_record::all();

        $response = [
             'number' => count($statuses),
             'statuses' => $statuses
        ];

        return response()->json($response, 200);
    }

    public function postAssetPurchaseApprovalRecord(Request $request){
        $status = new asset_purchase_approval_record_status();

        $status->asset_purchase_approval_record_id  = $request->input('asset_purchase_approval_record_id');
        $status->asset_purchase_approval_id = $request->input('asset_purchase_approval_id');
        $status->asset_purchase_approval_time = $request->input('asset_purchase_approval_time');
        $status->asset_purchase_approver = $request->input('asset_purchase_approver');
        $status->asset_purchase_approval_state = $request->input('asset_purchase_approval_state');
        $status->asset_purchase_approval_advice = $request->input('asset_purchase_approval_advice');

        $status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '资产购买审核状态新增成功！'], 200);
    }

    public function putAssetPurchaseApprovalRecord(Request $request, $asset_purchase_approval_record_id){

        $status = asset_purchase_approval_record::where('asset_purchase_approval_record_id', $asset_purchase_approval_record_id)->first();
        if (!$status) {
            return response()->json(['error_code' => 404, 'error_msg' => 'Invalid asset_purchase_approval_record_id!'], 404);
        }

        $status->asset_purchase_approval_record_id  = $request->input('asset_purchase_approval_record_id');
        $status->asset_purchase_approval_id = $request->input('asset_purchase_approval_id');
        $status->asset_purchase_approval_time = $request->input('asset_purchase_approval_time');
        $status->asset_purchase_approver = $request->input('asset_purchase_approver');
        $status->asset_purchase_approval_state = $request->input('asset_purchase_approval_state');
        $status->asset_purchase_approval_advice = $request->input('asset_purchase_approval_advice');
        $status->save();

        return response()->json(['error_code' => 001, 'error_msg' => '资产购买审核状态修改成功！'], 200);
    }

    public function deleteAssetPurchaseApprovalRecord($asset_purchase_approval_record_id){
        $status = asset_purchase_approval_record::where('asset_purchase_approval_record_id', $asset_purchase_approval_record_id)->first();
        if (!$status) {
            return response()->json(['error_code' => 404, 'error_msg' => 'Invalid asset_purchase_approval_record_id!'], 404);
        }

        $status->delete();

        return response()->json(['error_code' => 001, 'error_msg' => '资产购买审核状态信息删除成功！'], 200);
    }
}

