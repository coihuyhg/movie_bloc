import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.redAccent,
      child: Center(
        child: Text(
          'Favorite',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
