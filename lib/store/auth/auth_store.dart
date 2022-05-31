import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  @observable
  User? user;

  @observable
  bool hasUser = false;

  @observable
  String function = "";

  @action
  setUser(User user){
    this.user = user;
  }

  @action
  Future<void> fetchUser()async {
    user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.authStateChanges().listen((snapshot) {
      if(snapshot?.uid!=null){
        FirebaseFirestore.instance.collection('funcionarios').doc(snapshot?.uid).snapshots().listen((snapshotUser) {
          if(snapshotUser.exists){
            hasUser = true;
            function = snapshotUser.get('funcao');
          }
        });
      }
    });
  }

  @action
  Future<void> userSignOut()async {
    await FirebaseAuth.instance.signOut();
    hasUser = false;
  }


}