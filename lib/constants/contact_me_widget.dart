import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pramod_portfolio/constants/string_values.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('you can Reach Me at?', style: TextStyle(fontSize: 30)),
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(EvaIcons.phone_call_outline, size: 40),
                      Gap(15),
                      Text(
                        StringValues.phoneNumber,
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Icon(EvaIcons.email_outline, size: 40),
                      Gap(15),
                      Text(
                        StringValues.emailID,
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
