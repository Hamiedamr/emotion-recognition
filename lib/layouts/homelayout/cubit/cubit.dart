import 'package:authfirebase/layouts/homelayout/cubit/states.dart';
import 'package:authfirebase/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc('CERCdzPYCFMyLugwNbJEPVzRtqr1')
        .get()
        .then((value) {
      print(value.data());
      model = SocialUserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }
}
