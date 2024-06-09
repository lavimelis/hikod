import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kişilik Testi',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        scaffoldBackgroundColor: const Color(0xFFFFFDD0), // Custom cream color
      ),
      home: const PersonalityTest(),
    );
  }
}

class PersonalityTest extends StatefulWidget {
  const PersonalityTest({super.key});

  @override
  _PersonalityTestState createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  String? _gender;
  bool _isAdult = false;
  bool _smokes = false;
  double _cigarettesPerDay = 0;
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kişilik Anketi'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Adınız:'),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Soyadınız:'),
              TextField(
                controller: _surnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Cinsiyetinizi seçiniz:'),
              DropdownButton<String>(
                value: _gender,
                items: const [
                  DropdownMenuItem(value: 'Erkek', child: Text('Erkek')),
                  DropdownMenuItem(value: 'Kadın', child: Text('Kadın')),
                  DropdownMenuItem(value: 'Diğer', child: Text('Diğer')),
                ],
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                hint: const Text('Cinsiyetinizi seçiniz'),
                isExpanded: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Reşit misiniz?'),
                  Checkbox(
                    value: _isAdult,
                    onChanged: (value) {
                      setState(() {
                        _isAdult = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Sigara kullanıyor musunuz?'),
                  Switch(
                    value: _smokes,
                    onChanged: (value) {
                      setState(() {
                        _smokes = value;
                        if (!value) {
                          _cigarettesPerDay = 0;
                        }
                      });
                    },
                  ),
                ],
              ),
              if (_smokes)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Günde kaç tane sigara kullanıyorsunuz?'),
                    Slider(
                      value: _cigarettesPerDay,
                      min: 0,
                      max: 40,
                      divisions: 40,
                      label: _cigarettesPerDay.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _cigarettesPerDay = value;
                        });
                      },
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showResult = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Bilgilerimi Gönder'),
                ),
              ),
              if (_showResult)
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Adınız: ${_nameController.text}\n'
                        'Soyadınız: ${_surnameController.text}\n'
                        'Cinsiyet: ${_gender ?? "Seçilmedi"}\n'
                        'Reşit misiniz?: ${_isAdult ? "Evet" : "Hayır"}\n'
                        'Sigara kullanıyor musunuz?: ${_smokes ? "Evet" : "Hayır"}\n'
                        '${_smokes ? "Günde ${_cigarettesPerDay.round()} sigara kullanıyorsunuz." : ""}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

