import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/model/registration/registrationModel.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/screens/registration/newRegistration/newRegistrationPage.dart';
import 'package:interview/screens/registration/registrationDetails/registrationDetailsPage.dart';
import 'package:interview/supportingWidgets/QButton.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:interview/supportingWidgets/nodata.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationProvider _registrationProvider = RegistrationProvider();

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Registration Page"),
      ),

      bottomNavigationBar: QButton(
        onTap: (){
          push(context, const NewRegistrationPage());
        },
        radius: 0,
        title: "New Registration",
      ),

      body: Stack(
        children: [
          ListView.builder(
            itemCount: _registrationProvider.registrationList.length,
            itemBuilder: (BuildContext context, int index) {
              RegistrationModel reg =
                  _registrationProvider.registrationList[index];
              return ListTile(
                onTap: () {
                  push(context, RegistrationDetailsPage(regId: reg.id));
                },
                tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                title: QText("RegistrationId: #${reg.id}"),
                trailing: const Icon(Icons.keyboard_arrow_right),
              );
            },
          ),

          ///no data
          if (_registrationProvider.registrationList.isEmpty) const NoData(),

          ///loading
          if (_registrationProvider.loading) Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _registrationProvider.getRegistrationList();
    });
    super.initState();
  }
}
