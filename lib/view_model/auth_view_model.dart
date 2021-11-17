// ignore_for_file: avoid_print
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/helpers/cache_helper.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/widgets/build_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AuthViewModel extends GetxController {
  // final Rxn<User?> _user = Rxn<User>();
  // String? get user => _user.value?.uid;

  /// onInit Method
  @override
  void onInit() {
    super.onInit();
    // _user.bindStream(auth.authStateChanges());
    getUserData();
  }

  /// onReady Method
  @override
  void onReady() {
    super.onReady();
  }

  /// onClose Method
  @override
  void onClose() {
    super.onClose();
  }

  // AuthViewModel() {
  //   getUserData();
  // }

  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);



  /// Method User Login With Email And Password
  void userLoginWithEmail({
  required String email,
  required String password,
}) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      getUserData();
      CacheHelper.setData(key: 'uid', value: user.user!.uid);
      Get.offAllNamed(HomeLayout);
      buildSuccessSnackBar();
    }).catchError((error) {
      buildSnackBar(title: 'Error Login Account', msg: error.toString());
    });
  }

  /// Method Login With Facebook
  void userLoginWithFacebook() async {
    FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(customPermissions: ['email']);
    String accessToken = facebookLoginResult.accessToken!.token;
    if (facebookLoginResult.status == FacebookLoginStatus.success) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      await auth.signInWithCredential(facebookCredential).then((user) {
        createUserInFirestore(
          name: user.user!.displayName.toString(),
          email: user.user!.email.toString(),
          phoneNumber: user.user!.phoneNumber,
        );
        getUserData();
        CacheHelper.setData(key: 'uid', value: user.user!.uid);
        Get.offAllNamed(HomeLayout);
        buildSuccessSnackBar();
      }).catchError((error) {
        buildSnackBar(title: 'Error Login Account', msg: error.toString());
      });
    }
  }

  /// Method Login With Google
  void userLoginWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(authCredential).then((user) {
      createUserInFirestore(
        name: user.user!.displayName.toString(),
        email: user.user!.email.toString(),
        phoneNumber: user.user!.phoneNumber,
      );
      getUserData();
      CacheHelper.setData(key: 'uid', value: user.user!.uid);
      Get.offAllNamed(HomeLayout);
      buildSuccessSnackBar();
    }).catchError((error) {
      buildSnackBar(title: 'Error Login Account', msg: error.toString());
    });
  }

  /// Method Create New User
  void createUserWithEmailAndPassword({
  required String name,
  required String email,
  required String password,
  required String phoneNumber,
  required String address,
}) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      createUserInFirestore(
        email: email,
        name: name,
        address: address,
        phoneNumber: phoneNumber,
      );
      CacheHelper.setData(key: 'uid', value: user.user!.uid);
      Get.offAllNamed(HomeLayout);
      buildSuccessSnackBar();
    }).catchError((error) {
      buildSnackBar(title: 'Error Login Account', msg: error.toString());
    });
  }

  void buildSuccessSnackBar() {
    return buildSnackBar(
      title: 'Login Account',
      msg: 'You are logged in successfully',
    );
  }

  /// Method Create User In Firestore
  void createUserInFirestore({
    required String name,
    required String email,
    String? phoneNumber,
    String? address,
  }) async {
    UserDataModel userDataModel = UserDataModel(
      uid: auth.currentUser!.uid,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      image: DEFAULTIMAGE,
    );
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set(userDataModel.toMap());
  }

  /// Method Get User Data From FireStore
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  UserDataModel? userDataModel;
  void getUserData() async {
    isLoading.value = true;
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .get()
        .then((user) {
      userDataModel = UserDataModel.fromJson(user.data()!);
      print('Get User Data ' + user.data().toString());
      isLoading.value = false;
    }).catchError((error) {
      print('The Error in Get User Data ----->' + error.toString());
    });
    update();
  }

  /// Remove User uid From Cache Helper And Sign Out
  void signOut() async {
    auth.signOut();
    googleSignIn.signOut();
    facebookLogin.logOut();
    CacheHelper.removeData(key: 'uid');
    Get.offAllNamed(Login);
    buildSnackBar(
      title: 'Sign Out Account',
      msg: 'You are signed out successfully',
    );
  }

  /// Image Picker
  File? imageProfile;
  ImagePicker pickerImageProfile = ImagePicker();
  void getImageProfile() async {
    final pickedFile =
        await pickerImageProfile.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageProfile = File(pickedFile.path);
    } else {
      print('No Image Selected ..');
    }
    update();
  }

  /// Update User Data
  void updateUserData({
  required String name,
  required String email,
  required String phoneNumber,
  required String address,
}) async {
    if (imageProfile == null) {
      isLoading.value = true;
      update();
      UserDataModel userModel = UserDataModel(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        image: userDataModel!.image,
        uid: userDataModel!.uid,
      );
      return await FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .update(userModel.toMap())
          .then((data) {
        getUserData();
        Get.back();
        buildSnackBar(
          title: 'Success Updated',
          msg: 'Your data has been updated successfully',
        );
        isLoading.value = false;
        update();
      });
    } else {
      isLoading.value = true;
      update();
      return await FirebaseStorage.instance
          .ref()
          .child('images/${Uri.file(imageProfile!.path).pathSegments.last}')
          .putFile(imageProfile as File)
          .then((val) {
        val.ref.getDownloadURL().then((String? imageUrl) {
          UserDataModel userModel = UserDataModel(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            address: address,
            image: imageUrl,
            uid: userDataModel!.uid,
          );
          FirebaseFirestore.instance
              .collection('Users')
              .doc(auth.currentUser!.uid)
              .update(userModel.toMap());
          getUserData();
          Get.back();
          buildSnackBar(
            title: 'Success Updated',
            msg: 'Your data has been updated successfully',
          );
          isLoading.value = false;
          update();
          imageProfile = null;
        }).catchError((error) {});
      }).catchError((error) {
        print('The error ---> ' + error.toString());
      });
    }
  }
}
