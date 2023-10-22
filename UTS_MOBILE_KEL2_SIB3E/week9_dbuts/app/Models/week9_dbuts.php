<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class week9_dbuts extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'Genre',
        'Reports',
        'Age',
        'Gpa',
        'Year',
        'Count',
        'Gender',
        'Nationality',
    ];
}

