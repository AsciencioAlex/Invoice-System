<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MpesaController;

Route::get('/', function () {
    return view('welcome');
});

Route::post('/create-invoice', [MpesaController::class, 'createInvoice']);
Route::post('/stkpush', [MpesaController::class, 'stkPush']);
Route::get('/invoices', [MpesaController::class, 'getInvoices']);
