import 'package:flutter/material.dart';

class InternetExpectionWidget extends StatelessWidget {
  final VoidCallback onpressed;
  const InternetExpectionWidget({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "we're unable to show results. \n please check your data \nconnection  ",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .1,
        ),
        ElevatedButton(
            onPressed: onpressed,
            child: Text(
              'Retry',
              style: Theme.of(context).textTheme.bodySmall,
            ))
      ],
    );
  }
}
