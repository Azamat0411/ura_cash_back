import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:retrofit/http.dart';
import 'package:ura_cash_back/model/company_response.dart';
import 'package:ura_cash_back/model/verify_response.dart';
part 'api_client.g.dart';

abstract class ApiClient {
  factory ApiClient(String baseUrl) {
    Dio dio = Dio(BaseOptions(receiveTimeout: 120000, connectTimeout: 60000));
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, requestHeader: true));
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST("security/send-verification")
  Future<bool> signUp(
    @Part() String? phoneNumber
  );

  @POST("security/verify-login")
  Future<VerifyResponse> verify(
      @Part() String? phoneNumber,
      @Part() String? code
      );

  @GET("companies")
  Future<CompanyResponse> getCompany(
      );

//   @POST("api/change-password")
//   Future<OrderUpdatesResponse> changePassword(
//       @Part() String? oldPassword,
//       @Part() String? newPassword,
//       @Part() String? repeatPassword,
//       );
//
//   @GET('api/check-token')
//   Future<OrderUpdatesResponse> checkToken();
//
//   @POST('api/add-file')
//   Future<OrderUpdatesResponse> addImage(
//       @Part() String? image,
//       @Part() int? passengerId,
//       @Part() int? orderId,
//       );
//
//   @POST('api/delete-image')
//   Future<OrderUpdatesResponse> deleteImage(
//       @Part() int? id,
//       );
//
//   @GET('/api/profile')
//   Future<Profile> getProfile();
//
//
//   ///operator
//   ///
//
//   @GET("orders/get")
//   Future<MainOperatorResponse> mainOperator(
//       @Part() bool? deal,
//       @Part() int? page,
//       @Part() bool? filter,
//       @Part() int? type,
//       @Part() String? name,
//       @Part() String? startDate,
//       @Part() String? endDate,
//       );
//
//   @GET("partners/get")
//   Future<PartnersResponse> partners(
//       );
//
//   @GET("partners/give-amount")
//   Future<OrderUpdatesResponse> partnersAmount(
//       @Part() int? partnerId,
//       @Part() int? balance,
//       @Part() int? currencyId,
//       @Part() String? invoiceId,
//       @Part() String? comment,
//       );
//
//   @GET("passenger/get")
//   Future<PassengerResponse> getPassenger(
//       @Part() int? clientId,
//       @Part() int? orderId,
//       );
//
//   @GET("api/opptional")
//   Future<OpptionalResponse> getOpptional(
//   );
//
//   @POST("orders/updates")
//   Future<OrderUpdatesResponse> orderUpdates(
//       @Part() String? name,
//       @Part() int? ticketPrice,
//       @Part() int? setPrice,
//       @Part() String? callbackDate,
//       @Part() String? invoice,
//       @Part() int? currencyId,
//       @Part() int? howFoundId,
//       @Part() List? payment,
//       @Part() int? orderCategoryId,
//       @Part() int? partnerId,
//       @Part() String? startDate,
//       @Part() String? endDate,
//       @Part() int? orderId,
//       );
//
//   @GET('passenger/report')
//   Future<PassengerReportResponse> getPassengerReport(
//       @Query('client_id') int? clientId,
//       @Query('page') int? page,
//       @Query('name') String? name,
//       @Query('datetime') String? dateTime,
//       @Query('filter') bool? filter,
//       );
//
//   @POST("orders/clients")
//   Future<CreatePassengerR> addPassenger(
//       @Part() int clientId,
//       @Part() String passenger,
//       @Part() int orderId,
//       @Part() bool status,
//       );
//
//   @POST("orders/payment")
//   Future<OrderUpdatesResponse> orderPayment(
//       @Part() bool? deal,
//       @Part() String? payment,
//       @Part() int? orderId,
//       );
//
//   @GET("cashbox/get")
//   Future<CashBoxResponse> getCashBox(
//       );
//
//   @POST("cashbox/payment")
//   Future<OrderUpdatesResponse> cashBoxPayment(
//       @Part() int? cashBoxId,
//       @Part() int? price,
//       @Part() int? currencyId,
//       @Part() String? comment,
//       @Part() String? invoiceId,
//       );
//
//   @POST("orders/add-order")
//   Future<OrderUpdatesResponse> addOrder(
//       @Part() Map<String, dynamic>? order,
//       );
//
//   @GET("clients/list-full")
//   Future<AllClients> allClients(
//       );
//
//   @POST("cashbox/expense")
//   Future<OrderUpdatesResponse> expanseCashBox(
//       @Part() int? price,
//       @Part() int? cashboxId,
//       @Part() String? comment,
//       @Part() int? currencyId,
//       @Part() int? expanseId,
//       );
//
//   @GET("cashbox/report")
//   Future<ReportResponse> report(
//       @Query('type') int? type,
//       @Query('start_date') String? startDate,
//       @Query('end_date') String? endDate,
//       @Query('page') int? page,
//       );
//
//
//   ///cashBox
// ///
//
//   @GET("cashbox/main")
//   Future<MainCashBoxResponse> getMainCashBox(
//       @Query('page') int? page,
//       @Query('search') String? search,
//       @Query('type') int? type
//   );
//
//   @GET("cashbox/get")
//   Future<CashBoxInfoResponse> cashBoxInfo();
//
//
//   @POST("cashbox/check")
//   Future<OrderUpdatesResponse> cashBoxCheck(
//       int? id,
//       bool? check,
//       int? type,
//   );
//
//   @POST("cashbox/cashbox-report")
//   Future<CashBoxReportResponse> cashBoxReport(
//       @Part() int? type,
//       @Part() String? startDate,
//       @Part() String? endDate,
//       @Part() int? page,
//       );
//
//   @POST("cashbox/exchange")
//   Future<OrderUpdatesResponse> exchange(
//   @Part()int? price,
//   @Part()int currencyId,
//   @Part()int cashBoxId,
//   @Part()int getterAmount,
//   @Part()int getterAmountId,
//       );
//
//   ///director
// ///
//
//   @GET("api/users")
//   Future<UsersResponse> users(
//       @Query('type') int? type,
//       @Query('page') int? page,
//       @Query('name') String? name,
//       );
//
//   @GET("api/user-info")
//   Future<UserInfoResponse> getUserInfo(
//       @Part() int? userId,
//       @Part() int? type,
//       );
//
//   @GET("api/user-reports")
//   Future<ReportModel> getReport(
//       @Query('user_id') int? userId,
//       @Query('type') int? type,
//       @Query('page') int? page,
//       @Query('mobile') bool? mobile,
//       @Query('filter') bool? filter,
//       @Query('start_date') String? startDate,
//       @Query('end_date') String? endDate,
//       );
//
//   @POST("api/add-user")
//   Future<OrderUpdatesResponse> addUser(
//       @Part() String? client,
//       @Part() String? employee,
//       @Part() String? partner,
//       @Part() String? image,
//       );
//
//   @POST("api/add-expenses-category")
//   Future<OrderUpdatesResponse> addExpense(
//       @Part() String? name,
//       );
//
//   @POST("api/delete-expenses-category")
//   Future<OrderUpdatesResponse> deleteExpense(
//       @Part() int? id,
//       );
//
//   @POST("api/control-balance")
//   Future<OrderUpdatesResponse> changeBalance(
//       @Part() bool balance,
//       );
//
//   @POST("api/delete-user")
//   Future<OrderUpdatesResponse> deleteUser(
//       @Part() int type,
//       @Part() int id,
//       );
//
//   @POST("api/archive-order")
//   Future<OrderUpdatesResponse> archiveOrder(
//       @Part() int id
//       );
}
