<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\APIController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post("all_data", [APIController::class, "index"]);
Route::post("create_data", [APIController::class, "store"]);
Route::post("show_data", [APIController::class, "show"]);
Route::post("edit_data", [APIController::class, "edit"]);
Route::post("delete_data", [APIController::class, "destroy"]);
Route::post("count_responden", [APIController::class, "countRows"]);
Route::post("count_gender", [APIController::class, "countRespondentsByGender"]);
Route::post("count_country", [APIController::class, "countRespondentsByCountry"]);
Route::post("average_age", [APIController::class, "calculateAverageAge"]);
Route::post("average_gpa", [APIController::class, "calculateAverageGPA"]);
Route::post("count_genre", [APIController::class, "countRespondentsByGenre"]);