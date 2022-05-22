import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../network/main_repository.dart';

class SignUpBloc {
  final MainRepository _repository = MainRepository();

  Stream<AuthEvent> get _events => _event.stream;

  final _event = StreamController<AuthEvent>();

  addEvent(AuthEvent event) => _event.sink.add(event);

  final _state = BehaviorSubject<AuthState>();

  Stream<AuthState> get state => _state.stream;

  _setState(AuthState state) => _state.sink.add(state);

  AuthState get initialState => AuthInitialState();

  AuthState get lastState => _state.value;

  StreamSubscription? _eventSubscription;

  SignUpBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  Future<void> _mapEventToState(AuthEvent event) async {
    if (event is LoginEvent) {
      _signUp(event.phoneNumber);
    }
    if(event is AuthInitialEvent){
      _setState(AuthInitialState());
    }

  }

  void dispose() {
    _event.close();
    _state.close();
    _eventSubscription?.cancel();
  }

  Future<void> _signUp(phoneNumber) async {
    _setState(LoginLoadingState());
    final result = await _repository.login(phoneNumber);
    if (result) {
    _setState(LoginLoadedState());
    }
    else {
      _setState(LoginException());
    }
  }
}


//events
class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  String phoneNumber;

  LoginEvent({required this.phoneNumber});
}

//states
class AuthState {}

class AuthInitialState extends AuthState{}

class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {
}

class LoginException extends AuthState {}