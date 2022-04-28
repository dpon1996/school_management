import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/res/values.dart';
import 'package:interview/supportingWidgets/QButton.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:provider/provider.dart';

showDeleteAlert() {
  showModalBottomSheet(
      context: navigatorKey.currentContext!,
      builder: (_) {
        return const DeleteAlert();
      });
}

class DeleteAlert extends StatefulWidget {
  const DeleteAlert({Key? key}) : super(key: key);

  @override
  State<DeleteAlert> createState() => _DeleteAlertState();
}

class _DeleteAlertState extends State<DeleteAlert> {
  RegistrationProvider _registrationProvider = RegistrationProvider();

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of(context);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: padHorizontal, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const QText("Do you wan to delete",
              fontSize: 15, fontWeight: FontWeight.w500),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: QButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  radius: 0,
                  color: Colors.green,
                  title: "No",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: QButton(
                  onTap: () {
                    Navigator.pop(context);
                    _registrationProvider.deleteRegistration();
                  },
                  radius: 0,
                  color: Colors.red,
                  title: "Yes",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
