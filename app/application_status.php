<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class application_status extends Model
{
    protected $table = "application_status";
    protected $primaryKey = "application_status_id";
    public $timestamps = false;
}
