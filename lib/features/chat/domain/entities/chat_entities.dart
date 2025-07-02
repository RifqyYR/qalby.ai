import 'package:equatable/equatable.dart';

class ChatMessageEntities extends Equatable {
  final String text;
  final bool isUser;

  const ChatMessageEntities({required this.text, required this.isUser});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}
