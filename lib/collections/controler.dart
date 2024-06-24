import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/model/activitymodel.dart';
import 'package:demo_project/model/bookmodel.dart';
import 'package:demo_project/model/security.dart';
import 'package:demo_project/utils/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  // Instance of a firestore
  final db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future addUser(ScurityModel userModel, uid) async {
    // create collection
    final docRef = db.collection("security").doc(uid);
    //set or add values to collection
    docRef.set(userModel.data(docRef.id));
  }

  // Fetch single user
  ScurityModel? singleUserData;
  Future fetchSingleUser(id) async {
    final snapshot = await db.collection("user").doc(id).get();
    singleUserData = ScurityModel.fromData(snapshot.data()!);
  }

  Future logout() async {
    await _auth.signOut();
  }

  /// party =================

  Future addBook(
      BookModel bookModel, id, BuildContext context, type, uid) async {
    final snapshot = await db.collection('Bookingdetails').doc(id).get();

    if (snapshot.exists) {
      cherryinfo(context, 'Already selected slot another select enjiy');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Already bookd this tyime another user')));
    } else {
      final datajson = db.collection('Bookingdetails').doc(id);

      datajson
          .set(bookModel.toJsone())
          .then((value) => cherrytoast(context, 'add booking '));
    }
    // cherrytoast(context, 'error!!');
  }

  List<BookModel> bookModel = [];
  Future bookingdet() async {
    final snapshot = await db.collection('Bookingdetails').get();

    return bookModel =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
  }

  List<BookModel> search = [];

  searchbyBookingdate(String searchkey) {
    search = List.from(bookModel);
    search = bookModel
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //  ==========================  party ]]]]]   ============

  /// ========================swimpool =============

  Future addswimpool(
      BookModel bookModel, id, BuildContext context, type, uid) async {
    final snapshot = await db.collection('BookSwimpool').doc(id).get();

    if (snapshot.exists) {
      cherryinfo(context, 'Already selected slot another select enjiy');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Already bookd this tyime another user')));
    } else {
      final datajson = db.collection('BookSwimpool').doc(id);

      datajson
          .set(bookModel.toJsone())
          .then((value) => cherrytoast(context, 'add booking '));
    }
    // cherrytoast(context, 'error!!');
  }

  List<BookModel> swimall = [];
  Future swimallget() async {
    final snapshot = await db.collection('BookSwimpool').get();

    return swimall =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
  }

  List<BookModel> swimsearch = [];

  searchSwim(String searchkey) {
    swimsearch = List.from(swimall);
    swimsearch = swimall
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // ================================== awim close ]]] =======================

// ============================turf ===============================

  Future addturf(
      BookModel bookModel, id, BuildContext context, type, uid) async {
    final snapshot = await db.collection('Turf').doc(id).get();

    if (snapshot.exists) {
      cherryinfo(context, 'Already selected slot another select enjiy');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Already bookd this tyime another user')));
    } else {
      final datajson = db.collection('Turf').doc(id);

      datajson
          .set(bookModel.toJsone())
          .then((value) => cherrytoast(context, 'add booking '));
    }
    // cherrytoast(context, 'error!!');
  }

  List<BookModel> turfall = [];
  Future turfget() async {
    final snapshot = await db.collection('Turf').get();

    return turfall =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
  }

  List<BookModel> turfsearch = [];

  searchturf(String searchkey) {
    turfsearch = List.from(turfall);
    turfsearch = turfall
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //====================turf colose =[[[[]]]]=====================

  // ================================gest house =================

  Future addgusthouse(
      BookModel bookModel, id, BuildContext context, type, uid) async {
    final snapshot = await db.collection('Guesthouse').doc(id).get();

    if (snapshot.exists) {
      cherryinfo(context, 'Already selected slot another select enjiy');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Already bookd this tyime another user')));
    } else {
      final datajson = db.collection('Guesthouse').doc(id);

      datajson
          .set(bookModel.toJsone())
          .then((value) => cherrytoast(context, 'add booking '));
    }
    // cherrytoast(context, 'error!!');
  }

  List<BookModel> guesthouseall = [];
  Future guesthouseget() async {
    final snapshot = await db.collection('Guesthouse').get();

    return guesthouseall =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
  }

  List<BookModel> gustsearch = [];

  searchgesthouse(String searchkey) {
    gustsearch = List.from(guesthouseall);
    gustsearch = guesthouseall
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //=====================gust house close []][[]]  ==================

  //========================gym ========================

  Future addgym(
      BookModel bookModel, id, BuildContext context, type, uid) async {
    final snapshot = await db.collection('Gym').doc(id).get();

    if (snapshot.exists) {
      cherryinfo(context, 'Already selected slot another select enjiy');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Already bookd this tyime another user')));
    } else {
      final datajson = db.collection('Gym').doc(id);

      datajson
          .set(bookModel.toJsone())
          .then((value) => cherrytoast(context, 'add booking '));
    }
    // cherrytoast(context, 'error!!');
  }

  List<BookModel> gymall = [];
  Future gymget() async {
    final snapshot = await db.collection('Gym').get();

    return gymall =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
  }

  List<BookModel> gymsearch = [];

  searchgym(String searchkey) {
    gymsearch = List.from(gymall);
    gymsearch = gymall
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //  ===============================close gym ==[[[]]]===================

  // ======================Care =====================

  Future addCare(
      BookModel bookModel, id, BuildContext context, type, uid) async {
    final snapshot = await db.collection('Care').doc(id).get();

    if (snapshot.exists) {
      cherryinfo(context, 'Already selected slot another select enjiy');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Already bookd this tyime another user')));
    } else {
      final datajson = db.collection('Care').doc(id);

      datajson
          .set(bookModel.toJsone())
          .then((value) => cherrytoast(context, 'add booking '));
    }
    // cherrytoast(context, 'error!!');
  }

  List<BookModel> allCare = [];
  Future careadd() async {
    final snapshot = await db.collection('Care').get();

    return allCare =
        snapshot.docs.map((e) => BookModel.fromJason(e.data())).toList();
  }

  List<BookModel> caresearch = [];

  searchCare(String searchkey) {
    caresearch = List.from(allCare);
    caresearch = allCare
        .where((element) =>
            element.Date.toLowerCase().contains(searchkey.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // ================care close [[][]]=======================

  Future addactivites(ActivityModel activityModel) async {
    final datajson = db.collection('AddingActivites').doc();

    datajson.set(activityModel.toJsone(datajson.id));
  }

  List<ActivityModel> activityModel = [];
  Future adddet() async {
    final snapshot = await db.collection('AddingActivites').get();

    activityModel =
        snapshot.docs.map((e) => ActivityModel.fromJason(e.data())).toList();
    activitysearch = activityModel;
    // notifyListeners();
  }

  List<ActivityModel> activitysearch = [];

  void searchActivities(String searchKey) {
    // activitysearch = List.from(activityModel);
    activitysearch = activityModel
        .where((element) => element.Activity_name.toLowerCase()
            .contains(searchKey.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
