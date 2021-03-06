import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 300.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( _bloquearCheck ) ? null : ( valor ){

        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _checkBox() {

    return CheckboxListTile(
      title: Text('Bloquear slider Tipo 1'),
      value: _bloquearCheck,
      onChanged: (valor){ 
        setState(() {
          _bloquearCheck = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider Tipo 2'),
      value: _bloquearCheck,
      onChanged: (valor){ 
        setState(() {
          _bloquearCheck = valor;
        });
      },

    );
  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://cdn.icon-icons.com/icons2/1694/PNG/512/peperuflag_111973.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

}