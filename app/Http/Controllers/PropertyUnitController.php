<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\property_unit;

class PropertyUnitController extends Controller {
    public function getAllUnits() {
        $units = property_unit::all();

        $response = [
            'number' => count($units),
            'units' => $units
        ];

        return response()->json($response, 200);
    }

    public function postUnit(Request $request) {

    }

    public function putUnit(Request $request, $property_unit_id) {

    }

    public function deleteUnit($property_unit_id) {

    }
}
