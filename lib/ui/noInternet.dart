import 'package:flutter/material.dart';

import '../utils/constants.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('No connection',style: TextStyle(color: Colors.white),),centerTitle: true,),
    );
  }
}
