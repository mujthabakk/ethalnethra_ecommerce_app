import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../api/api_exception.dart';

class InboxNotification {
  const InboxNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
  });

  final String id;
  final String title;
  final String message;
  final String timestamp;
}

class GroupedNotifications {
  const GroupedNotifications({
    this.today = const [],
    this.yesterday = const [],
  });

  final List<InboxNotification> today;
  final List<InboxNotification> yesterday;
}

class AiChatResult {
  const AiChatResult({required this.reply, this.products = const []});

  final String reply;
  final List<Map<String, dynamic>> products;
}

/// Notifications, AI assistant, services, and kitchen endpoints from the
/// mobile API spec. Missing routes return empty data so the UI never
/// falls back to sample products.
class ContentRepository {
  ContentRepository(this._dio);

  final Dio _dio;

  Future<GroupedNotifications> fetchNotifications() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.notifications);
      return _parseNotifications(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<List<String>> fetchAiSuggestions() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.aiSuggestions);
      final data = response.data;
      final raw = data is Map ? data['data'] ?? data['suggestions'] ?? data : data;
      if (raw is! List) return const [];
      return raw
          .map((item) {
            if (item is String) return item;
            if (item is Map) {
              return (item['text'] ?? item['title'] ?? '').toString();
            }
            return '';
          })
          .where((text) => text.trim().isNotEmpty)
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const [];
      throw ApiException.fromDio(e);
    }
  }

  Future<AiChatResult> sendAiMessage(String message) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.aiChat,
        data: {'message': message},
      );
      final data = response.data;
      if (data is! Map) {
        return const AiChatResult(reply: '');
      }
      final map = Map<String, dynamic>.from(data);
      final products = <Map<String, dynamic>>[];
      final rawProducts = map['products'];
      if (rawProducts is List) {
        for (final item in rawProducts) {
          if (item is Map) products.add(Map<String, dynamic>.from(item));
        }
      }
      return AiChatResult(
        reply: (map['reply'] ?? map['message'] ?? '').toString(),
        products: products,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const AiChatResult(reply: '');
      }
      throw ApiException.fromDio(e);
    }
  }

  GroupedNotifications _parseNotifications(dynamic data) {
    if (data is! Map) return const GroupedNotifications();
    final map = Map<String, dynamic>.from(data);
    return GroupedNotifications(
      today: _list(map['today']),
      yesterday: _list(map['yesterday']),
    );
  }

  List<InboxNotification> _list(dynamic raw) {
    if (raw is! List) return const [];
    final items = <InboxNotification>[];
    for (final item in raw) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final title = (map['title'] ?? '').toString();
      if (title.isEmpty) continue;
      items.add(
        InboxNotification(
          id: (map['id'] ?? title).toString(),
          title: title,
          message: (map['message'] ?? map['body'] ?? '').toString(),
          timestamp: (map['timestamp'] ?? map['time'] ?? '').toString(),
        ),
      );
    }
    return items;
  }
}
