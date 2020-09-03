import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  final PermissionHandler _permissionHandler = PermissionHandler();

  Future<bool> _requestPermission(PermissionGroup permission) async {
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }


  Future<bool> requestContactsPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.contacts);
    if (!granted) {
      onPermissionDenied();
    }
    return granted;
  }
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FF ',
      home: Scaffold (
        body: Center(
          child: MaterialButton(
            color: Colors.yellow[300],
            child: Text('Request contacts permission'),
            onPressed: () {
              PermissionService().requestContactsPermission(
                onPermissionDenied: () {
                  print('Permission has been denied');
                }
              );
            },
          ),
        ),
      ),
    );
  }
}
