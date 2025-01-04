import 'package:flutter/material.dart';

/*
  abstract class qilishdan maqsad colorni import qilayotganda oson bo'lishi uchun

  AppColors classida dasturda ishlatiladigan barcha ranglar shu yerda yoziladi
  buni asosiy sababi ko'dni oson va tez topib olish va bir ko'dni qayta qayta yozishdan qochi uchun
  alohida class va field ga olamiz

 */

abstract class AppColors {
  // barcha raqamlar rangi

  static const buttonColor = Color(0xFFCFE9F0);

  // klaviatura orqa foni
  static final bgColor = Colors.lightBlue[50];

  // operator button lar rangi
  static const operatorButtonColor = Color(0xFF58A0B8);
}
