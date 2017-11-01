<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\department;

class DepartmentController extends Controller {
    public function getAllDepartments() {
        $departments = department::all();

        $response = [
            'number' => count($departments),
            'departments' => $departments
        ];

        return response()->json($response, 200);
    }

    public function postDepartment(Request $request) {
        $department = new department();

        // To do: algorithm to generate department_id
        //$department->department_id = $request->input('department_id');

        // Have to find whether the given id exists
        // If exists, error
        $test = department::where('department_id', $department->department_id)->first();
        if ($test) {
            return response()->json(['error_code' => 101, 'error_msg' => '部门编号重复!'], 201);
        }

        $department->department_name = $request->input('department_name');
        $department->department_status = $request->input('department_status');
        $department->department_remark = $request->input('department_remark');

        $department->save();
        return response()->json(['error_code'=>001,'error_msg'=>'新增部门成功!'], 201);
    }

    public function putDepartment(Request $request, $department_id) {
        $department = department::where('department_id', $department_id)->first();
        if(!$department){
            return response()->json(['error_code'=>404,'error_msg'=>'Invalid department id!'], 404);
        }
        $department->department_name = $request->input('department_name');
        $department->department_status = $request->input('department_status');
        $department->department_remark = $request->input('department_remark');
        $department->save();

        return response()->json(['error_code'=>001,'error_msg'=>'部门信息修改成功!'], 201);
    }

    public function deleteDepartment($department_id){
        $department = department::where('department_id', $department_id)->first();
        if(!$department){
            return response()->json(['error_code'=>404,'error_msg'=>'Invalid department id!'], 404);
        }

        // To do: have to check whether this department is
        // referenced in other tables, if so, should do something to avoid errors.
        //$department->department_status = 0;
        //$department->save();

        return response()->json(['error_code'=>001,'error_msg'=>'部门删除成功!'], 201);
    }
}
