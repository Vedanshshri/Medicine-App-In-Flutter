import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../helpers/platform_flat_button.dart';
import '../../screens/welcome/title_and_message.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  DateTime setDateBreakfast = DateTime.now();
  DateTime setDateLunch = DateTime.now();
  DateTime setDateDinner = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //------------------------OPEN TIME PICKER (SHOW)----------------------------
    //------------------------CHANGE CHOOSE PILL TIME----------------------------

    Future<void> openTimePickerBreakfast() async {
      await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              helpText: "Choose Time")
          .then((value) {
        DateTime newDate = DateTime(
            setDateBreakfast.year,
            setDateBreakfast.month,
            setDateBreakfast.day,
            value != null ? value.hour : setDateBreakfast.hour,
            value != null ? value.minute : setDateBreakfast.minute);
        setState(() => setDateBreakfast = newDate);
        print(newDate.hour);
        print(newDate.minute);
      });
    }

    Future<void> openTimePickerLunch() async {
      await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              helpText: "Choose Time")
          .then((value) {
        DateTime newDate = DateTime(
            setDateLunch.year,
            setDateLunch.month,
            setDateLunch.day,
            value != null ? value.hour : setDateLunch.hour,
            value != null ? value.minute : setDateLunch.minute);
        setState(() => setDateLunch = newDate);
        print(newDate.hour);
        print(newDate.minute);
      });
    }

    Future<void> openTimePickerDinner() async {
      await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              helpText: "Choose Time")
          .then((value) {
        DateTime newDate = DateTime(
            setDateDinner.year,
            setDateDinner.month,
            setDateDinner.day,
            value != null ? value.hour : setDateDinner.hour,
            value != null ? value.minute : setDateDinner.minute);
        setState(() => setDateDinner = newDate);
        print(newDate.hour);
        print(newDate.minute);
      });
    }

    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    void goToHomeScreen() => Navigator.pushReplacementNamed(context, "/home");

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.04,
              ),
              Image.asset('assets/images/welcome_image.png',
                  width: double.infinity, height: deviceHeight * 0.4),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              TitleAndMessage(deviceHeight),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Text("BreakFast Time"),
              Container(
                height: 150,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: PlatformFlatButton(
                          handler: () => openTimePickerBreakfast(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat.Hm().format(this.setDateBreakfast),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.access_time,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Lunch Time"),
              Container(
                height: 150,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: PlatformFlatButton(
                          handler: () => openTimePickerLunch(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat.Hm().format(this.setDateLunch),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.access_time,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Dinner Time"),
              Container(
                height: 150,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: PlatformFlatButton(
                          handler: () => openTimePickerDinner(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat.Hm().format(this.setDateDinner),
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.access_time,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          color: Color.fromRGBO(7, 190, 200, 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Container(
                height: deviceHeight * 0.09,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: PlatformFlatButton(
                      handler: goToHomeScreen,
                      color: Theme.of(context).primaryColor,
                      buttonChild: FittedBox(
                        child: Text(
                          "Get started now",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
