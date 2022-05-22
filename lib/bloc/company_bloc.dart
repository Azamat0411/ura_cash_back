import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/company_response.dart';
import '../network/main_repository.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyLoadingState()) {
    final MainRepository _mainRepository = MainRepository();
    on<LoadApiEvent>((event, emit) async {
      emit(CompanyLoadingState());
      dynamic result = await _mainRepository.getCompany();
      emit(CompanyLoadedState(
        result,
      ));
    });
  }
}

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
}

class CompanyLoadingEvent extends CompanyEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadApiEvent extends CompanyEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

abstract class CompanyState extends Equatable {}

class CompanyLoadingState extends CompanyState {
  @override
  List<Object> get props => [];
}

class CompanyLoadedState extends CompanyState {
  final CompanyResponse response;

  CompanyLoadedState(
      this.response,
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        response,
      ];
}