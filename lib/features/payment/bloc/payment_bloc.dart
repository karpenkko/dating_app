import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repos/payment_repo.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepo _paymentRepo;
  PaymentBloc(this._paymentRepo) : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
