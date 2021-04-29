import 'package:flutter/material.dart';
import 'package:medico/models/emergencycontact.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contactList = [];
  List<Contact> get contacts {
    return [..._contactList];
  }

  set contacts(List<Contact> newContacts) {
    print(_contactList.toString());
    _contactList = newContacts;
    notifyListeners();
    print(_contactList.toString());
  }

  void addContact(Contact newContact) {
    _contactList.add(newContact);
    notifyListeners();
  }

  void removeContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }
}
