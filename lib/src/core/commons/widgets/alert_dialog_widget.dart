import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String description;
  final Function callback;
  final String title;
  const AlertDialogWidget({
    super.key,
    required this.callback,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, elevation: 0),
                          child: const Text(
                            'Cancelar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            callback();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, elevation: 0),
                          child: const Text(
                            'Aceptar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff77a3de),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
