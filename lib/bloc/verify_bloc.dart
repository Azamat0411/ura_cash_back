import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../model/verify_response.dart';
import '../network/main_repository.dart';

class VerifyBloc {
  final MainRepository _repository = MainRepository();

  Stream<VerifyEvent> get _events => _event.stream;

  final _event = StreamController<VerifyEvent>();

  addEvent(VerifyEvent event) => _event.sink.add(event);

  final _state = BehaviorSubject<VerifyState>();

  Stream<VerifyState> get state => _state.stream;

  _setState(VerifyState state) => _state.sink.add(state);

  VerifyState get initialState => VerifyInitialState();

  VerifyState get lastState => _state.value;

  StreamSubscription? _eventSubscription;

  VerifyBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  Future<void> _mapEventToState(VerifyEvent event) async {
    if (event is VerifyLoadEvent) {
      _verify(event.phoneNumber, event.code);
    }
    if(event is VerifyInitialEvent){
      _setState(VerifyInitialState());
    }

  }

  void dispose() {
    _event.close();
    _state.close();
    _eventSubscription?.cancel();
  }

  Future<void> _verify(phoneNumber, code) async {
    _setState(VerifyLoadingState());
    final result = await _repository.verify(phoneNumber, code);
    if (result is VerifyResponse) {
      _setState(VerifyLoadedState(result: result));
    } else {
      _setState(VerifyException());
    }
  }
}


//events
class VerifyEvent {}

class VerifyInitialEvent extends VerifyEvent {}

class VerifyLoadEvent extends VerifyEvent {
  String phoneNumber;
  String code;

  VerifyLoadEvent({required this.phoneNumber, required this.code});
}

//states
class VerifyState {}

class VerifyInitialState extends VerifyState{}

class VerifyLoadingState extends VerifyState {}

class VerifyLoadedState extends VerifyState {
  VerifyResponse result;

  VerifyLoadedState({required this.result});
}

class VerifyException extends VerifyState {}