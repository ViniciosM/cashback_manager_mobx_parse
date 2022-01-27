import 'dart:convert';

import 'package:cashback_mobx/constants/keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Customer {
  String? idCustomer;
  String? name;
  String? phone;
  DateTime? createdAt;
  String? email;
  String? cpf;
  String? note;
  int? frequency;
  double? cashbackBalance;
  double? salesValue;

  Customer({
    this.idCustomer,
    this.name,
    this.phone,
    this.createdAt,
    this.email,
    this.cpf,
    this.note,
    this.frequency,
    this.cashbackBalance,
    this.salesValue,
  });


  Customer.fromParse(ParseObject object) {
    idCustomer = object.objectId!;
    createdAt = object.createdAt!;
    name = object.get<String>(keyNameCustomer)!;
    email = object.get<String>(keyEmailCustomer) ?? "";
    phone = object.get<String>(keyPhoneCustomer) ?? "";
    cpf = object.get<String>(keyCpfCustomer) ?? "";
    note = object.get<String>(keyNoteCustomer) ?? "";
    frequency = object.get<int>(keyFrequencyCustomer) ?? 0;
    cashbackBalance = object.get<double>(keyCashbackBalanceCustomer) ?? 0.0;
    salesValue = object.get<double>(keySalesValueCustomer) ?? 0.0;
  }  

  Customer copyWith({
    String? idCustomer,
    String? name,
    String? phone,
    DateTime? createdAt,
    String? email,
    String? cpf,
    String? note,
    int? frequency,
    double? cashbackBalance,
    double? salesValue,
  }) {
    return Customer(
      idCustomer: idCustomer ?? this.idCustomer,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      note: note ?? this.note,
      frequency: frequency ?? this.frequency,
      cashbackBalance: cashbackBalance ?? this.cashbackBalance,
      salesValue: salesValue ?? this.salesValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCustomer': idCustomer,
      'name': name,
      'phone': phone,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'email': email,
      'cpf': cpf,
      'note': note,
      'frequency': frequency,
      'cashbackBalance': cashbackBalance,
      'salesValue': salesValue,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      idCustomer: map['idCustomer'] != null ? map['idCustomer'] : null,
      name: map['name'] != null ? map['name'] : null,
      phone: map['phone'] != null ? map['phone'] : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt']) : null,
      email: map['email'] != null ? map['email'] : null,
      cpf: map['cpf'] != null ? map['cpf'] : null,
      note: map['note'] != null ? map['note'] : null,
      frequency: map['frequency'] != null ? map['frequency'] : null,
      cashbackBalance: map['cashbackBalance'] != null ? map['cashbackBalance'] : null,
      salesValue: map['salesValue'] != null ? map['salesValue'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(idCustomer: $idCustomer, name: $name, phone: $phone, createdAt: $createdAt, email: $email, cpf: $cpf, note: $note, frequency: $frequency, cashbackBalance: $cashbackBalance, salesValue: $salesValue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Customer &&
      other.idCustomer == idCustomer &&
      other.name == name &&
      other.phone == phone &&
      other.createdAt == createdAt &&
      other.email == email &&
      other.cpf == cpf &&
      other.note == note &&
      other.frequency == frequency &&
      other.cashbackBalance == cashbackBalance &&
      other.salesValue == salesValue;
  }

  @override
  int get hashCode {
    return idCustomer.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      createdAt.hashCode ^
      email.hashCode ^
      cpf.hashCode ^
      note.hashCode ^
      frequency.hashCode ^
      cashbackBalance.hashCode ^
      salesValue.hashCode;
  }
}
