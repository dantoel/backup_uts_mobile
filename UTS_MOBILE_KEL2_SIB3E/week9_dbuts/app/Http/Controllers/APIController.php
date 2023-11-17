<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\week9_dbuts;

class APIController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = week9_dbuts::all();
        return $data;
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $save = new week9_dbuts;
        $save->Genre = $request->Genre;
        $save->Reports = $request->Reports;
        $save->Age = $request->Age;
        $save->Gpa = $request->Gpa;
        $save->Year = $request->Year;
        $save->Count = $request->Reports;
        $save->Gender = $request->Gender;
        $save->Nationality = $request->Nationality;
        $save->save();

        return "Berhasil menyimpan data";
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $data = week9_dbuts::all()->where('id', $request->id)->first();
        return $data;
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $data = week9_dbuts::all()->where('id', $request->id)->first();
        $data->Genre = $request->Genre;
        $data->Reports = $request->Reports;
        $data->Age = $request->Age;
        $data->Gpa = $request->Gpa;
        $data->Year = $request->Year;
        $data->Count = $request->Reports;
        $data->Gender = $request->Gender;
        $data->Nationality = $request->Nationality;
        $data->save();
        return "Berhasil mengubah data";
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $del = week9_dbuts::all()->where('id', $request->id)->first();
        $del->delete();
        return "Berhasil Menghapus Data";
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function countRows(Request $request)
    {
        // Menghitung total baris pada model yang sesuai.
        $rowCount = week9_dbuts::count();

        return response()->json([$rowCount]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function countRespondentsByGender(Request $request)
    {
        // Validasi request
        $this->validate($request, [
            'Gender' => 'required|in:M,F', // Sesuaikan dengan opsi gender yang ada
        ]);

        // Menghitung jumlah responden berdasarkan jenis kelamin (gender).
        $Gender = $request->input('Gender');
        $rowCount = week9_dbuts::where('Gender', $Gender)->count();

        return response()->json([$rowCount]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function countRespondentsByCountry(Request $request)
    {
        // Validasi request
        $this->validate($request, [
            'Nationality' => 'required|in:Indonesia,Soudan,France,Mexico,South Africa,Yemen', // Sesuaikan dengan opsi nationality yang ada
        ]);

        // Menghitung jumlah responden berdasarkan nationality (negara asal).
        $Nationality = $request->input('Nationality');
        $rowCount = week9_dbuts::where('Nationality', $Nationality)->count();

        return response()->json(['respondent_count' => $rowCount, 'nationality' => $Nationality]);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function countRespondentsByGenre(Request $request)
    {
        // Validasi request
        $this->validate($request, [
            'Genre' => 'required|in:Academic Support and Resources,Activities and Travelling,Athletics and sports,Career opportunities,Financial Support,Food and Cantines,Health and Well-being Support,Housing and Transportation,International student experiences,Online learning,Student Affairs', // Sesuaikan dengan opsi nationality yang ada
        ]);

        // Menghitung jumlah responden berdasarkan nationality (negara asal).
        $Genre = $request->input('Genre');
        $rowCount = week9_dbuts::where('Genre', $Genre)->count();

        return response()->json(['respondent_count' => $rowCount, 'Factor' => $Genre]);
    }

    public function calculateAverageAge()
    {
        $averageAge = week9_dbuts::average('Age');

        return response()->json([$averageAge]);
    }

    public function calculateAverageGPA()
    {
        $averageGPA = week9_dbuts::average('Gpa');
        return response()->json([$averageGPA]);
    }
}
