import 'package:ura_cash_back/network/remote_source.dart';

class MainRepository {
  final _remoteSource = RemoteSource();

  Future<dynamic> login(phoneNumber) async {
    final response = await _remoteSource.fetchSingUp(phoneNumber);
    if (response.data!=null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          break;
        case "Something wrong":
          break;
        default:
          try {
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> verify(phoneNumber, code) async {
    final response = await _remoteSource.verify(phoneNumber, code);
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          break;
        case "Something wrong":
          break;
        default:
          try {

          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

  Future<dynamic> getCompany() async {
    final response = await _remoteSource.getCompany();
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      String errorMessage = '';
      switch (response.getException().getErrorMessage()) {
        case "Connection timeout":
          break;
        case "Something wrong":
          break;
        default:
          try {
          } catch (e) {
            errorMessage = response.getException().getErrorMessage();
          }
      }
      return errorMessage;
    }
  }

//   Future<dynamic> checkToken() async {
//     final response = await _remoteSource.fetchCheckToken();
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//             await translator
//                 .translate(response.getException().getErrorMessage(),
//                     from: 'en', to: 'uz')
//                 .then((value) => errorMessage = value.text);
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getProfile() async {
//     final response = await _remoteSource.getProfile();
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//             await translator
//                 .translate(response.getException().getErrorMessage(),
//                 from: 'en', to: 'uz')
//                 .then((value) => errorMessage = value.text);
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> addImage(image, passengerId, orderId) async {
//     final response = await _remoteSource.addImage(image, passengerId, orderId);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> deleteImage(
//       id) async {
//     final response = await _remoteSource.deleteImage(id);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   ///operator
//   ///
//
//   Future<dynamic> mainOperator(
//       deal, page, filter, type, name, startDate, endDate) async {
//     final response = await _remoteSource.fetchMainOperator(
//         deal, page, filter, type, name, startDate, endDate);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//             //           await translator.translate(response.getException().getErrorMessage(),
//             // from: 'en', to: Taxi.lang).then((value) => errorMessage = "${value.text}");
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> partners() async {
//     final response = await _remoteSource.fetchPartners();
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> partnersAmount(
//       partnerId, balance, currencyId, invoiceId, comment) async {
//     final response = await _remoteSource.fetchPartnersAmount(
//         partnerId, balance, currencyId, invoiceId, comment);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getPassenger(clientId, orderId) async {
//     final response = await _remoteSource.fetchGetPassenger(clientId, orderId);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//             //           await translator.translate(response.getException().getErrorMessage(),
//             // from: 'en', to: Taxi.lang).then((value) => errorMessage = "${value.text}");
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getOpptional() async {
//     final response = await _remoteSource.fetchOpptional();
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getOrderUpdates(
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
//     final response = await _remoteSource.fetchOrderUpdates(
//         name,
//         ticketPrice,
//         setPrice,
//         callbackDate,
//         invoice,
//         currencyId,
//         howFoundId,
//         payment,
//         orderCategoryId,
//         partnerId,
//         startDate,
//         endDate,
//         orderId);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getPassengerReport(
//       clientId, page, name, dateTime, filter) async {
//     final response = await _remoteSource.fetchPassengerReport(clientId, page, name, dateTime, filter);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getAddPassenger(clientId, passenger, orderId, status) async {
//     final response = await _remoteSource.fetchAddPassenger(
//         clientId, passenger, orderId, status);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getOrderPayment(deal, payment, orderId) async {
//     final response =
//         await _remoteSource.fetchOrderPayment(deal, payment, orderId);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getCashBox() async {
//     final response = await _remoteSource.fetchCashBox();
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getCashPayment(
//       cashBoxId, price, currencyId, comment, invoiceId) async {
//     final response = await _remoteSource.fetchCashPayment(
//         cashBoxId, price, currencyId, comment, invoiceId);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getAddOrder(order) async {
//     final response = await _remoteSource.fetchAddOrder(order);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getAllClients() async {
//     final response = await _remoteSource.fetchAllClients();
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           errorMessage = "connection_timeout";
//           break;
//         case "Something wrong":
//           errorMessage = "something_wrong";
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getExpanseCashBox(
//       price, cashboxId, comment, currencyId, expanseId) async {
//     final response = await _remoteSource.fetchExpanseCashBox(
//         price, cashboxId, comment, currencyId, expanseId);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           errorMessage = "connection_timeout";
//           break;
//         case "Something wrong":
//           errorMessage = "something_wrong";
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getReport(type, startDate, endDate, page) async {
//     final response = await _remoteSource.fetchReport(type, startDate, endDate, page);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           errorMessage = "connection_timeout";
//           break;
//         case "Something wrong":
//           errorMessage = "something_wrong";
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   ///cashBox
//   ///
//
//   Future<dynamic> getMainCashBox(page, search, type) async {
//     final response = await _remoteSource.fetchMainCashBox(page, search, type);
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           // errorMessage = getError("connection_timeout")!;
//           break;
//         case "Something wrong":
//           // errorMessage = getError("something_wrong")!;
//           break;
//         default:
//           try {
//             //   await translator.translate(response.getException().getErrorMessage(), from: 'en', to: Taxi.lang!).then((value) => errorMessage = "${value.text}");
//           } catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getCashInfo() async {
//     final response = await _remoteSource.fetchCashInfo();
//     if (response.data != null) {
//       return response.data;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = '';
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getCashBoxCheck(id, check, type) async {
//     final response = await _remoteSource.fetchCashBoxCheck(id, check, type);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getCashReport(type, startDate, endDate, page) async {
//     final response =
//         await _remoteSource.fetchCashReport(type, startDate, endDate, page);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getExchange(
//       price, currencyId, cashBoxId, getterAmount, getterAmountId) async {
//     final response = await _remoteSource.fetchExchange(
//         price, currencyId, cashBoxId, getterAmount, getterAmountId);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   ///director
// ///
//   Future<dynamic> getUsers(
//       type, page, name) async {
//     final response = await _remoteSource.fetchUsers(type, page, name);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getUserInfo(
//       userId, type) async {
//     final response = await _remoteSource.fetchUserInfo(userId, type);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> getReports(
//       userId, type, page, mobile, filter, startDate, endDate) async {
//     final response = await _remoteSource.fetchReports(userId, type, page, mobile, filter, startDate, endDate);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> addUser(
//       client, employee, partner, image) async {
//     final response = await _remoteSource.addUser(client, employee, partner, image);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> addExpense(
//       name) async {
//     final response = await _remoteSource.addExpense(name);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> deleteExpense(
//       id) async {
//     final response = await _remoteSource.deleteExpense(id);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> deleteUser(
//       type, id) async {
//     final response = await _remoteSource.deleteUser(type, id);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> changeBalance(
//       balance) async {
//     final response = await _remoteSource.changeBalance(balance);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
//
//   Future<dynamic> archiveOrder(
//       id) async {
//     final response = await _remoteSource.archiveOrder(id);
//     if (response.data != null) {
//       return response.data!;
//     } else if (response.getException().getErrorMessage() != "Canceled") {
//       String errorMessage = "";
//       switch (response.getException().getErrorMessage()) {
//         case "Connection timeout":
//           break;
//         case "Something wrong":
//           break;
//         default:
//           try {} catch (e) {
//             errorMessage = response.getException().getErrorMessage();
//           }
//       }
//       return errorMessage;
//     }
//   }
  
}
