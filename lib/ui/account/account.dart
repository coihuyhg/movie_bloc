import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Account',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
