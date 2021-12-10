import 'dart:io';

abstract class EditProfileEvent {}

class OnEditDataEvent extends EditProfileEvent{
  OnEditDataEvent();
}


class OnEditApiHit extends EditProfileEvent {
  String username;
  File file;
  OnEditApiHit(this.username,this.file);
}