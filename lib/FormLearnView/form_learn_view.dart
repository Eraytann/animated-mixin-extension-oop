import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  //Key üzerinden formun state'i kontrol edilebilir
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () => print('Changed'),
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false)
                    ? null
                    : 'Bu alan boş geçilemez';
              },
            ),
            DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(
                    value: '34',
                    child: Text('İstanbul'),
                  ),
                  DropdownMenuItem(
                    value: '06',
                    child: Text('Ankara'),
                  ),
                  DropdownMenuItem(
                    value: '35',
                    child: Text('İzmir'),
                  ),
                ],
                onChanged: (value) {}),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  print('Okey');
                }
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}

//Validator metodu
class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false)
        ? null
        : ValidatorMessage._notEmptyMessage;
  }
}

class ValidatorMessage {
  static const String _notEmptyMessage = 'Boş Geçilemez!';
}
