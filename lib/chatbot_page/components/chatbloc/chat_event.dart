// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

sealed class ChatEvent {}

class ChatGenerateNewTextMessageEvent extends ChatEvent {
  final String inputMessage;
  ChatGenerateNewTextMessageEvent({
    required this.inputMessage,
  });
}
