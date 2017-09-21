<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoomController extends Controller
{
   public function index ()
   {
       $data['rooms'] = Room::get()->toArray();
       return view('admin/showRoom', $data);
       //return view ('admin/addroom');
   }

   public function addRoom(Request $request)
    {
        if($request->hasFile('img') && $request->file('img')->isValid()) {
            $imageName = $request->file('img')->getClientOriginalName();
            $newImageName = time() .$imageName;
            $request->file('img')->move(public_path('uploads'), $newImageName);
        }
        $data = $request->all();
        $data['img'] = $newImageName;
        Room::create($data);
        return redirect()->route('rooms');
    }
}
