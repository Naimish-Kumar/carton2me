import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class AddDetailsScreen extends StatefulWidget {
  AddDetailsScreen({
    super.key,
  });

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final item1Controller = TextEditingController();

  final item2Controller = TextEditingController();

  final item3Controller = TextEditingController();

  final item4Controller = TextEditingController();

  final item5Controller = TextEditingController();

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: const Color.fromARGB(255, 255, 72, 93),
  );

  @override
  void dispose() {
    item1Controller.dispose();
    item2Controller.dispose();
    item3Controller.dispose();
    item4Controller.dispose();
    item5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Text(
              'Add Details',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormScreen(
                    hinttext: 'BP(HA civil engineering, piece)',
                    textEditingController: item1Controller,
                    icon: Icons.ac_unit_rounded,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormScreen(
                    hinttext: 'BP Is (date)',
                    textEditingController: item2Controller,
                    icon: Icons.ac_unit_rounded,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormScreen(
                    hinttext: 'Reconnaissance ',
                    textEditingController: item3Controller,
                    icon: Icons.add_chart_rounded,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormScreen(
                    hinttext: 'HA meter built ',
                    textEditingController: item4Controller,
                    icon: Icons.apartment_rounded,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormScreen(
                    hinttext: 'AP outside',
                    textEditingController: item5Controller,
                    icon: Icons.architecture_rounded,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormScreen(
                    hinttext: 'Have Column',
                    textEditingController: item5Controller,
                    icon: Icons.area_chart_rounded,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sketch at BL',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Signature(
                            controller: _controller,
                            height: 300,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () => _controller.clear(),
                        child: const Text('Reset'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SubmitButton(
                    onPressed: () {},
                    text: 'Submit',
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
