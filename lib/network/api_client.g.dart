part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;
  String? baseUrlSocket;

  @override
  Future<bool> signUp(phoneNumber) async {
    bool status = true;
    Map<String, dynamic> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    Map<String, dynamic> _data = {
      'phoneNumber': phoneNumber
    };

    try{
      await _dio.fetch<dynamic>(_setStreamType<void>(
          Options(method: 'POST', headers: headers)
              .compose(_dio.options, 'security/send-verification', data: _data)
              .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    }catch(_){
      status = false;
      print(_);
    }
    return status;
  }

  @override
  Future<VerifyResponse> verify(phoneNumber, code) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    Map<String, dynamic> _data = {
      'phoneNumber': phoneNumber,
      'code': code
    };

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VerifyResponse>(Options(method: 'POST', headers: headers)
            .compose(_dio.options, 'security/verify-login', data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CompanyResponse> getCompany() async {
    String token = GetStorage().read('token');
    Map<String, dynamic> headers = {
      'token': 'Authorization: Bearer $token'
    };

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CompanyResponse>(Options(method: 'GET', headers: headers)
            .compose(_dio.options, 'companies')
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CompanyResponse.fromJson(_result.data!);
    return value;
  }
  //
  // @override
  // Future<OrderUpdatesResponse> checkToken() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<LoginResponse>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'api/check-token')
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<Profile> getProfile() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<Profile>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, '/api/profile')
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = Profile.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> addImage(image, passengerId, orderId) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //
  //   Map<String, dynamic> _data = {
  //     'img': image,
  //     'passanger_id': passengerId,
  //     'order_id': orderId,
  //   };
  //
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<LoginResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/add-file', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> deleteImage(id) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //
  //   Map<String, dynamic> _data = {
  //     'image_id': id,
  //   };
  //
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<LoginResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/delete-image', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // ///operator
  // ///
  //
  // @override
  // Future<MainOperatorResponse> mainOperator(
  //     deal, page, filter, type, name, startDate, endDate) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> queryParameters = {
  //     'deal': deal,
  //     'page': page,
  //     'filter': filter,
  //     'type': type,
  //     'name': name,
  //   };
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<MainOperatorResponse>(
  //           Options(method: 'GET', headers: _headers)
  //               .compose(_dio.options, 'orders/get',
  //                   queryParameters: queryParameters)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = MainOperatorResponse.fromJson(_result.data!);
  //   // Alice(result: _result, showNotification: true);
  //
  //   return value;
  // }
  //
  // @override
  // Future<PartnersResponse> partners() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<PartnersResponse>(
  //           Options(method: 'GET', headers: _headers)
  //               .compose(_dio.options, 'partners/get')
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = PartnersResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> partnersAmount(partnerId,
  //     balance,
  //     currencyId,
  //     invoiceId,
  //     comment,) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'partner_id': partnerId.toString(),
  //     'balance': balance.toString(),
  //     'currency_id': currencyId.toString(),
  //     'invoice_id': invoiceId.toString(),
  //     'comment': comment.toString(),
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(_dio.options, 'partners/give-amount', data: _data)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<PassengerResponse> getPassenger(clientId, orderId) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> queryParameters = {
  //     'client_id': clientId,
  //     'order_id': orderId,
  //   };
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<PassengerResponse>(
  //           Options(method: 'GET', headers: _headers)
  //               .compose(_dio.options, 'passenger/get',
  //                   queryParameters: queryParameters)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = PassengerResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OpptionalResponse> getOpptional() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OpptionalResponse>(
  //           Options(method: 'GET', headers: _headers)
  //               .compose(
  //                 _dio.options,
  //                 'api/opptional',
  //               )
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OpptionalResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> orderUpdates(
  //   name,
  //   ticketPrice,
  //   setPrice,
  //   callbackDate,
  //   invoice,
  //   currencyId,
  //   howFoundId,
  //   payment,
  //   orderCategoryId,
  //   partnerId,
  //   startDate,
  //   endDate,
  //   orderId,
  // ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'name': name,
  //     'ticket_price': ticketPrice,
  //     'set_price': setPrice,
  //     'callback_date': callbackDate,
  //     'invoice': invoice,
  //     'currency_id': currencyId,
  //     'how_found_id': howFoundId,
  //     'payment': [
  //       {"currency_id": 1, "amount": 0},
  //       {"currency_id": 2, "amount": 0},
  //       {"currency_id": 3, "amount": 0},
  //       {"currency_id": 4, "amount": 0}
  //     ],
  //     'order_category_id': orderCategoryId,
  //     'partner_id': partnerId,
  //     'start_date': startDate,
  //     'end_date': endDate,
  //     'order_code_id': orderId
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(
  //                 _dio.options,
  //                 'orders/updates',
  //                 data: _data,
  //               )
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<PassengerReportResponse> getPassengerReport(
  //     clientId,
  //     page,
  //     name,
  //     dateTime,
  //     filter,
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _query = {
  //     'client_id': clientId,
  //     'page': page,
  //     'name': name,
  //     'datetime': dateTime,
  //     'filter': filter,
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<PassengerReportResponse>(
  //           Options(method: 'GET', headers: _headers)
  //               .compose(
  //             _dio.options,
  //             'passenger/report',
  //             queryParameters: _query,
  //           )
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = PassengerReportResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<CreatePassengerR> addPassenger(
  //     clientId, passenger, orderId, status) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'passenger_id': clientId.toString(),
  //     'passanger': passenger,
  //     'order_code_id': orderId.toString(),
  //     'status': status.toString(),
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<CreatePassengerR>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(
  //                 _dio.options,
  //                 'orders/clients',
  //                 data: _data,
  //               )
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = CreatePassengerR.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> orderPayment(deal, payment, orderId) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'deal': deal,
  //     'payment': payment,
  //     'order_id': orderId,
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(
  //                 _dio.options,
  //                 'orders/payment',
  //                 data: _data,
  //               )
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<CashBoxResponse> getCashBox() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<CashBoxResponse>(
  //           Options(method: 'GET', headers: _headers)
  //               .compose(
  //                 _dio.options,
  //                 'cashbox/get',
  //               )
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = CashBoxResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> cashBoxPayment(
  //   cashBoxId,
  //   price,
  //   currencyId,
  //   comment,
  //   invoiceId,
  // ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'cashbox_id': cashBoxId,
  //     'price': price,
  //     'currency_id': currencyId,
  //     'comment': comment,
  //     'invoice_id': invoiceId
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(_dio.options, 'cashbox/payment', data: _data)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> addOrder(order) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(_dio.options, 'orders/add-order', data: order)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<AllClients> allClients() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<AllClients>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'clients/list-full')
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = AllClients.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> expanseCashBox(
  //     price, cashboxId, comment, currencyId, expanseId) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'price': price,
  //     'cashbox_id': cashboxId,
  //     'expense_category': expanseId,
  //     'comment': comment,
  //     'currency_id': currencyId
  //   };
  //
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(
  //           Options(method: 'POST', headers: _headers)
  //               .compose(_dio.options, 'cashbox/expense', data: _data)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<ReportResponse> report(
  //   type,
  //   startDate,
  //   endDate,
  //     page
  // ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _query = {
  //     'type': type,
  //     'start_date': startDate,
  //     'end_date': endDate,
  //     'page': page
  //   };
  //
  //   var _result;
  //   try{
  //     _result = await _dio.fetch<Map<String, dynamic>>(
  //         _setStreamType<ReportResponse>(Options(
  //                 method: 'GET', headers: _headers)
  //             .compose(_dio.options, 'cashbox/report', queryParameters: _query)
  //             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //     // Alice(result: _result, showNotification: true);
  //     final value = ReportResponse.fromJson(_result.data!);
  //     return value;
  //   }catch(_){
  //     var data = _ as DioError;
  //     _result = data.response;
  //     // Alice(result: _result, showNotification: true);
  //     return _result;
  //   }
  // }
  //
  // ///cashBox
  // ///
  //
  // @override
  // Future<MainCashBoxResponse> getMainCashBox(page, search, type) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //
  //   Map<String, dynamic> _query = {
  //     'page': page,
  //     'search': search,
  //     'type': type
  //   };
  //
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<MainCashBoxResponse>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'cashbox/main', queryParameters: _query)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = MainCashBoxResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<CashBoxInfoResponse> cashBoxInfo() async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<CashBoxInfoResponse>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'cashbox/get')
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = CashBoxInfoResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> cashBoxCheck(id, check, type) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'id': id.toString(),
  //     'check': check.toString(),
  //     'type': type.toString(),
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'cashbox/check', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<CashBoxReportResponse> cashBoxReport(type, startDate, endDate, page) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _query = {
  //     'type': type.toString(),
  //     'start_date': startDate,
  //     'end_date': endDate,
  //     'page': page,
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<CashBoxReportResponse>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'cashbox/cashbox-report', queryParameters: _query)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = CashBoxReportResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> exchange(price,
  //     currencyId,
  //     cashBoxId,
  //     getterAmount,
  //     getterAmountId,
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _date = {
  //     'price': price.toString(),
  //     'currency_id': currencyId.toString(),
  //     'cashbox_id': cashBoxId.toString(),
  //     'getter_amount': getterAmount.toString(),
  //     'getter_currency_id': getterAmountId.toString(),
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'cashbox/exchange', data: _date)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  //
  // ///director
  // ///
  // @override
  // Future<UsersResponse> users(type,
  //     page, name
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _query = {
  //     'type': type.toString(),
  //     'page': page.toString(),
  //     'name': name
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<UsersResponse>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'api/users', queryParameters: _query)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = UsersResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<UserInfoResponse> getUserInfo(userId,
  //     type
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _query = {
  //     'user_id': userId.toString(),
  //     'type': type.toString(),
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<UserInfoResponse>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'api/user-info', queryParameters: _query)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = UserInfoResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<ReportModel> getReport(userId,
  //     type, page, mobile, filter, startDate, endDate
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _query = {
  //     'user_id': userId.toString(),
  //     'type': type.toString(),
  //     'page': page.toString(),
  //     'mobile': mobile.toString(),
  //     'filter': filter.toString(),
  //     'start_date': startDate,
  //     'end_date': endDate,
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<ReportModel>(Options(method: 'GET', headers: _headers)
  //           .compose(_dio.options, 'api/user-reports', queryParameters: _query)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = ReportModel.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> addUser(
  //     client,
  //     employee,
  //     partner,
  //     image,
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'client': client,
  //     'employee': employee,
  //     'partner': partner,
  //     'img': image,
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/add-user', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> addExpense(
  //     name
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'name': name,
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/add-expenses-category', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> deleteExpense(
  //     id
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'id': id
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/delete-expenses-category', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> changeBalance(
  //     balance
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'balance': balance
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/control-balance', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> deleteUser(
  //     type, id
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'type': type,
  //     'id': id
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/delete-user', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }
  //
  // @override
  // Future<OrderUpdatesResponse> archiveOrder(
  //     id
  //     ) async {
  //   String token = GetStorage().read('token');
  //   Map<String, dynamic> _headers = {
  //     'token': token,
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'language': GetStorage().read('lang')??'uz'
  //   };
  //   Map<String, dynamic> _data = {
  //     'id': id
  //   };
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<OrderUpdatesResponse>(Options(method: 'POST', headers: _headers)
  //           .compose(_dio.options, 'api/archive-order', data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = OrderUpdatesResponse.fromJson(_result.data!);
  //   return value;
  // }


  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
