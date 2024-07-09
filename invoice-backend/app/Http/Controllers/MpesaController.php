<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Transaction;

class MpesaController extends Controller
{
    public function createInvoice(Request $request)
    {
        $invoice = Invoice::create($request->all());
        return response()->json($invoice, 201);
    }

    public function stkPush(Request $request)
    {
        // Your STK Push logic here
        return response()->json(['message' => 'STK Push initiated'], 200);
    }

    public function getInvoices()
    {
        $invoices = Invoice::all();
        return response()->json($invoices, 200);
    }
}
