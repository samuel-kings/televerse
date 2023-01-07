part of televerse;

/// **Fetcher**
/// This is the base class for all fetchers. It is used to fetch updates from the Telegram API.
/// You can use this class to create your own fetcher. Currently, there are two fetchers: [LongPolling] and [Webhook].
abstract class Fetcher {
  final StreamController<Update> _updateStreamController;

  Fetcher() : _updateStreamController = StreamController.broadcast();

  /// Emit new update into the stream.
  void addUpdate(Update update) => _updateStreamController.add(update);

  /// Handler for new updates.
  Stream<Update> onUpdate() => _updateStreamController.stream;

  /// Starts fetching updates.
  Future<void> start();

  /// Stops fetching updates.
  Future<void> stop();
}
