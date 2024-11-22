class Message implements Comparable<Message> {
  final String senderId;
  final String text;
  final DateTime timestamp;
  String? resource;

  Message({
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.resource,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderId': senderId,
      'timestamp': timestamp, // Converting DateTime to string
      'resource': resource, // Include resource in JSON representation if needed
    };
  }

  // Method to create a Message object from JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['senderId'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']), // Parsing the timestamp from String to DateTime
      resource: json['resource'], // resource is nullable, so it's fine if it's null
    );
  }

  @override
  int compareTo(Message other) {
    // Compare based on timestamp
    return timestamp.compareTo(other.timestamp);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // Check if they are the same instance

    if (other is! Message) return false; // Check if other is not a Message

    // Check for equality based on properties
    return senderId == other.senderId &&
        text == other.text &&
        timestamp == other.timestamp &&
        resource == other.resource;
  }

  @override
  int get hashCode {
    // Combine hash codes of properties to generate a unique hash code for the Message
    return senderId.hashCode ^
    text.hashCode ^
    timestamp.hashCode ^
    (resource?.hashCode ?? 0);
  }

  @override
  String toString() {
    return 'Message(senderId: $senderId, text: $text, timestamp: $timestamp, resource: $resource)';
  }
}
