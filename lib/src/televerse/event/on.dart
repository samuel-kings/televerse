part of televerse;

/// A mixin that adds the [on] method to the [Event] class.
///
/// This mixin is used to register callbacks for specific update types. This mixin is used internally by the [Televerse] class.
mixin OnEvent on Event {
  /// Registers a callback for particular filter types.
  ///
  /// The call back will be only be executed on specific update types. You can
  /// use the [TeleverseEvent] object to specify which update you want to listen to.
  void on(TeleverseEvent type, FutureOr<void> Function(Context ctx) callback) {
    onUpdate.listen((update) {
      bool isTextMessage =
          update.message?.text != null || update.channelPost?.text != null;
      bool isChannelPost = update.type == UpdateType.channelPost;
      bool isMessage = update.type == UpdateType.message;
      bool isEditedMessage = update.type == UpdateType.editedMessage;
      bool isEditedChannelPost = update.type == UpdateType.editedChannelPost;
      bool isAudioMessage = update.message?.audio != null;
      bool isAudioChannelPost = update.channelPost?.audio != null;
      bool hasAudio = isAudioMessage || isAudioChannelPost;

      bool isMessageOrChannelPost = isMessage || isChannelPost;
      bool isEdited = isEditedMessage || isEditedChannelPost;

      bool isDocumentMessage = update.message?.document != null;
      bool isDocumentChannelPost = update.channelPost?.document != null;
      bool hasDocument = isDocumentMessage || isDocumentChannelPost;

      bool isPhotoMessage = update.message?.photo != null;
      bool isPhotoChannelPost = update.channelPost?.photo != null;
      bool hasPhoto = isPhotoMessage || isPhotoChannelPost;

      if (type == TeleverseEvent.text) {
        if (isMessageOrChannelPost && isTextMessage) {
          if (televerse == null) {
            print('so here we fall');
            return;
          }
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.audio) {
        if (isMessageOrChannelPost && hasAudio) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.audioMessage) {
        if (isMessage && isAudioMessage) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.edited) {
        if (isEdited) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.editedMessage) {
        if (isEditedMessage) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.editedChannelPost) {
        if (isEditedChannelPost) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.document) {
        if (isMessageOrChannelPost && hasDocument) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.documentMessage) {
        if (isMessage && isDocumentMessage) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.documentChannelPost) {
        if (isChannelPost && isDocumentChannelPost) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.photo) {
        if (isMessageOrChannelPost && hasPhoto) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.photoMessage) {
        if (isMessage && isPhotoMessage) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }

      if (type == TeleverseEvent.photoChannelPost) {
        if (isChannelPost && isPhotoChannelPost) {
          if (televerse == null) return;
          callback(MessageContext(
            televerse!,
            update.message!,
            update: update,
          ));
        }
      }
    });
  }
}
