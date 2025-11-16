import 'package:cloud_functions/cloud_functions.dart';

final FirebaseFunctions functions = FirebaseFunctions.instance;

Future<void> callHelloFunction() async {
  try {
    HttpsCallable callable = functions.httpsCallable('sayHello');
    final response = await callable.call(<String, dynamic>{
      'name': 'Dominick',
    });
    print(response.data['message']); // "Hello, Dominick!"
  } catch (e) {
    print('Error calling function: $e');
  }
}
