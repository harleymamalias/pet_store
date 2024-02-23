class CatalogModel {
  final String catName;
  final String catImage;
  final List<String> catImagesCarousel;
  final String catOrigin;
  final double catWeight;
  final double catHeight;
  final String catColor;
  final String catDescription;
  final int catPrice;
  final String dateAndTimePosted;

  CatalogModel({
    this.catName = '',
    this.catImage = '',
    this.catImagesCarousel = const [],
    this.catOrigin = '',
    this.catWeight = 0.0,
    this.catHeight = 0.0,
    this.catColor = '',
    this.catDescription = '',
    this.catPrice = 0,
    this.dateAndTimePosted = '',
  });

  static List<CatalogModel> catCatalogItems = [
    CatalogModel(
      catName: 'Persian Cat',
      catImage: 'assets/images/Cat1-Second Screen.png',
      catImagesCarousel: [
        'assets/images/Cat1-PersianCat 1.jpg',
        'assets/images/Cat1-PersianCat 2.jpg',
        'assets/images/Cat1-PersianCat 1.jpg',
      ],
      catOrigin: 'Persia',
      catWeight: 7.0,
      catHeight: 25.0,
      catColor: 'White',
      catDescription:
          'The Persian cat is famed for its luxurious long fur and gentle, affectionate nature. With its charming appearance and calm demeanor, the Persian cat makes a wonderful companion for those seeking a loving and laid-back pet.',
      catPrice: 85,
      dateAndTimePosted: '8:09PM | 02-13-24',
    ),
    CatalogModel(
      catName: 'Sphinx Cat',
      catImage: 'assets/images/Cat2-Second Screen.png',
      catImagesCarousel: [
        'assets/images/Cat-2 Sphynx Cat 1.jpg',
        'assets/images/Cat-2 Sphynx Cat 2.jpg',
        'assets/images/Cat-2 Sphynx Cat 3.jpg',
      ],
      catOrigin: 'Egypt',
      catWeight: 6.0,
      catHeight: 20.0,
      catColor: 'Pink',
      catDescription:
          'The Sphinx cat is distinguished by its hairless appearance, wrinkled skin, and large ears. Despite their lack of fur, Sphinx cats are known for their warmth and affectionate nature. Their unique appearance and playful demeanor make them intriguing and engaging companions for those seeking a distinctive pet.',
      catPrice: 60,
      dateAndTimePosted: '12:43PM | 02-11-24',
    ),
    CatalogModel(
      catName: 'Bengal Cat',
      catImage: 'assets/images/Cat6-Second Screen.png',
      catImagesCarousel: [
        'assets/images/Cat-3 Bengal Cat 1.jpg',
        'assets/images/Cat-3 Bengal Cat 2.jpg',
        'assets/images/Cat-3 Bengal Cat 3.jpg',
      ],
      catOrigin: 'United States',
      catWeight: 5.0,
      catHeight: 22.0,
      catColor: 'Brown',
      catDescription:
          'The Bengal cat is recognized for its distinctive leopard-like spots, which give it a wild appearance. Known for their energetic and playful nature, Bengals enjoy interactive play and are often fascinated by water. With their unique coat patterns and lively personalities, Bengals make captivating and entertaining companions for those who appreciate their wild ancestry.',
      catPrice: 90,
      dateAndTimePosted: '7:15AM | 02-16-24',
    ),
    CatalogModel(
      catName: 'Abyssinian Cat',
      catImage: 'assets/images/Cat3-Second Screen.png',
      catImagesCarousel: [
        'assets/images/Cat-4 Abyssinian Cat 1.jpg',
        'assets/images/Cat-4 Abyssinian Cat 2.jpg',
        'assets/images/Cat-4 Abyssinian Cat 3.jpg',
      ],
      catOrigin: 'Ethiopia',
      catWeight: 6.0,
      catHeight: 23.0,
      catColor: 'Ruddy',
      catDescription:
          'The Abyssinian cat is known for its active and playful nature, often seeking out adventures and engaging in interactive play. Despite their high energy levels, Abyssinians are also affectionate and enjoy spending time with their human companions. With their curious and outgoing personality, they can make lively additions to any household.',
      catPrice: 75,
      dateAndTimePosted: '11:30AM | 02-17-24',
    ),
    CatalogModel(
      catName: 'Burmese Cat',
      catImage: 'assets/images/Cat4-Second Screen.png',
      catImagesCarousel: [
        'assets/images/Cat-5 Burmese Cat 1.jpg',
        'assets/images/Cat-5 Burmese Cat 2.jpg',
        'assets/images/Cat-5 Burmese Cat 3.jpg',
      ],
      catOrigin: 'Burma',
      catWeight: 6.5,
      catHeight: 21.0,
      catColor: 'Sable',
      catDescription:
          'The Burmese cat is recognized for its captivating eyes and luxurious, satin-like fur. With their affectionate and outgoing personality, Burmese cats often enjoy being around people and are known for their playful demeanor. They make loyal companions and can bring joy to any household with their charming presence.',
      catPrice: 75,
      dateAndTimePosted: '3:20PM | 02-14-24',
    ),
    CatalogModel(
      catName: 'Russian Blue Cat',
      catImage: 'assets/images/Cat5-Second Screen.png',
      catImagesCarousel: [
        'assets/images/Cat-6 Russian Blue Cat 1.jpg',
        'assets/images/Cat-6 Russian Blue Cat 2.jpg',
        'assets/images/Cat-6 Russian Blue Cat 3.jpg',
      ],
      catOrigin: 'Russia',
      catWeight: 7.5,
      catHeight: 24.0,
      catColor: 'Blue',
      catDescription:
          'The Russian Blue cat is prized for its elegant silver-blue coat and enchanting green eyes. With its gentle demeanor and intelligence, the Russian Blue makes a wonderful companion for any cat lover. Known for their affectionate nature, they often form strong bonds with their human family members.',
      catPrice: 60,
      dateAndTimePosted: '9:30AM | 02-12-24',
    ),
    CatalogModel(
      catName: 'Serengeti Cat',
      catImage: 'assets/images/Cat-7 Serengeti Cat 1.jpg',
      catImagesCarousel: [
        'assets/images/Cat-7 Serengeti Cat 3.jpg',
        'assets/images/Cat-7 Serengeti Cat 2.jpg',
        'assets/images/Cat-7 Serengeti Cat 1.jpg',
      ],
      catOrigin: 'California, USA',
      catWeight: 7.0,
      catHeight: 25.0,
      catColor: 'Black',
      catDescription:
          'The Serengeti cat is a sleek and active breed, known for its striking spotted coat. With their playful and intelligent nature, they make great companions for families and other pets. Serengeti cats form strong bonds with their human companions and can live long, healthy lives with proper care.',
      catPrice: 85,
      dateAndTimePosted: '10:08PM | 02-17-24',
    ),
  ];
}
