import 'package:college_connect/g_sheet/feedback_back.dart';
import 'package:college_connect/g_sheet/feedback_sheet_api.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class FeedbackSheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "college-connect-2e7b3",
  "private_key_id": "46406fbbefaed1c66e36d91fa015e39753a4dab0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD8tbfm0FOHaeHh\nOcBV/jL1jdt0HPq0rO9WVmv6s6ZQALBeW+Vi0hQ8svNv166HNGhzoBa3TCrgmsLQ\nwf6GrrvFdlTL0n6QIRQ+PuhrM2xn5bT3s7lyp17sBh56dCk0jck6TkR8hch4tH2N\n0bDuGQ+PSdyFZ1t9a/aG9D452V3yOdDEyjnAMUXlCHs77AoOXVnqeQQc8bEks4jP\ny+cScID+kNJJGAwiOoqf1UGUjm/ltLTHcMClxwnNntdytv6sH/x0lU/iacjQ6JKH\n4yTaxPET20F/GDp6FBJfd/cg7NCkNrZ11Ek9C8zvAzfNeCr9NEIoWl0r560haGb7\nFLBd1mhRAgMBAAECggEAAcQ67X8AEHqj4LVMxAUfgdIsqiyAL6ZkU2oN/e4Gz/kb\nQoOZsEXH7K8zDrF3J7yM7N79/ajHhXOrgDZU80fSKfSUberSJeuHRtKdgQ9WVwkW\n6WLdHWEwY4285Y39kj+Z/CF7LtQoFTjsxkKknht4fX/OjfOtouwv6FxZeYHMm3J6\nteNWRdPYxc4zkcjFrxyWOEMEdd0AMtpeZRHWrw34X6DcnGVxq/mk7L1KkaAKmBz7\nt0689ZedkkiQ7nSvxyQnlqX29+spfvZ41V9ass7IJ6qYdAlOSAz/SL+RzGDryRCm\nfGt0ZJ8AMgk2OL1vsAXotASGMxn6tXA6gII8rkRUAQKBgQD/5irRxwawKKcAYokX\nxdWG8k4Ed15FK7E1KQ8pT14Q9dLfi7HkaQWGgAh6nKZjIUM27DQ51qB2u6fnQojX\nyqpW/Fndiesc7P4Gcwdj++df7JCcLJSWFTkIyHvvV1PMAQcbCjTfmYXEESGgXkNV\nGRHzfyN4XGHl32YU1P2xJtoGUQKBgQD8zzqpnDL7Eqjvt1GAbEg3FEE59+F6uQ8K\nacR+HlmD4uQ7YRi5Mjha33yyVukdYAaTslR5xa3aKfxn9/R3BmDFx9TXe9X2NfAb\n/Uit/YplhrTSF6AsQywEEvrjAWzIA/bKY+cLKMlnEuEZLDOwQ8ZCIQUKCk5ajCen\ncVMIJ0PCAQKBgQD1UEb4N12X/kCqQ8u8uHCMHzjfWzdKBCqrFaNtLKK2i5INrzNo\nDa24VIDMWeO/4CE5Q5KFZ9UIPbkmH0hj5esJ3Hyhvhdf8WlL8XXCSbhy4qt2q939\nSncUjm0Q8pxoUwvmxhAN0nTDktCzleniaFgnH1h3h8hpv5FyowRYkTAtIQKBgBoZ\nkubb12+QV5yYAnQNuc7l6m3/p2myHVln3f9fRsKU9BclSRYllyfaltcaneqIdWVe\nLdZ8kBxL5WEeekCnieohXVn50PcgTm+1UIGWAWnF5HkkM0cekDbDdt9k0EQ+FIaE\nld/TECfyDQc6RwPVm2xMWGbW9YvnmFhzHK1k0FwBAoGAF5xP9N0KT0URlCDTMnFd\n6+oGZgKLj2oVUAjtV2y57zVQ30gNKHa9taLepaOtlRHj5vm5jmKL5XHt79PGf0Nr\n4TLWblVuZ3LJQDILkMK3yPwOtYPWa1gX29Xqt5ymBuNZY6Vb6AElPLU0bj1J9vb/\nkrfwQqCLpPYExdYRtuuFqAc=\n-----END PRIVATE KEY-----\n",
  "client_email": "feedback-gshhet@college-connect-2e7b3.iam.gserviceaccount.com",
  "client_id": "103033103997323791099",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/feedback-gshhet%40college-connect-2e7b3.iam.gserviceaccount.com"
}
''';
  static final _sheetid = '1nEzgKvmYPz-iltoT2FPYb3HZlOKtalrji4n8JHWz4a4';
  // ignore: unused_field
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;
  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_sheetid);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'Sheet1');
    final firstRow = FeedbackFeild.getFields();
    _userSheet!.values.insertRow(1, firstRow);
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastrow = await _userSheet!.values.lastRow();
    return lastrow == null ? 0 : int.tryParse(lastrow.first) ?? 0;
  }
}
