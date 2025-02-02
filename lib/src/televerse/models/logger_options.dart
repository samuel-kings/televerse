part of televerse;

/// Debug Print
void _debugPrint(Object? object) {
  assert(() {
    print(object);
    return true;
  }());
}

/// This class represents the logger options.
///
/// Instance of [LoggerOptions] can be passed to the [Televerse] / [Bot] instance.
/// This will setup logging the request and response data your bot makes.
///
/// This will be useful in cases like debugging your code, etc.
///
/// Example:
/// ```dart
/// final bot = Bot(
///    "<YOUR TOKEN>",
///    loggerOptions: LoggerOptions(
///      methods: [
///        APIMethod.sendMessage,
///        APIMethod.getMe,
///      ],
///    ),
///  );
/// ```
class LoggerOptions {
  /// Creates a new [LoggerOptions] instance. This can be used to configure logging the
  /// request and response data Televerse makes and receives.
  ///
  /// - [request] - Print request [Options]
  /// - [requestHeader] - Print request header [Options.headers]
  /// - [requestBody] - Print request data [Options]
  /// - [responseHeader] - Print [Response.headers]
  /// - [responseBody] - Print [Response.data]
  /// - [error] - Print error message
  /// - [stackTrace] - Print error stack trace [DioException.stackTrace]
  /// - [logPrint] - Log printer; defaults print log to console.
  /// - [methods] - Methods to be logged.
  LoggerOptions({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
    this.stackTrace = true,
    this.logPrint = _debugPrint,
    List<APIMethod>? methods,
  }) : methods = methods ?? APIMethod.values; // Default all methods

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Print error stack trace [DioException.stackTrace]
  bool stackTrace;

  /// Log printer; defaults print log to console.
  void Function(Object object) logPrint;

  /// Methods to be logged.
  List<APIMethod> methods;

  /// Returns true if the given [method] is allowed.
  bool isAllowed(APIMethod method) {
    return methods.contains(method);
  }

  /// Returns the interceptor to be used in [Dio].
  Interceptor get interceptor {
    final LogInterceptor l = LogInterceptor(
      logPrint: logPrint,
      request: request,
      requestHeader: requestHeader,
      requestBody: requestBody,
      responseBody: responseBody,
      responseHeader: responseHeader,
      error: error,
    );
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (request) {
          final path = options.uri.pathSegments.last;
          final allowed = APIMethod.isExistingMethod(path) &&
              isAllowed(APIMethod.method(path));
          if (allowed) {
            return l.onRequest(options, handler);
          }
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final path = response.requestOptions.uri.pathSegments.last;
        final allowed = APIMethod.isExistingMethod(path) &&
            isAllowed(APIMethod.method(path));
        if (!allowed) {
          return handler.next(response);
        }
        if (responseBody) {
          return l.onResponse(response, handler);
        }
      },
      onError: (DioException e, handler) {
        final path = e.requestOptions.uri.pathSegments.last;
        final allowed = APIMethod.isExistingMethod(path) &&
            isAllowed(APIMethod.method(path));
        final error = allowed && this.error;
        if (error) {
          logPrint("<-- Error -->");
          logPrint(e);
          if (stackTrace) {
            logPrint("Stack Trace:");
            logPrint(e.stackTrace);
          }
          logPrint("<-- End Error -->");
        }
        return handler.next(e);
      },
    );
  }
}
