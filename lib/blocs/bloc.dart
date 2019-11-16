import 'dart:async';

class Bloc {
  
  final pedidos = StreamController<String>();

  Stream<String> get mostradorRecogida => pedidos.stream.transform(validarPedido);

  static final _pizzaList = {
    "Shushi": 2,
    "Napolitana": 3,
    "California": 4,
    "Marinara": 1,
  };

  static final _pizzasImages = {
    "Shushi": "http://pngimg.com/uploads/pizza/pizza_PNG44077.png",
    "Napolitana": "http://pngimg.com/uploads/pizza/pizza_PNG44078.png",
    "California": "http://pngimg.com/uploads/pizza/pizza_PNG44081.png",
    "Marinara": "http://pngimg.com/uploads/pizza/pizza_PNG44084.png",
  };

  final validarPedido = StreamTransformer<String, String>.fromHandlers(handleData: (pedido, sink) {

    if(_pizzaList[pedido] != null) {
      if(_pizzaList[pedido] > 0) {
        sink.add(_pizzasImages[pedido]);
        final cantidad = _pizzaList[pedido];
        _pizzaList[pedido] = cantidad - 1;
      } else {
        sink.addError("No Esta disponible la pizza");
      }
    } else {
      sink.addError("Pizza no encontrada");
    }

  });

  void nuevoPedido(String pizza) {
    pedidos.sink.add(pizza);
  }

}