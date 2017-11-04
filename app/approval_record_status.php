<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class approval_record_status extends Model
{
    protected $table = "approval_record_status";
    protected $primaryKey = "approval_record_status_id";
    public $timestamps = false;
}
