part of types;

/// This object represents type of an incoming update.
enum UpdateType {
  /// Message update
  message("message"),

  /// Edited message update
  editedMessage("edited_message"),

  /// Channel post update
  channelPost("channel_post"),

  /// Edited channel post update
  editedChannelPost("edited_channel_post"),

  /// Inline query update
  inlineQuery("inline_query"),

  /// Chosen inline result update
  chosenInlineResult("chosen_inline_result"),

  /// Callback query update
  callbackQuery("callback_query"),

  /// Shipping query update
  shippingQuery("shipping_query"),

  /// Pre checkout query update
  preCheckoutQuery("pre_checkout_query"),

  /// Poll update
  poll("poll"),

  /// Poll answer update
  pollAnswer("poll_answer"),

  /// My chat member update
  myChatMember("my_chat_member"),

  /// Chat member update
  chatMember("chat_member"),

  /// Chat join request update
  chatJoinRequest("chat_join_request"),

  /// Unknow update type
  unknown("unknown");

  /// The value of this enum.
  final String type;

  /// Constructs a new [UpdateType].
  const UpdateType(this.type);

  /// Check if the update is a message update
  bool get isMessage => this == UpdateType.message;

  /// Check if the update is an edited message update
  bool get isEditedMessage => this == UpdateType.editedMessage;

  /// Check if the update is a channel post update
  bool get isChannelPost => this == UpdateType.channelPost;

  /// Check if the update is an edited channel post update
  bool get isEditedChannelPost => this == UpdateType.editedChannelPost;

  /// Check if the update is an inline query update
  bool get isInlineQuery => this == UpdateType.inlineQuery;

  /// Check if the update is a chosen inline result update
  bool get isChosenInlineResult => this == UpdateType.chosenInlineResult;

  /// Check if the update is a callback query update
  bool get isCallbackQuery => this == UpdateType.callbackQuery;

  /// Check if the update is a shipping query update
  bool get isShippingQuery => this == UpdateType.shippingQuery;

  /// Check if the update is a pre checkout query update
  bool get isPreCheckoutQuery => this == UpdateType.preCheckoutQuery;

  /// Check if the update is a poll update
  bool get isPoll => this == UpdateType.poll;

  /// Check if the update is a poll answer update
  bool get isPollAnswer => this == UpdateType.pollAnswer;

  /// Check if the update is a my chat member update
  bool get isMyChatMember => this == UpdateType.myChatMember;

  /// Check if the update is a chat member update
  bool get isChatMember => this == UpdateType.chatMember;

  /// Check if the update is a chat join request update
  bool get isChatJoinRequest => this == UpdateType.chatJoinRequest;

  /// Constructs a new [UpdateType] from a [String].
  factory UpdateType.fromJson(String type) {
    return UpdateType.values.firstWhere((e) => e.type == type);
  }
}
