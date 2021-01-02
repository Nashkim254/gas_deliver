import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Observable<User> user;
  Observable<Map<String, dynamic>> profile;

  PublishSubject loading = PublishSubject();

  //Constructor
  AuthService() {
    user = Observable(_auth.authStateChanges());

    profile = user.switchMap((User u) {
      if (u != null) {
        return _db
            .collection('users')
            .doc(u.uid)
            .snapshots()
            .map((snap) => snap.data());
      } else {
        return Observable.just({});
      }
    });
  }

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection('users').doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoURL,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    },);
  }

  void signOut() {
    _auth.signOut();
  }
  //=============email/password login
  
 Future<String> signIn({String email, String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  //=================================== facebook login
}

final AuthService authService = AuthService();
