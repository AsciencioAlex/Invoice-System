<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;

class InvoiceController extends Controller
{
    public function create(Request $request)
    {
        $validatedData = $request->validate([
            'email' => 'required|email',
            'product' => 'required|string',
        ]);

        $invoice = Invoice::create([
            'email' => $validatedData['email'],
            'product' => $validatedData['product'],
        ]);

        return response()->json($invoice, 201);
    }
}
