import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _slideValue = 30;
  bool _bloquear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            Text(_slideValue.toString()),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: '$_slideValue',
      divisions: 20,
      value: _slideValue,
      min: 30,
      max: 300,
      onChanged: !_bloquear
          ? (opt) {
              setState(() {
                _slideValue = opt;
              });
            }
          : null,
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.clipartkey.com/mpngs/m/35-356197_image-png-iron-man-iron-man-png-hd.png'),
      width: _slideValue,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //   value: _bloquear,
    //   onChanged: (value) {
    //     setState(() {
    //       _bloquear = value;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquar slide con checkbox'),
      value: _bloquear,
      onChanged: (value) {
        setState(() {
          _bloquear = value;
        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquar slide con switch'),
      value: _bloquear,
      onChanged: (value) {
        setState(() {
          _bloquear = value;
        });
      },
    );
  }
}
