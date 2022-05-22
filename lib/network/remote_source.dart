import 'package:flutter/cupertino.dart';
import 'package:ura_cash_back/model/company_response.dart';
import 'package:ura_cash_back/model/verify_response.dart';
import 'package:ura_cash_back/network/response_handler.dart';
import 'package:ura_cash_back/network/server_error.dart';

import 'api_client.dart';

class RemoteSource {
  late ApiClient _apiClient;

  RemoteSource() {
    _apiClient = ApiClient("https://api.uracashback.uz/");
  }


  Future<ResponseHandler<bool>> fetchSingUp(phoneNumber) async {
    bool status;
    try {
      status = await _apiClient.signUp(phoneNumber);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = status;
  }

  Future<ResponseHandler<VerifyResponse>> verify(
      phoneNumber,
      code
      ) async {
    VerifyResponse response;
    try {
      response = await _apiClient.verify(phoneNumber, code);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<CompanyResponse>> getCompany() async {
    CompanyResponse response;
    try {
      response = await _apiClient.getCompany();
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error));
    }
    return ResponseHandler()..data = response;
  }

//   Future<ResponseHandler<OrderUpdatesResponse>> fetchCheckToken() async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.checkToken();
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<Profile>> getProfile() async {
//     Profile response;
//     try {
//       response = await _apiClient.getProfile();
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> addImage(image, passengerId, orderId) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.addImage(image, passengerId, orderId);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> deleteImage(id) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.deleteImage(id);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   ///operator
//   ///
//
//   Future<ResponseHandler<MainOperatorResponse>> fetchMainOperator(
//       deal, page, filter, type, name, start_date, end_date) async {
//     MainOperatorResponse response;
//     try {
//       response = (await _apiClient.mainOperator(
//           deal, page, filter, type, name, start_date, end_date));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<PartnersResponse>> fetchPartners() async {
//     PartnersResponse response;
//     try {
//       response = (await _apiClient.partners());
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchPartnersAmount(
//       partnerId, balance, currencyId, invoiceId, comment) async {
//     OrderUpdatesResponse response;
//     try {
//       response = (await _apiClient.partnersAmount(
//           partnerId, balance, currencyId, invoiceId, comment));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<PassengerResponse>> fetchGetPassenger(
//       client_id, order_id) async {
//     PassengerResponse response;
//     try {
//       response = (await _apiClient.getPassenger(client_id, order_id));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OpptionalResponse>> fetchOpptional() async {
//     OpptionalResponse response;
//     try {
//       response = (await _apiClient.getOpptional());
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchOrderUpdates(
//       name,
//       ticketPrice,
//       setPrice,
//       callbackDate,
//       invoice,
//       currencyId,
//       howFoundId,
//       payment,
//       orderCategoryId,
//       partnerId,
//       startDate,
//       endDate,
//       orderId) async {
//     OrderUpdatesResponse response;
//     try {
//       response = (await _apiClient.orderUpdates(
//           name,
//           ticketPrice,
//           setPrice,
//           callbackDate,
//           invoice,
//           currencyId,
//           howFoundId,
//           payment,
//           orderCategoryId,
//           partnerId,
//           startDate,
//           endDate,
//           orderId));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<PassengerReportResponse>> fetchPassengerReport(
//       clientId, page, name, dateTime, filter) async {
//     PassengerReportResponse response;
//     try {
//       response = (await _apiClient.getPassengerReport(clientId, page, name, dateTime, filter));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<CreatePassengerR>> fetchAddPassenger(
//       clientId, passenger, orderId, status) async {
//     CreatePassengerR response;
//     try {
//       response =
//           (await _apiClient.addPassenger(clientId, passenger, orderId, status));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchOrderPayment(
//       deal, payment, orderId) async {
//     OrderUpdatesResponse response;
//     try {
//       response = (await _apiClient.orderPayment(deal, payment, orderId));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<CashBoxResponse>> fetchCashBox() async {
//     CashBoxResponse response;
//     try {
//       response = (await _apiClient.getCashBox());
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchCashPayment(
//       cashBoxId, price, currencyId, comment, invoiceId) async {
//     OrderUpdatesResponse response;
//     try {
//       response = (await _apiClient.cashBoxPayment(
//           cashBoxId, price, currencyId, comment, invoiceId));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchAddOrder(order) async {
//     OrderUpdatesResponse response;
//     try {
//       response = (await _apiClient.addOrder(order));
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<AllClients>> fetchAllClients() async {
//     AllClients response;
//     try {
//       response = await _apiClient.allClients();
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchExpanseCashBox(
//       price, cashboxId, comment, currencyId, expanseId) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.expanseCashBox(
//           price, cashboxId, comment, currencyId, expanseId);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<ReportResponse>> fetchReport(
//       type, startDate, endDate, page) async {
//     ReportResponse response;
//     try {
//       response = await _apiClient.report(type, startDate, endDate, page);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   ///cashBox
//   ///
//
//   Future<ResponseHandler<MainCashBoxResponse>> fetchMainCashBox(page, search, type) async {
//     MainCashBoxResponse response;
//     try {
//       response = await _apiClient.getMainCashBox(page, search, type);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<CashBoxInfoResponse>> fetchCashInfo() async {
//     CashBoxInfoResponse response;
//     try {
//       response = await _apiClient.cashBoxInfo();
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..data = response;
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchCashBoxCheck(
//       id, check, type) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.cashBoxCheck(id, check, type);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<CashBoxReportResponse>> fetchCashReport(
//       type, startDate, endDate, page) async {
//     CashBoxReportResponse response;
//     try {
//       response = await _apiClient.cashBoxReport(type, startDate, endDate, page);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> fetchExchange(
//       price, currencyId, cashBoxId, getterAmount, getterAmountId) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.exchange(
//           price, currencyId, cashBoxId, getterAmount, getterAmountId);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   ///director
// ///
//
//   Future<ResponseHandler<UsersResponse>> fetchUsers(
//       type, page, name) async {
//     UsersResponse response;
//     try {
//       response = await _apiClient.users(type, page, name);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<UserInfoResponse>> fetchUserInfo(
//       userId, type) async {
//     UserInfoResponse response;
//     try {
//       response = await _apiClient.getUserInfo(userId, type);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<ReportModel>> fetchReports(
//       userId, type, page, mobile, filter, startDate, endDate) async {
//     ReportModel response;
//     try {
//       response = await _apiClient.getReport(userId, type, page, mobile, filter, startDate, endDate);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> addUser(
//       client, employee, partner, image) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.addUser(client, employee, partner, image);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> addExpense(
//       name) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.addExpense(name);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> deleteExpense(
//       id) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.deleteExpense(id);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> deleteUser(
//       type, id) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.deleteUser(type, id);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> archiveOrder(
//       id) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.archiveOrder(id);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }
//
//   Future<ResponseHandler<OrderUpdatesResponse>> changeBalance(
//       balance) async {
//     OrderUpdatesResponse response;
//     try {
//       response = await _apiClient.changeBalance(balance);
//     } catch (error, stacktrace) {
//       debugPrint("Exception occurred: $error stacktrace: $stacktrace");
//       return ResponseHandler()
//         ..setException(ServerError.withError(error: error));
//     }
//     return ResponseHandler()..setData(response);
//   }

}
