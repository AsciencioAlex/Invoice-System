<?php

return [
    'consumer_key' => env('MPESA_CONSUMER_KEY', 'ahJP4mWrdaM9mpAl5VevqEHSc3XBFyLPyKcGxwXnY6CRysdx'),
    'consumer_secret' => env('MPESA_CONSUMER_SECRET', '0TZVANgJItItiyw0DGoqkxwgufxxpqi2UZJJ8NOA0QReqpVMEkdRngxVlAc13jTN'),
    'shortcode' => env('MPESA_SHORTCODE', '174379'),
    'lipa_na_mpesa_online_passkey' => env('MPESA_PASSKEY', 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919'),
    'lipa_na_mpesa_online_short_code' => env('MPESA_SHORTCODE', '174379'),
    'env' => env('MPESA_ENV', 'sandbox'), // or 'live'
    'callback_url' => env('MPESA_CALLBACK_URL', 'https://la-codet.co.ke/mpesa/callback'),
    'timeout_url' => env('MPESA_TIMEOUT_URL', 'https://la-codet.co.ke/mpesa/timeout'),
    'confirmation_url' => env('MPESA_CONFIRMATION_URL', 'https://la-codet.co.ke/mpesa/confirmation'),
];
