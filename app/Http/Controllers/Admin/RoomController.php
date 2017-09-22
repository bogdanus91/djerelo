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
       
   }

   public function addRoom(Request $request)
    {
     if ($request->isMethod('get'))
     {
        return view ('admin/addRoom');
     
    }
    else
    {  
        $data = $request->all();
        
        if($request->hasFile('img') && $request->file('img')->isValid()) {
            $imageName = $request->file('img')->getClientOriginalName();
            $newImageName = time() .$imageName;
            $request->file('img')->move(public_path('uploads'), $newImageName);
            $data['img'] = $newImageName;
            
        }
        Room::create($data);
        return redirect()->route('rooms');
    }
    }   
    public function editRoom (Request $request)
    {
        $id=$request->get('id');
        if ($request->isMethod('get'))
        {
       
            $data['roomData'] = Room::where('id', $id)->get()->toArray();
           //dd($data);
            return view('admin/editRoom', $data);
        
    }
    if ($request->isMethod('post'))
    {
        $data = $request->all();
       //dd($data);
        //echo 'test';
        if(isset($data['_token'])) {
            unset($data['_token']);
        }
        Room::where('id', $id)->update($data); 
        return redirect()->route('rooms');
    }
    }
}
