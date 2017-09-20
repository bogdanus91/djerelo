<?php

namespace App\Http\Controllers;

use App\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class AddroomController extends Controller
{
   public function index ()
   {
   
        
    
    return view ('addroom');
   }

   public function store(Request $request) 
    {
        if($request->hasFile('img') && $request->file('img')->isValid()) {
            $img = $request->file('img')->getClientOriginalName();
            $imageName = time() .$img;
            request()->img->move(public_path('uploads'), $imageName);
        }
        //database insert
       
        Room::insert(array('room_number' => $request->room_number,
                           'category_ru' => $request->category_ru,
                           'category_ua' => $request->category_ua,
                           'category_en' => $request->category_en,
                               'type_ru' => $request->type_ru,
                               'type_ua' => $request->type_ua,
                               'type_en' => $request->type_en,
                  'short_description_ru' => $request->short_description_ru,
                  'short_description_ua' => $request->short_description_ua,
                  'short_description_en' => $request->short_description_en,
                   'full_description_ru' => $request->full_description_ru,
                   'full_description_ua' => $request->full_description_ua,
                   'full_description_en' => $request->full_description_en,
                       'people_quontaty' => $request->people_quontaty,
                                   'img' => $request->img));

        return redirect()->action('AddroomController@index');
    }
}
