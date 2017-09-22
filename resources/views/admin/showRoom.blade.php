@extends('layouts.app')

@section('content')
    <div class="container">
        <p>Отображение комнат</p>
        @foreach($rooms as $room)
            <div>
                {{print_r($room)}}
            </div>
        @endforeach
    </div>
@endsection