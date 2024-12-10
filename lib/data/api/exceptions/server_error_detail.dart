class ServerErrorDetail {
  final String detail;
  final String path;
  final String serverErrorId;
  final int serverStatusCode;
  final String message;
  final String field;
  ServerErrorDetail({
    this.detail = "",
    this.path = "",

    /// server-defined error code
    this.serverErrorId = "",

    /// server-defined status code
    this.serverStatusCode = -1,

    /// server-defined message
    this.message = "",

    /// server-defined field
    this.field = "",
  });
}
