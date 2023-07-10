part of televerse;

/// This object represents a Inline Keyboard with the action to be done.
class InlineMenu
    implements
        InlineKeyboardMarkup,
        TeleverseMenu<CallbackQueryContext, CallbackQueryHandler> {
  /// Name of the menu
  @override
  String? name;

  /// Map that represents the text and action to be done
  @override
  List<Map<String, CallbackQueryHandler>> actions;

  /// Constructs a InlineMenu
  InlineMenu({
    List<Map<String, CallbackQueryHandler>>? actions,
    this.name,
  })  : actions = actions ?? [{}],
        inlineKeyboard = TeleverseMenu._makeInlineKeyboard(actions);

  /// Add a new row to the keyboard
  InlineMenu row() {
    if (actions.last.isEmpty) return this;
    actions.add({});
    inlineKeyboard = TeleverseMenu._makeInlineKeyboard(actions);
    return this;
  }

  /// Add new item to the last row
  InlineMenu text(String text, CallbackQueryHandler handler) {
    if (actions.isEmpty) actions.add({});
    actions.last.addAll({text: handler});
    inlineKeyboard = TeleverseMenu._makeInlineKeyboard(actions);
    return this;
  }

  /// List of rows of the keyboard
  @override
  List<List<InlineKeyboardButton>> inlineKeyboard;

  /// Converts the object to a JSON object
  @override
  Map<String, dynamic> toJson() {
    return {
      'inline_keyboard': inlineKeyboard.map((row) {
        return row.map((button) {
          return button.toJson();
        }).toList();
      }).toList(),
    }..removeWhere((key, value) => value == null);
  }
}
