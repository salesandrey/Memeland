import 'package:flutter/material.dart';

class NotesGif extends ChangeNotifier
{
  bool isCorrect = false;
  bool isSearch = false;

  void activeAPI()
  {
    isCorrect = true;
    notifyListeners();
  }

  void searching(bool value)
  {
    isSearch = value;
    notifyListeners();
  }
}