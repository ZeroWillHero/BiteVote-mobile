final List<Map<String, dynamic>> dummyHeroCards = [
  {
    'imagePath': 'assets/food1.jpg',
    'title': 'Hero Title 1',
    'description': 'This is the description for hero 1.',
    'buttonText': 'vote',
    'onPressed': () {
      print('Hero 1 button pressed');
    },
  },
  {
    'imagePath': 'assets/food2.jpg',
    'title': 'Hero Title 2',
    'description': 'This is the description for hero 2.',
    'buttonText': 'vote',
    'onPressed': () {
      print('Hero 2 button pressed');
    },
  },
  {
    'imagePath': 'assets/food3.jpg',
    'title': 'Hero Title 3',
    'description': 'This is the description for hero 3.',
    'buttonText': 'vote',
    'onPressed': () {
      print('Hero 3 button pressed');
    },
  },
  {
    'imagePath': 'assets/food5.png',
    'title': 'Hero Title 4',
    'description': 'This is the description for hero 4.',
    'buttonText': 'vote',
    'onPressed': () {
      print('Hero 4 button pressed');
    },
  },
];

final List<Map<String, dynamic>> dummyOrders = [
  {
    'imagePath': 'assets/food1.jpg',
    'item': 'Pizza',
    'quantity': 2,
    'totalPrice': 19.99,
    'orderStatus': 'Pending',
    'onConfirm': () {
      print('Order for Pizza confirmed');
    },
  },
  {
    'imagePath': 'assets/food2.jpg',
    'item': 'Burger',
    'quantity': 1,
    'totalPrice': 9.99,
    'orderStatus': 'Delivered',
    'onConfirm': () {
      print('Order for Burger confirmed');
    },
  },
  {
    'imagePath': 'assets/food3.jpg',
    'item': 'Pasta',
    'quantity': 3,
    'totalPrice': 29.97,
    'orderStatus': 'In Progress',
    'onConfirm': () {
      print('Order for Pasta confirmed');
    },
  },
  {
    'imagePath': 'assets/food5.png',
    'item': 'Salad',
    'quantity': 1,
    'totalPrice': 5.99,
    'orderStatus': 'Cancelled',
    'onConfirm': () {
      print('Order for Salad confirmed');
    },
  },
];
