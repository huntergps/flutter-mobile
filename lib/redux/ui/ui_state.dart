import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:invoiceninja_flutter/data/models/company_model.dart';
import 'package:invoiceninja_flutter/redux/client/client_state.dart';
import 'package:invoiceninja_flutter/redux/dashboard/dashboard_state.dart';
import 'package:invoiceninja_flutter/redux/invoice/invoice_state.dart';
import 'package:invoiceninja_flutter/redux/product/product_state.dart';
import 'package:invoiceninja_flutter/ui/auth/login_vm.dart';

// STARTER: import - do not remove comment
import 'package:invoiceninja_flutter/redux/payment/payment_state.dart';

import 'package:invoiceninja_flutter/redux/quote/quote_state.dart';

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {
  factory UIState(CompanyEntity company,
      {bool enableDarkMode}) {
    return _$UIState._(
      selectedCompanyIndex: 0,
      currentRoute: LoginScreen.route,
      enableDarkMode: enableDarkMode ?? false,
      emailPayment: false,
      dashboardUIState: DashboardUIState(),
      productUIState: ProductUIState(),
      clientUIState: ClientUIState(),
      invoiceUIState: InvoiceUIState(),
      // STARTER: constructor - do not remove comment
      paymentUIState: PaymentUIState(company),
      quoteUIState: QuoteUIState(),
    );
  }

  UIState._();

  int get selectedCompanyIndex;

  String get currentRoute;

  bool get enableDarkMode;

  bool get emailPayment;

  DashboardUIState get dashboardUIState;

  ProductUIState get productUIState;

  ClientUIState get clientUIState;

  InvoiceUIState get invoiceUIState;

  @nullable
  String get filter;

  // STARTER: properties - do not remove comment
  PaymentUIState get paymentUIState;

  QuoteUIState get quoteUIState;

  static Serializer<UIState> get serializer => _$uIStateSerializer;
}
