// @dart=2.9
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:travel/validator.dart';

const Color mainColor = Color(0xff05b9c8);

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey _headerKey = GlobalKey();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  bool _genderValue = true;
  List<String> countries = ['+65', '+95', '+60', '+66', '+86'];
  String selectedCountry = "";

  Color borderColorActive = mainColor;
  Color borderColorInActive = Colors.transparent;

  Color bgColorActive = Colors.white;
  Color bgColorInActive = Colors.grey[400];

  Color borderColor1 = mainColor;
  Color borderColor2 = Colors.transparent;

  Color bgColor1 = Colors.white;
  Color bgColor2 = Colors.grey[200];
  Size headerSize;
  double guitarPositionTop = 110;
  double guitarPositionRight = 8;
  double guitarImageHeight = 300;

  @override
  void initState() {
    super.initState();
    selectedCountry = countries.first;
    _dateOfBirthController.text = "DD/MM/YYYY";
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _cardBox = _headerKey.currentContext.findRenderObject();
    headerSize = _cardBox.size;

    setState(() {
      guitarPositionTop = headerSize.height + 12;
      guitarPositionRight = headerSize.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding:
                  const EdgeInsets.only(left: 8, top: 32, right: 8, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        autofocus: true,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _firstNameController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        validator: (val) {
                                          return Validator.requiredField(
                                              context,
                                              val.toString(),
                                              "First Name");
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "First Name \*",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        autofocus: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _lastNameController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        validator: (val) {
                                          return Validator.requiredField(
                                              context,
                                              val.toString(),
                                              "Last Name");
                                        },
                                        decoration: const InputDecoration(
                                            labelText: "Last Name \*",
                                            focusColor: mainColor),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        autofocus: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        validator: (val) {
                                          return Validator.email(context,
                                              val.toString(), "Email", true);
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Email \*",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: TextFormField(
                                              autofocus: false,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller:
                                                  _dateOfBirthController,
                                              readOnly: true,
                                              validator: (val) {
                                                return Validator.dateOfBirth(
                                                    context,
                                                    val.toString(),
                                                    true);
                                              },
                                              onTap: () async {
                                                final date =
                                                    await showDatePicker(
                                                        context: context,
                                                        firstDate:
                                                            DateTime(1960),
                                                        initialDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime(2100));
                                                if (date != null) {
                                                  _dateOfBirthController.text =
                                                      DateFormat("dd/MM/yyyy")
                                                          .format(date);
                                                }
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                labelText: "Date of Birth \*",
                                                suffixIcon: Image.asset(
                                                    "assets/images/dob/dob.png"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          ToggleSwitch(
                                            minWidth: 70.0,
                                            borderWidth: 1,
                                            borderColor: [
                                              borderColor1,
                                              borderColor1
                                            ],
                                            cornerRadius: 20.0,
                                            activeBgColors: [
                                              [bgColorActive],
                                              [bgColorActive]
                                            ],
                                            dividerColor: Colors.red,
                                            activeFgColor: Colors.black,
                                            inactiveBgColor: Colors.grey[300],
                                            inactiveFgColor: Colors.black,
                                            initialLabelIndex: 0,
                                            totalSwitches: 2,
                                            labels: const ['Female', 'Male'],
                                            radiusStyle: true,
                                            onToggle: (index) {
                                              _genderValue = !_genderValue;
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        autofocus: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _nationalityController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        validator: (val) {
                                          return Validator.requiredField(
                                              context,
                                              val.toString(),
                                              "Nationality");
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Nationality \*",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        autofocus: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _countryController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        validator: (val) {
                                          return Validator.requiredField(
                                              context,
                                              val.toString(),
                                              "Country of Residence");
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Country of Residence \*",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      _buildMobileWidget(),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Creating account succeed.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                backgroundColor: Colors.green,
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Creating account Fail! Try Again.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            gradient: LinearGradient(stops: [
                                              0.0,
                                              1.0
                                            ], colors: [
                                              Color(0xff05b9c8),
                                              Color(0xff32729c)
                                            ]),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Create my account now",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: -28,
                top: guitarPositionTop - guitarImageHeight / 2,
                child: Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Image.asset(
                    "assets/images/guitar/guitar.png",
                    height: guitarImageHeight,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[500],
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mobile No. (Optional)"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      DropdownButton(
                        underline: Container(),
                        items: countries
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        isExpanded: true,
                        value: selectedCountry,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCountry = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, bottom: 0),
                height: 25,
                width: 1,
                color: Colors.grey[500],
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autofocus: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
                    controller: _phoneController,
                    textAlignVertical: TextAlignVertical.bottom,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (val) {
                      return Validator.phone(
                          context, val.toString(), selectedCountry, false);
                    },
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      key: _headerKey,
      color: Colors.grey[200],
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 32, top: 16, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Almost there!",
                    style: TextStyle(
                      fontFamily: 'Chivo-Black',
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 16, right: 64, bottom: 12),
                    child: const Text(
                      "Complete the form below to create your Ready to Travel account.",
                      style: TextStyle(
                        fontFamily: 'Chivo-Regular',
                      ),
                    ),
                  ),
                  const Text(
                    "\*Mandatory",
                    style: TextStyle(
                      fontFamily: 'Chivo-Light',
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
