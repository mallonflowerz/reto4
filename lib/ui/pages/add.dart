import 'package:almacenamiento_gps/domain/controller/controlgps.dart';
import 'package:almacenamiento_gps/domain/controller/controllocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdicionarPunto extends StatelessWidget {
  const AdicionarPunto({super.key});

  @override
  Widget build(BuildContext context) {
    ControlGps cu = Get.find();
    ControlPuntos cp = Get.find();
    TextEditingController np = TextEditingController();
    TextEditingController lon = TextEditingController(text: '0.0');
    TextEditingController lat = TextEditingController(text: '0.0');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Puntos'),
        actions: [
          IconButton(
              onPressed: () {
                cu.obtenerubicacion().then((value) {
                  lon.text = cu.lon;
                  lat.text = cu.lat;
                });
              },
              icon: const Icon(Icons.gps_fixed))
        ],
      ),
      body: ListView(
        children: [
          TextField(
            controller: np,
            decoration:
                const InputDecoration(labelText: 'Ingrese nombre del punto'),
          ),
          TextField(
            controller: lon,
            textAlign: TextAlign.center,
            readOnly: true,
          ),
          TextField(
            controller: lat,
            readOnly: true,
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
              onPressed: () {
                cp
                    .addPuntos(np.text, lon.text, lat.text)
                    .then((value) => cp.consultaGral());
              },
              child: const Text('Almacenar Punto'))
        ],
      ),
    );
  }
}
