import 'package:geodot/data/services/auth_service.dart';
import 'package:geodot/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketClient {
  static final SocketClient _singleton = SocketClient._internal();
  late WebSocketChannel socket;

  factory SocketClient() {
    return _singleton;
  }

  SocketClient._internal() {
    socket = IOWebSocketChannel.connect(
      '${Constants.socketServer}/${AuthService.userId}',
      headers: {'Connection': 'upgrade', 'Upgrade': 'websocket'}
    );
  }

  void connect() {

  }

  void disconnect() {
    socket.sink.close();
  }

}
