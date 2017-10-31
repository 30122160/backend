<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class department extends Model {
    protected $table = "department";
    protected $primaryKey = "department_id";
    public $timestamps = false;
}
