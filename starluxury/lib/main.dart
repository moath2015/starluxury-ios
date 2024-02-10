import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 251, 226, 193)),
        useMaterial3: true,
      ),
      locale: Locale('ar'),
      home: const MyHomePage(title: 'امر تشغيل'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String _driverName = '';
  String _driverId = '';
  String _carType = '';
  String _carPlate = '';
  String _companyName = '';
  String _destination = '';
  String _unionFrom = '';
  String _passengerName = '';
  DateTime _date = DateTime.now();
  String _city = '';
  String _signature = '';

  String _driverNationality = '';

  String _driverIdSource = '';

  String _carColor = '';

  String _carNumber = '';

  String _carModel = '';

  String _passengerFlight = '';

  String _From = '';

  String _dateString = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and title
                    // Row(
                    //   children: [
                    //     Image.asset('assets/logo.png', width: 100, height: 100),
                    //     const SizedBox(width: 16),
                    //     const Text(
                    //       'أمانة منطقة مكة المكرمة\nمعالجة البيانات',
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // First section

                    const SizedBox(height: 16),
                    Container(
                      color: Colors.brown,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'المعلومات الشخصية',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: 'اسـم السائـق',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال اسـم السائـق';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _driverName = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'الجنسية',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال الجنسية';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _driverNationality = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'رقم الهوية',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم الهوية';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _driverId = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'مصدرهـا ',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال مصدرهـا';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _driverIdSource = value!;
                      },
                    ),
                    // Second section
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.brown,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        ' مــعــلـــومــات الـسـيـــارة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'نوع السيارة ',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال نوع السيارة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _carType = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'لون  السيارة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال لون  السيارة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _carColor = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: ' رقم اللوحة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم اللوحة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _carNumber = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'موديل السيارة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال موديل السيارة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _carModel = value!;
                      },
                    ),
                    // Third section
                    const SizedBox(height: 16),
                    Container(
                      color: Colors.brown,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'مــعــلـــومــات الضــــيـف',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'اسـم الشركة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال اسـم الشركة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _companyName = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'اسـم الـضـيف',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال اسـم الـضـيف';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _passengerName = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: ' الرحلة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال  الرحلة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _passengerFlight = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'اسـم الـضـيف',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال اسـم الـضـيف';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _passengerName = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'التاريخ ',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال التاريخ ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _dateString = value!;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'متجهة إلى',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال متجهة إلى';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _destination = value!;
                      },
                    ),
                    // Submit button
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: ' المدينة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال المدينة';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _From = value!;
                      },
                    ),

                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        child: const Text('إرسال'),
                        onPressed: () async {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            await _createpdf();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم إرسال النموذج بنجاح'),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Future<File> copyAsset(String name) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/$name');
    ByteData bd = await rootBundle.load('assets/images/$name');
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    return tempFile;
  }

  Future<void> _createpdf() async {
    var data = new Map<String, String>();
    data['date'] = _dateString;
    data['driver_name'] = _driverName;
    data['driver_nat'] = _driverNationality;
    data['driver_idt'] = _driverIdSource;
    data['car_type'] = _carType;
    data['car_color'] = _carColor;
    data['car_num'] = _carNumber;
    data['car_model'] = _carModel;
    data['p_name'] = _passengerName;
    data['p_num'] = _passengerFlight;
    data['p_from'] = _From;
    data['p_to'] = _destination;
    data['driver_id'] = _driverId;
    PdfDocument document = PdfDocument(
        inputBytes: (await copyAsset('driver.pdf')).readAsBytesSync());
    PdfPage page = document.pages[0];
    //Set a standard font
    PdfFont font =
        PdfTrueTypeFont((await copyAsset('arial.ttf')).readAsBytesSync(), 14);
    var keys = [
      'date',
      'driver_name',
      'driver_nat',
      'driver_idt',
      'car_type',
      'car_color',
      'car_num',
      'car_model',
      'p_name',
      'p_num',
      'p_from',
      'p_to',
      'driver_id'
    ];

    for (var element in keys) {
      try {
        List<MatchedItem> textCollection =
            PdfTextExtractor(document).findText([element]);
        Rect rect = textCollection[0].bounds;
        print(textCollection.length);
        double w = 150;
        double l = rect.right - 150;
        PdfFont f = font;
        PdfBrush brush = PdfBrushes.black;
        String text = data[element] ?? '';
        print(text);
        Size size = font.measureString(text);

        if (element == 'date') {
          f = PdfStandardFont(PdfFontFamily.helvetica, 8);
          size = f.measureString(text);
          w = 50;
          l = rect.center.dx - 36;

          brush = PdfBrushes.goldenrod;
        }
        document.pages[0].graphics.drawRectangle(
            brush: PdfBrushes.white,
            bounds: Rect.fromLTWH(l, rect.top, w, size.height));
        //Add the page.
        document.pages[0].graphics.drawString(text, f,
            brush: brush,
            bounds: Rect.fromLTWH(l, rect.top, w, size.height),
            format: PdfStringFormat(
                textDirection: PdfTextDirection.rightToLeft,
                alignment: PdfTextAlignment.center,
                paragraphIndent: 0));
      } catch (e) {}
    }

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/Output.pdf');
    //Save and dispose of the PDF document.
    tempFile.writeAsBytes(await document.save());
    document.dispose();
    OpenFile.open(tempFile.path);
  }
}
