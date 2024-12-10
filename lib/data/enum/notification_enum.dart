enum NotificationType {
  brand,
  order,
  comment,
  referral,
  productCreated,
  orderCreated,
  orderCanceled,
  orderAccepted,
  orderDenied,
  orderUpdated,
  joinEvent,
  upRank
}

extension EnumNotification on NotificationType {
  String toJsonString() {
    switch (this) {
      case NotificationType.brand:
        return "brand";
      case NotificationType.order:
        return "order";
      case NotificationType.comment:
        return "comment";
      case NotificationType.referral:
        return "referral";
      case NotificationType.productCreated:
        return "product_created";
      case NotificationType.orderCreated:
        return "order_created";
      case NotificationType.orderCanceled:
        return "order_canceled";
      case NotificationType.orderAccepted:
        return "order_accepted";
      case NotificationType.orderDenied:
        return "order_denied";
      case NotificationType.orderUpdated:
        return "order_updated";
      case NotificationType.joinEvent:
        return "join_event";
      case NotificationType.upRank:
        return "up_rank";
    }
  }

  String getType() {
    switch (this) {
      case NotificationType.brand:
        return "brand";
      case NotificationType.order:
        return "order";
      case NotificationType.comment:
        return "comment";
      case NotificationType.referral:
        return "referral";
      case NotificationType.productCreated:
        return "product_created";
      case NotificationType.orderCreated:
        return "order_created";
      case NotificationType.orderCanceled:
        return "order_canceled";
      case NotificationType.orderAccepted:
        return "order_accepted";
      case NotificationType.orderDenied:
        return "order_denied";
      case NotificationType.orderUpdated:
        return "order_updated";
      case NotificationType.joinEvent:
        return "join_event";
      case NotificationType.upRank:
        return "up_rank";
    }
  }
}

NotificationType stringToNotificationType(String type) {
  switch (type) {
    case 'brand':
      return NotificationType.brand;
    case "order":
      return NotificationType.order;
    case "comment":
      return NotificationType.comment;
    case "referral":
      return NotificationType.referral;
    case "product_created":
      return NotificationType.productCreated;
    case "order_canceled":
      return NotificationType.orderCanceled;
    case "order_accepted":
      return NotificationType.orderAccepted;
    case "order_denied":
      return NotificationType.orderDenied;
    case "order_updated":
      return NotificationType.orderUpdated;
    case "join_event":
      return NotificationType.joinEvent;
    case "up_rank":
      return NotificationType.upRank;
    case "order_created":
      return NotificationType.orderCreated;
    default:
      return NotificationType.orderCreated;
  }
}

String notificationTypeToString(NotificationType type) {
  switch (type) {
    case NotificationType.brand:
      return "brand";
    case NotificationType.order:
      return "order";
    case NotificationType.comment:
      return "comment";
    case NotificationType.referral:
      return "referral";
    case NotificationType.productCreated:
      return "product_created";
    case NotificationType.orderCreated:
      return "order_created";
    case NotificationType.orderCanceled:
      return "order_canceled";
    case NotificationType.orderAccepted:
      return "order_accepted";
    case NotificationType.orderDenied:
      return "order_denied";
    case NotificationType.orderUpdated:
      return "order_updated";
    case NotificationType.joinEvent:
      return "join_event";
    case NotificationType.upRank:
      return "up_rank";
  }
}
