import 'package:googlesheet_api_demo/googlesheet_api/userfiels_class.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetApi {
  static const credential = r'''
  {
  "type": "service_account",
  "project_id": "useful-lattice-370009",
  "private_key_id": "844dd6cd5c26ff388feab2d32e1d75fd10f6e89a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDYWvGTKG+31Qag\nNNVt8ZEuZJAWR95rr8QlGr1UUMT2zxYlcRRH+mNeDn/TL2fp4NkiYG1dlhRKco6+\n3ophMQu3DZU8NOJNYI3US9KIIuLbxFyGZRZgFziyxM90v/RmP1SNRo9Fgcfs9cgt\nvp6ky29B6TO2CsADtrwaKRQYsMwuDaAwcApD9usaPsMGhDH2iQ7c5+GgM0gP3go8\nrDQOvkTEbhzCxYuOktUsjWiFlUoNnl1s1lL2zni84vz/sBmYWoMPPrW8V6TXgQpn\nwX9NvU8tl9gc+npulSohAw8SDkPWCLnRnQYRODhq148LLTObhLZsCh08irwb1JZS\nrYthoPS9AgMBAAECggEAa8PUy0Nbbjot/DOE0af+9BhECs0OdR4N+ZtZjbtTeEoL\nEmhCPV3zC8D2G3dj74M/NFfKcdCU18Y64siPLb0TxECAQoZm6Dq9Om7v9T5HOEcU\n/R4x6Hf4llbgrJsGPb2yvFHWgD0WG6oK5PorJBNunepuBvFQ1ii5heBLMccyVIcr\nFHLyH5Q4nQ/cpcJJ05+DXPBn31zxeOMq7I6nq9V06CjhCmOVydZWzA9GuzPlrAPz\n+5TM1aphr4X9X3NIIte43ZB7hi8wYyvbpLxMZcq0F/hEQhvJXh9FuXAZJkBuVihp\n2W4DUfb8+Xl6j91avMTRCw8XSdB07fe0covCT0mSowKBgQD5rjHaM3cnp+0rmwrR\nvQIuNsYCMDBtYSYajFAGhFJZXCk6YfcDBT/odCKWonpylz3PuGScHuKSsD0z9gr+\nrJavnATWIEV4JjioXTq/2R+h7zDhfgQsrxEqP24q9ZHmQ3/tI4P8clRRQ9YO72VK\n+RcfRzMgov7QjMFcQV/6rWYkRwKBgQDd1NF0KK6YnRc+P3+7PDnSurBUYDbbl/GB\nD05epzarIYR+2XajsOQntf9RvoH9Chn9ErLTV7XCsHHAopePkvrAdS4T9afiKhJg\n4janSOz6m02af5u3r71f/qWEG2gnvP6ZPmGmv8RDf+cPUWM3feHvrzVNpJAlLkXN\nbiJyDVK02wKBgHAYO7t55aIBK2KrXeUiFUuIPceXuPYyanf6zKbQW2RRExVqDAro\nHXQQR8MXOSAfNJoAb/MDjrdKtn+QlAkYlSJMSoOTw3yYtFEqYgjlwuThzTE/cUJa\nartr9NsGmzUk0tc1XblF3wMJEJ5t7i0FvdLGFXculnYs61au5xdVKAlbAoGBANh+\nUsxix8L5zS1bG3XIGUaoHF68Z814RKIIJhwKZTguxfhmk3q9sG1xGXTV0Fb7/NEX\n5p6MAz+2o8204OWmNEKQGiAwp1/6X2VeYKhya5VI7DvUPkzOnquJAlAjz0q5EGDO\nmM78aLbXpNE2RPZrTI13GTZlXKhsuIL88XENv6HxAoGAL3EbY6orka5RXOxwnG/f\n2ufuQQljnS5CsLHVT408DSYqOp4rVABxIRKsaoTLExGWDYxeqVJBOW0aqZb7MYpv\nreKJxj+Kl2hwt7axDZ73Q2TK/fzta1U7Ky1TxHZ/C2vY3QwE7eRtUSqEY9342fYN\n2qgfqcSoRKnh3mt3p/2Y4Xc=\n-----END PRIVATE KEY-----\n",
  "client_email": "googlesheet@useful-lattice-370009.iam.gserviceaccount.com",
  "client_id": "107948414308561938545",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/googlesheet%40useful-lattice-370009.iam.gserviceaccount.com"
} ''';
  static final sheetId = "1kjfprW2P5l3Zjw2TdsdmS1SCilSIZTZCikIq10K6HBM";
  static final gsheet = GSheets(credential);
  static Worksheet? worksheet;
  static Future<void> init() async {
    try {
      final spedsheet = await gsheet.spreadsheet(sheetId);
      worksheet = await getWorkSheet(spedsheet, "User1");
      final firstRow = UserFieldClass.getField;
      worksheet?.values.insertRow(1, firstRow);
    } catch (e) {
      print("error in init===$e");
    }
  }

  static Future<Worksheet?> getWorkSheet(
      Spreadsheet spreadSheet, String title) async {
    try {
      return await spreadSheet.addWorksheet(title);
    } catch (e) {
      return spreadSheet.worksheetByTitle(title);
    }
  }

  static Future<void> insert(Map<String, dynamic> rowList) async {
    try {
      worksheet?.values.map.appendRow(rowList);
    } catch (e) {
      print("error in inser row==${e}");
    }
  }
}
