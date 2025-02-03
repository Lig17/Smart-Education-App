class NLPService {
  int countWords(String text) {
    return text.trim().split(RegExp(r'\s+')).length;
  }

  List<String> extractKeywords(String text) {
    final words = text.toLowerCase().split(RegExp(r'\s+'));
    final stopwords = ['the', 'is', 'at', 'which', 'on', 'and', 'a'];
    return words.where((word) => !stopwords.contains(word)).toList();
  }

  String analyzeSentiment(String text) {
    if (text.contains('good') || text.contains('great')) {
      return 'Positive';
    } else if (text.contains('bad') || text.contains('sad')) {
      return 'Negative';
    }
    return 'Neutral';
  }
}