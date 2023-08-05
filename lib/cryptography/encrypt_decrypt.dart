// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:node_js_integration_flutter/cryptography/my_encryption.dart';

class Encrypt_Decrypt extends StatefulWidget {
  const Encrypt_Decrypt({super.key});

  @override
  State<Encrypt_Decrypt> createState() => _Encrypt_DecryptState();
}

class _Encrypt_DecryptState extends State<Encrypt_Decrypt> {
  final tec = TextEditingController();
  var encryptedText, plainText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryption/Decryption"),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: tec,
            ),
          ),
          Column(
            children: [
              Text(
                "Plain Text",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(plainText == null ? "" : plainText),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Encrypted Text",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(encryptedText == null
                    ? ""
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64
                        : encryptedText),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    plainText = tec.text;
                    setState(() {
                      encryptedText = MyEncryptiondecryption.encryptAES(plainText);
                    });
                  },
                  child: Text("Encrypt")),
              ElevatedButton(onPressed: () {
                setState(() {
                  encryptedText = MyEncryptiondecryption.decryptAES(encryptedText);
                });
              }, child: Text("Decrypt")),
            ],
          )
        ]),
      ),
    );
  }
}
