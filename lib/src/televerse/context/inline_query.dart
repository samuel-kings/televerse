part of televerse.context;

/// This context is used when an inline query is received. It is a subclass of [Context]
/// with [InlineQueryMixin]. It contains the inline query and the update. The context will be passed to the inline query handler, and once you have the context you can simply use the methods to reply or answer the query.
class InlineQueryContext extends Context with InlineQueryMixin {
  /// The incoming inline query.
  InlineQuery get query => update.inlineQuery!;

  /// Constructs a new [InlineQueryContext].
  InlineQueryContext(
    super._bot, {
    required Update update,
  }) : super(update: update);

  /// The user who sent the query.
  User get from => query.from;

  /// The query string.
  String get queryText => query.query;
}
