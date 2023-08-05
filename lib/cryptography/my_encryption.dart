import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptiondecryption {
  // for AES Encryption/Decryption Algorithm we require key, iv and encrypter
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  // FUNCTION FOR ENCRYPTION
  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  // FUNCTION FOR DECRYPTION
  static decryptAES(text) {
    if (text is encrypt.Encrypted) {
      return encrypter.decrypt(text, iv: iv);
    }
    return text;
  }
}
