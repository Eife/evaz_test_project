import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evaz_test_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {


    on<AnonymRegisterEvent>((event, emit) async {
  print("Anonim");
  // await FirebaseAuth.instance.signOut(); (Если удаляется через консоль, зайти под этим же аккаунтом нет возможности!) 
  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  String uid = userCredential.user!.uid;
  print("$uid");
  try {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "name": event.firstName,
      "surname": event.surname,
      "parentName": event.parentName
    });
    emit(AuthLoadedState());
  } catch (e) {
    print("Ошибка при добавлении данных пользователя: $e");
  }
});

on<CheckRegisterEvent>((event, emit) async {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  print("Текущий пользователь: ${currentUser?.uid}");
  if (currentUser != null) {
    try {
      final docSnapshot = await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();
      if (docSnapshot.exists) {
        print("docSnapshot");
        UserModel model = UserModel.fromJson(docSnapshot.data()!);
        print(model);
        emit(FullRegisterState(user: model));
        
        print("New Emit");
      } else {
        // Пользователь анонимен или его данные отсутствуют в Firestore
        emit(AuthInitialState());
      }
    } catch (e) {
      print("Ошибка при получении данных пользователя: $e");
      emit(AuthTrabbleState());
    }
  } else {
    emit(AuthInitialState());
  }
});

  }
}
