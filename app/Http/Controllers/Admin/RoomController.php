<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AddroomController extends Controller
{
   public function index ()
   {
        /*$str = '|apples}';

        function startsWith($needle, $haystack)
        {
            return preg_match('/' . preg_quote($needle, '/') . '/' . $haystack);
        }
        function endsWith($needle, $haystack)
        {
            return preg_match('/' . preg_quote($needle, '/') . '/' . $haystack);
        }
       /*function startsWith($needle, $haystack)
       {
            return !strncmp($haystack, $needle, strlen($needle));
       }
       function endsWith($needle, $haystack)
       {
            $length = strlen($needle);
            if($length == 0) {
                return true;
            }
            return (substr($haystack, -$length) === $needle);
       }

       echo startsWith($str, '|');
       echo endsWith($str, '}');
        //var_dump(startsWith($str, '|'));
        //var_dump(endsWith($str, '}'));*/
    return view ('admin/addroom');
   }

   public function store(Request $request)
    {
        if($request->hasFile('img') && $request->file('img')->isValid()) {
            $imageName = $request->file('img')->getClientOriginalName();
            $newImageName = time() .$imageName;
            $request->file('img')->move(public_path('uploads'), $newImageName);
        }
        $data = $request->all();
        $data['img'] = $newImageName;
        Room::create($data);
        return redirect()->route('addroom');
    }
}
