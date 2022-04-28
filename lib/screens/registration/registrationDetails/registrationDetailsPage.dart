import 'package:flutter/material.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/screens/registration/registrationDetails/regDetails.dart';
import 'package:interview/screens/registration/registrationDetails/showDeleteAlert.dart';
import 'package:interview/supportingWidgets/QButton.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:interview/supportingWidgets/nodata.dart';
import 'package:provider/provider.dart';

class RegistrationDetailsPage extends StatefulWidget {
  final int regId;
  const RegistrationDetailsPage({Key? key,required this.regId}) : super(key: key);

  @override
  State<RegistrationDetailsPage> createState() => _RegistrationDetailsPageState();
}

class _RegistrationDetailsPageState extends State<RegistrationDetailsPage> {
  RegistrationProvider _registrationProvider = RegistrationProvider();

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of(context);
    return Scaffold(

      bottomNavigationBar: Visibility(
        visible: _registrationProvider.regDetails != null,
        child: QButton(
          onTap: (){
            showDeleteAlert();
          },
          loading: _registrationProvider.deleteLoading,
          color: Colors.red,
          radius: 0,
          title: "Delete Registration",
        ),
      ),

      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Registration Page"),
      ),
      body: Stack(
        children: [

          if (_registrationProvider.regDetails != null)
            const RegDetails(),

          ///no data
          if (_registrationProvider.regDetails == null) const NoData(),

          ///loading
          if (_registrationProvider.regDetailsLoading) Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _registrationProvider.getRegDetails(widget.regId);
    });
    super.initState();
  }

  @override
  void dispose() {
    _registrationProvider.clearData();
    super.dispose();
  }
}
