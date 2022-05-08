import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Center(
        child: Text(
          'Shuffle',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
