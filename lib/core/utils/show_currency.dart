


import 'dart:async';

import 'package:currency_picker/currency_picker.dart';

Future showCurrency({
  required context,
}) {
  Completer completer = Completer();
  showCurrencyPicker(
    context: context,
    showFlag: true,
    showCurrencyName: true,
    showCurrencyCode: true,
    onSelect: (Currency currency) {
      completer.complete(currency.code);
    },
  );
  return completer.future;
}