final Map<String, List<Map<String, dynamic>>> hardcodedTasks = {
  'Tech Addiction': [
    {
      'title': 'No Screen 1st Hour',
      'description': 'Avoid screens after waking up',
      'progress': [
        {'date': DateTime.now(), 'progress': 10},
        {'date': DateTime.now().subtract(Duration(days: 1)), 'progress': 20},
      ],
    },
    {
      'title': '1hr Detox Walk',
      'description': 'Go for a walk without your phone',
      'progress': [
        {'date': DateTime.now(), 'progress': 15},
      ],
    },
  ],
  'Food Addiction': [
    {
      'title': 'Healthy Breakfast',
      'description': 'Include fruits and protein',
      'progress': [
        {'date': DateTime.now(), 'progress': 25},
      ],
    },
    {
      'title': 'No Sugar',
      'description': 'Avoid sugar for the entire day',
      'progress': [
        {'date': DateTime.now(), 'progress': 10},
        {'date': DateTime.now().subtract(Duration(days: 1)), 'progress': 15},
      ],
    },
  ],
  'Adultery Content Addiction': [
    {
      'title': 'No Phone Alone',
      'description': 'Avoid phone in private places',
      'progress': [
        {'date': DateTime.now(), 'progress': 10},
      ],
    },
    {
      'title': 'Journaling',
      'description': 'Write your thoughts about recovery',
      'progress': [
        {'date': DateTime.now(), 'progress': 20},
        {'date': DateTime.now().subtract(Duration(days: 2)), 'progress': 15},
      ],
    },
  ],
  'Money Addiction': [
    {
      'title': 'No Impulse Buys',
      'description': 'Buy only what’s needed',
      'progress': [
        {'date': DateTime.now(), 'progress': 5},
      ],
    },
    {
      'title': 'Track Spending',
      'description': 'Log your expenses today',
      'progress': [
        {'date': DateTime.now(), 'progress': 20},
        {'date': DateTime.now().subtract(Duration(days: 1)), 'progress': 15},
      ],
    },
  ],
  'Substance Addiction': [
    {
      'title': 'Breathing Exercise',
      'description': 'Try 5 mins of deep breathing',
      'progress': [
        {'date': DateTime.now(), 'progress': 30},
      ],
    },
    {
      'title': 'Craving Journal',
      'description': 'Write about your urges today',
      'progress': [
        {'date': DateTime.now(), 'progress': 25},
        {'date': DateTime.now().subtract(Duration(days: 1)), 'progress': 10},
      ],
    },
  ],
};
