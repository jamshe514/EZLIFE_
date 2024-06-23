import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/authentication/login.dart';
import 'package:demo_project/bottom.dart';
import 'package:demo_project/forgetpassword.dart';
import 'package:demo_project/model/Roomvacency.dart';
import 'package:demo_project/model/bookmodel.dart';
import 'package:demo_project/model/comment.dart';
import 'package:demo_project/model/communitypost_model.dart';
import 'package:demo_project/model/feedback.dart';
import 'package:demo_project/model/flore_model.dart';
import 'package:demo_project/model/guestmodel.dart';
import 'package:demo_project/model/likepost.dart';
import 'package:demo_project/model/maintenance.dart';
import 'package:demo_project/model/notificationgust.dart';
import 'package:demo_project/model/panicalert.dart';
import 'package:demo_project/model/productbuysell.dart';
import 'package:demo_project/model/securitymodel.dart';
import 'package:demo_project/model/uploadcharge.dart';
import 'package:demo_project/model/usermodel.dart';
import 'package:demo_project/view/Admin/home.dart';

import 'package:demo_project/utils/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HelperProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  // funvtion

  bool isobscure = false;

  togle() {
    isobscure = !isobscure;
    notifyListeners();
  }

  String? selelctedroom;

  selectflore(valuew) {
    selelctedroom = valuew as String;
    notifyListeners();
  }

  String? selecteedfloresec;

  selectfloresec(valuew) {
    selecteedfloresec = valuew as String;
    notifyListeners();
  }

  String? seelctedtype;

  seelctedtypet(valuew) {
    seelctedtype = valuew as String;
    notifyListeners();
  }

  // slott booking

  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  String? selectedslot;

  void selectSlot(int index, String userId) async {
    _selectedIndex = index;
    selectedslot = userId;
    notifyListeners();
  }

  //

  // set

  Future addGuest(GuestModel guestModel) async {
    final snapshot = db.collection('Guest').doc();

    snapshot.set(guestModel.tojsone(snapshot.id));
  }

  Future addmaintaince(MaintenanceModel maintenanceModel) async {
    final snapshot = db.collection('Maintance').doc();

    snapshot.set(maintenanceModel.tojason(snapshot.id));
  }

  Future addFlore(Floremodel floremodel, floreno) async {}

  Future addProduct(ProductBuysell productBuysell) async {
    final snapshot = db.collection('Buysell').doc();

    snapshot.set(productBuysell.toJson(snapshot.id));
  }

  /// get

  // List<Floremodel> floremodel = [];
  // Future checkflore(String florenumber) async {
  //   final snapshot = await db
  //       .collection(selelctedroom.toString())
  //       .where('Flore', isEqualTo: selelctedroom)
  //       .where('Floreno', isEqualTo: florenumber)
  //       .get();

  //   floremodel = snapshot.docs.map((e) {
  //     return Floremodel.fromjason(e.data());
  //   }).toList();
  //   notifyListeners();
  // }

  final formkey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  final roomno = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final conpasswordcontroller = TextEditingController();

  clearcontroller() {
    usernamecontroller.clear();
    emailcontroller.clear();

    // roomno.clear();

    passwordcontroller.clear();

    conpasswordcontroller.clear();
    phonecontroller.clear();
    passwordcontroller.clear();
    usernamecontroller.clear();
    url = '';
  }

  String? selectedUserType;

  selectedusertype(value) {
    selectedUserType = value.toString();
    notifyListeners();
  }

  Future<void> addfirebase(
    Usermodel usermodel,
    String userid,
  ) async {
    try {
      final snapshot = db.collection("Register").doc(userid);
      snapshot.set(usermodel.tojsone(snapshot.id));
    } catch (e) {
      print(" error adding document:$e");
      throw e;
    }
  }

  Future<void> addSecurity(
    Securitymodel securitymodel,
    String userid,
  ) async {
    try {
      final snapshot = db.collection("Security").doc(userid);
      snapshot.set(securitymodel.tojsone(snapshot.id));
    } catch (e) {
      print(" error adding document:$e");
      throw e;
    }
  }

  Future Registrationsecurity(
      BuildContext context, email, password, name, url, number) async {
    if (passwordcontroller != null) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // String registeredUserId = randomString(10);
        String uid = auth.currentUser!.uid;

        //addfirebase
        addSecurity(
            Securitymodel(
              securityName: name,
              securityEmail: email,
              securityphonenumber: number,
              securityPassword: password,
              securityprofile: url,
              uid: uid,
            ),
            auth.currentUser!.uid);
        clearcontroller();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("registration sucess"),
        ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("weak password"),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(" email address already used"),
            ),
          );
        }
      }
    }
  }

  Future Registration(BuildContext context, password, email, String? url,
      String? selectedusertype) async {
    if (passwordcontroller != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("registration sucess"),
        ));

        // String registeredUserId = randomString(10);
        String uid = auth.currentUser!.uid;

        await addfirebase(
          Usermodel(
            username: usernamecontroller.text,
            phonenumber: phonecontroller.text,
            email: email,
            password: password,
            userprofileimg: url.toString(),
            rooomnumber: roomno.text,
            usertype: selectedusertype.toString(),
            uid: uid,
            florenumber: selelctedroom.toString(),
          ),
          uid,
        );
        clearcontroller();
        const SnackBar(content: Text("detals added to firebase successfully"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("weak password"),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(" email address already used"),
            ),
          );
        }
      }
    }
  }

  File? SelectedImage;
  String? url;

  Future<void> pickedimagegallery() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage == null) return;
    // setState(() {
    SelectedImage = File(pickedimage.path);
    notifyListeners();
    // });
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    final currenttime = TimeOfDay.now().toString();
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child('postimage/$currenttime')
        .putFile(SelectedImage!, metadata);
    TaskSnapshot snapshot = await uploadTask;

    url = await snapshot.ref.getDownloadURL();
    // notifyListeners();
  }

  // List<Floremodel>? floremodel;
  Future checkflore(String florenumber, context, Floremodel floremodel) async {
    final docref = db.collection(selelctedroom.toString()).doc(florenumber);

    final snapshot = await docref.get();
    if (snapshot.exists) {
      cherrytoast(context, 'Already select room');
    } else {
      cherrytoast(context, 'Welcome Ezlife');
      db
          .collection(selelctedroom.toString())
          .doc(florenumber)
          .set(floremodel.toJsone(snapshot.id))
          .then((value) {
        Registration(context, passwordcontroller.text, emailcontroller.text,
                url, selectedUserType)
            .then((value) {
          clearcontroller();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => bottomnavipage(
                indexnum: 0,
              ),
            ),
          );
        });
      });
    }

    notifyListeners();
  }

  List<String> usertype = ['resident', 'security'];

  List<ProductBuysell> allproduct = [];
  Future getAllProduct() async {
    final snapshot = db.collection('Buysell').snapshots();

    snapshot.listen((event) {
      allproduct = event.docs.map((e) {
        return ProductBuysell.fromjson(e.data());
      }).toList();
    });
    // notifyListeners();
  }

  List<MaintenanceModel> maintainelist = [];
  Stream<QuerySnapshot> getMaintaines() {
    return db.collection('Maintance').snapshots();

    // notifyListeners();
  }

  // fetch user

  Usermodel? usermodel;
  Future fetchuserdata(uid) async {
    final snapshot = await db.collection('Register').doc(uid).get();

    if (snapshot.exists) {
      usermodel = Usermodel.fromjsone(snapshot.data()!);
    }
    // notifyListeners();
  }

  // get securuty

  Stream<QuerySnapshot> getSecurities() {
    return db.collection('Security').snapshots();
  }

  List<Securitymodel> allsecurity = [];
  Future getsecurityontap() async {
    final snapshot = await db.collection('Security').get();

    allsecurity = snapshot.docs.map((e) {
      return Securitymodel.fromjsone(e.data());
    }).toList();
    notifyListeners();
  }

  List<Securitymodel> searchdata = [];

  searchsecurity(String searchkey) {
    searchdata = List.from(allsecurity);
    searchdata = allsecurity
        .where((element) => element.securityName
            .toLowerCase()
            .contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  List<GuestModel> gesmodel = [];
  Future getguest() async {
    final gestcheck =
        await db.collection('Register').doc(auth.currentUser!.uid).get();

    final snapshot = db
        .collection('Guest')
        .where(
          'florenumber',
          isEqualTo: gestcheck['flore'],
        )
        .where('roomnumber', isEqualTo: gestcheck['roomnumber'])
        .snapshots();

    snapshot.listen((event) {
      gesmodel = event.docs.map((e) {
        return GuestModel.fromjsone(e.data());
      }).toList();
    });
    notifyListeners();
  }

  // get users

  // List<Usermodel> getusercout = [];
  Stream<QuerySnapshot> getuser() {
    return db.collection('Register').snapshots();
  }

  List<Usermodel> residentsalll = [];
  Future getAllResidents() async {
    final snapshot = await db.collection('Register').get();

    residentsalll = snapshot.docs.map((e) {
      return Usermodel.fromjsone(e.data());
    }).toList();
    notifyListeners();
  }

  List<Usermodel> searchAllResident = [];

  residentsSearch(String searchkey) {
    searchAllResident = List.from(residentsalll);
    searchAllResident = residentsalll
        .where((element) =>
            element.phonenumber.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Usermodel? singleuser;
  Future getSingleuser(uid) async {
    final snapshot = await db.collection('Register').doc(uid).get();
    if (snapshot.exists) {
      singleuser = Usermodel.fromjsone(snapshot.data() as Map<String, dynamic>);
    }
  }

  Securitymodel? securitymodel;
  Future getsecuritydata(uid) async {
    final snapshot = await db.collection('Security').doc(uid).get();

    if (snapshot.exists) {
      securitymodel =
          Securitymodel.fromjsone(snapshot.data() as Map<String, dynamic>);
    }
  }

  Stream<QuerySnapshot> getSecurity() {
    return db.collection('Security').snapshots();
  }

  removedocsecurity(docid, context) {
    try {
      db.collection('Security').doc(docid).delete();
      cherrytoast(context, 'Remove succes');
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Stream<QuerySnapshot> getgestdata() {
    return db.collection('Guest').where('Status', isEqualTo: 'Ok').snapshots();
  }

  List<GuestModel> gustall = [];
  Future getAllgust() async {
    final snapshot = await db.collection('Guest').get();

    gustall = snapshot.docs.map((e) {
      return GuestModel.fromjsone(e.data());
    }).toList();
    notifyListeners();
  }

  List<GuestModel> gustsearch = [];

  searchgust(String searchkey) {
    gustsearch = gustall;
    gustsearch = gustall
        .where((element) =>
            element.date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Stream<QuerySnapshot> getGustall() {
    return db.collection('Guest').snapshots();
  }

  Stream<QuerySnapshot> getroomvaccency(floreno) {
    return db.collection(floreno).snapshots();
  }

  Future addRoomvaceny(RoomVacencyModel floremodel) async {
    final snapshot = db.collection('vacencydetails').doc();

    snapshot.set(floremodel.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> getvaccency() {
    return db.collection('vacencydetails').snapshots();
  }

  String? selectflorevacancy;
  selectflorevacency(value) {
    selectflorevacancy = value as String;
    notifyListeners();
  }

  String? selectedflore;
  selectedflorebil(value) {
    selectedflore = value as String;
    notifyListeners();
  }

  //remove

  removedoc(docid, context) {
    try {
      db.collection('Register').doc(docid).delete();
      cherrytoast(context, 'Remove succes');
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future addfeedback(feedbackuser feedback) async {
    final snapshot = db.collection('feedback').doc();

    snapshot.set(feedback.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> Getfeedback() {
    return db.collection('feedback').snapshots();
  }

  // add post

  final postname = TextEditingController();
  final postdiscrptn = TextEditingController();

  Future addPost(CommunityModel communityModel) async {
    final snapshot = db.collection('CommunityPost').doc();

    await snapshot
        .set(communityModel.tojsone(snapshot.id))
        .then((value) => clar());
  }

  String? urllink;
  Future<void> imagepicker(imageurl) async {
    if (image == null) return;
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    final currenttime = TimeOfDay.now().toString();
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child('postimage/$currenttime')
        .putFile(imageurl!, metadata);
    TaskSnapshot snapshot = await uploadTask;

    urllink = await snapshot.ref.getDownloadURL();
    notifyListeners();
  }

  File? image;

  Future imagegallery() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage == null) return;

    image = File(pickedimage.path);
    notifyListeners();
  }

  clar() {
    postname.clear();
    postdiscrptn.clear();
    urllink = null;
    image = null;
    notifyListeners();
  }

  Stream<QuerySnapshot> allpost() {
    return db
        .collection('CommunityPost')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  // room vaccency
  Future getroom() async {}

  Future likepost(LikePostModel likePostModel, id) async {
    final SNAPSHOT = await db.collection('LikedPost').doc(id).get();

    if (SNAPSHOT.exists) {
      await _dislike(id);
    } else {
      final docs = db
          .collection('LikedPost')
          .doc(likePostModel.likedUid + likePostModel.postId);
      await docs.set(likePostModel.toJson(docs.id));
    }
  }

  _dislike(id) async {
    await db.collection('LikedPost').doc(id).delete();
  }

  bool? isliked;
  Future<bool> fetchLikedpost(id) async {
    final SNAPSHOT = await db.collection('LikedPost').doc(id).get();
    if (SNAPSHOT.exists) {
      isliked = true;
      return isliked!;
    } else {
      isliked = false;
      return isliked!;
    }
  }

  //admin

  Future Adminloggin(email, password, context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((credential) {
        if (credential.user!.uid == adminuid) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => AdminHomePage(),
              ),
              (route) => false);
        } else {
          cherryinfo(context, 'No vakue');
        }
      });
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  // upload bil

  Future uploadBill(UploadCharge uploadCharge, uid) async {
    final snapshot =
        db.collection('Register').doc(uid).collection('BillUser').doc();
    snapshot.set(uploadCharge.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> getBillAmout(uid) {
    return db
        .collection('Register')
        .doc(uid)
        .collection('BillUser')
        .snapshots();
  }

  // notification

  Future addNotificationGust(NotificationGust notificationGust) async {
    final snapshot = db.collection('GuestNotification').doc();

    snapshot.set(notificationGust.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> getNotifcation() {
    return db.collection('GuestNotification').snapshots();
  }

  Future addPanicAlert(PanicAlert panicAlert) async {
    final snapshot = db.collection('PanicAlert').doc();

    snapshot.set(panicAlert.tojson(snapshot.id));
  }

  Stream<QuerySnapshot> getAlert() {
    return db.collection('PanicAlert').snapshots();
  }

  //comment
  List<CommentModel> comments = [];
  Future fetchAllComment(postId) async {
    final snapshot =
        await db.collection("Posts").doc(postId).collection("comments").get();
    comments = snapshot.docs.map((e) {
      return CommentModel.fromJson(e.data());
    }).toList();
  }

  Future addComment(postId, CommentModel commentModel) async {
    final doc = db.collection("Posts").doc(postId).collection("comments").doc();
    await doc.set(commentModel.toJson(doc.id));
    notifyListeners();
  }

  //comment

  Future getRegister(email, context) async {
    final snapshot =
        await db.collection('Register').where('email', isEqualTo: email).get();

    if (snapshot.docs.isNotEmpty) {
      sendPasswordReset(context, email);
    } else {
      cherryinfo(context, 'Valid emailenter');
    }
  }

  Future sendPasswordReset(
    context,
    email,
  ) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromRGBO(12, 184, 193, 1),
        content: const Text(
          "Password Reset email has been sent",
          style: TextStyle(fontSize: 18),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: const Text(
            "No user found for that email",
            style: TextStyle(fontSize: 18),
          ),
        ));
      }
    }
  }

  List<BookModel> bookModel = [];
  Future bookingdet(String type) async {
    final snapshot = await db
        .collection('Bookingdetails')
        .where("Type", isEqualTo: type)
        .get();

    return bookModel =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
    // log(bookModel!.length.toString());
  }

  List<BookModel> search = [];

  searchbyBookingdate(String searchkey) {
    search = List.from(search);
    search = bookModel
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
