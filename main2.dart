import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const PersonalityTest({Key? key}) : super(key: key);

  @override
  _PersonalityTestState createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  String? _gender;
  bool _isAdult = false;
  bool _smokes = false;
  double _cigarettesPerDay = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Navigator ile yeni sayfaya geçiş yap
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          name: _nameController.text,
          surname: _surnameController.text,
          gender: _gender,
          isAdult: _isAdult,
          smokes: _smokes,
          cigarettesPerDay: _cigarettesPerDay,
        ),
      ),
    );
  }

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
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Bilgilerimi Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String name;
  final String surname;
  final String? gender;
  final bool isAdult;
  final bool smokes;
  final double cigarettesPerDay;

  const ResultPage({
    Key? key,
    required this.name,
    required this.surname,
    required this.gender,
    required this.isAdult,
    required this.smokes,
    required this.cigarettesPerDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sonuçlar'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Gönderilen Bilgiler:'),
              const SizedBox(height: 16),
              Text('Ad: $name'),
              Text('Soyad: $surname'),
              Text('Cinsiyet: ${gender ?? "Seçilmedi"}'),
              Text('Reşit mi?: ${isAdult ? "Evet" : "Hayır"}'),
              Text('Sigara kullanıyor mu?: ${smokes ? "Evet" : "Hayır"}'),
              if (smokes) Text('Günde $cigarettesPerDay sigara kullanıyor.'),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Geri dön butonu ile önceki sayfaya geri dön
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Geri Dön'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
