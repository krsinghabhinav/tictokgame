import 'package:flutter/material.dart';

class StepPage extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String content;

  const StepPage({
    Key? key,
    required this.stepNumber,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Step $stepNumber',
              // style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              // style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              content,
              // style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
