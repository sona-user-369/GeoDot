import 'package:geodot/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  static final SocketClient _singleton = SocketClient._internal();
  late Socket socket;

  factory SocketClient() {
    return _singleton;
  }

  SocketClient._internal() {
    socket = io("${Constants.server}/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }

  void connect() {
    socket.connect();
  }

  void disconnect() {
    socket.disconnect();
  }

}
