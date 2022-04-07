import 'package:flutter/material.dart';
import 'package:netflix_clone/data/content_model.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/screens/main_screens/search_screen/search_widget.dart';
//

final List<Content> sintelContent = [
  Content(
    name: 'Sintel',
    imageUrl: Assets.sintel,
    titleImageUrl: Assets.sintelTitle,
    videoUrl: Assets.sintelVideoUrl,
    description:
        'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\ndragon, Sintel decides to embark on a dangerous quest to find\nher lost friend Scales.',
  )
];
//

final List<Widget> widgetList = [
  SearchWidget(),
];
// final Stack stack = Stack(children: widgetList);

final List<Content> previews = [
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      color: Colors.orange,
      titleImageUrl: Assets.atlaTitle,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
  Content(
      name: 'The Crown',
      text: 'series',
      imageUrl: Assets.crown,
      color: Colors.red,
      titleImageUrl: Assets.crownTitle,
      description:
          "This drama follows the political rivalries and romance of Queen Elizabeth II's reign and the events that shaped the second half of the 20th century."),
  Content(
      name: 'The Umbrella Academy',
      text: 'series',
      imageUrl: Assets.umbrellaAcademy,
      color: Colors.yellow,
      titleImageUrl: Assets.umbrellaAcademyTitle,
      description:
          "The Umbrella Academy is a team of superpowered children who fight evil for much of their childhoods under the tutelage of their guardian and mentor"),
  Content(
      name: 'Carole and Tuesday',
      text: 'series',
      imageUrl: Assets.caroleAndTuesday,
      color: Colors.lightBlueAccent,
      titleImageUrl: Assets.caroleAndTuesdayTitle,
      description:
          "Carole is a penniless street performer and Tuesday is a runaway rich girl estranged from her family, but they fatefully discover one another ..."),
  Content(
      name: 'Black Mirror',
      text: 'series',
      imageUrl: Assets.blackMirror,
      color: Colors.green,
      titleImageUrl: Assets.blackMirrorTitle,
      description:
          "When old college friends Danny and Karl reconnect in a VR version of their favorite video game, the late-night sessions yield an unexpected discovery."),
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      color: Colors.orange,
      titleImageUrl: Assets.atlaTitle,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
  Content(
      name: 'The Crown',
      text: 'series',
      imageUrl: Assets.crown,
      color: Colors.red,
      titleImageUrl: Assets.crownTitle,
      description:
          "This drama follows the political rivalries and romance of Queen Elizabeth II's reign and the events that shaped the second half of the 20th century."),
  Content(
      name: 'The Umbrella Academy',
      text: 'series',
      imageUrl: Assets.umbrellaAcademy,
      color: Colors.yellow,
      titleImageUrl: Assets.umbrellaAcademyTitle,
      description:
          "The Umbrella Academy is a team of superpowered children who fight evil for much of their childhoods under the tutelage of their guardian and mentor"),
  Content(
      name: 'Carole and Tuesday',
      text: 'series',
      imageUrl: Assets.caroleAndTuesday,
      color: Colors.lightBlueAccent,
      titleImageUrl: Assets.caroleAndTuesdayTitle,
      description:
          "Carole is a penniless street performer and Tuesday is a runaway rich girl estranged from her family, but they fatefully discover one another ..."),
  Content(
      name: 'Black Mirror',
      text: 'series',
      imageUrl: Assets.blackMirror,
      color: Colors.green,
      titleImageUrl: Assets.blackMirrorTitle,
      description:
          "When old college friends Danny and Karl reconnect in a VR version of their favorite video game, the late-night sessions yield an unexpected discovery."),
];
//
final List<Content> myList2 = [
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      myListCheck: true,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
  Content(
      name: 'Tiger King',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.tigerKing,
      description:
          "A zoo owner spirals out of control amid a cast of eccentric characters in this true murder-for-hire story from the underworld of big cat breeding."),
  Content(
      name: 'The Crown',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.crown,
      description:
          "This drama follows the political rivalries and romance of Queen Elizabeth II's reign and the events that shaped the second half of the 20th century."),
  Content(
      name: 'Dogs',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.dogs,
      description:
          "These heartwarming stories explore the abiding emotional bonds that form between dogs and their caregivers, no matter the circumstances."),

  Content(
      name: 'Violet Evergarden',
      text: 'series',
      imageUrl: Assets.violetEvergarden,
      myListCheck: true,
      description:
          "The war is over, and Violet Evergarden needs a job. Scarred and emotionless, she takes a job as a letter writer to understand herself and her past."),
  Content(
      name: 'How to Sell Drugs Online (Fast)',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.htsdof,
      description:
          "To win back his ex-girlfriend, a nerdy teen starts selling ecstasy online out of his bedroom -- and becomes one of Europe's biggest dealers."),
  Content(
      name: 'Kakegurui',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.kakegurui,
      description:
          "High roller Yumeko Jabami plans to clean house at Hyakkaou Private Academy, a school where students are evaluated solely on their gambling skills."),
  Content(
      name: 'Carole and Tuesday',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.caroleAndTuesday,
      description:
          "Carole is a penniless street performer and Tuesday is a runaway rich girl estranged from her family, but they fatefully discover one another ..."),
  Content(
      name: 'Black Mirror',
      text: 'series',
      myListCheck: true,
      imageUrl: Assets.blackMirror,
      description:
          "When old college friends Danny and Karl reconnect in a VR version of their favorite video game, the late-night sessions yield an unexpected discovery."),
  // Content(
  //     name: 'Violet Evergarden',
  //     text: 'series',
  //     imageUrl: Assets.violetEvergarden,
  //     description:
  //         "The war is over, and Violet Evergarden needs a job. Scarred and emotionless, she takes a job as a letter writer to understand herself and her past."),
  // Content(
  //     name: 'How to Sell Drugs Online (Fast)',
  //     text: 'series',
  //     imageUrl: Assets.htsdof,
  //     description:
  //         "To win back his ex-girlfriend, a nerdy teen starts selling ecstasy online out of his bedroom -- and becomes one of Europe's biggest dealers."),
  // Content(
  //     name: 'Kakegurui',
  //     text: 'series',
  //     imageUrl: Assets.kakegurui,
  //     description:
  //         "High roller Yumeko Jabami plans to clean house at Hyakkaou Private Academy, a school where students are evaluated solely on their gambling skills."),
  // Content(
  //     name: 'Carole and Tuesday',
  //     text: 'series',
  //     imageUrl: Assets.caroleAndTuesday,
  //     description:
  //         "Carole is a penniless street performer and Tuesday is a runaway rich girl estranged from her family, but they fatefully discover one another ..."),
  // Content(
  //     name: 'Black Mirror',
  //     text: 'series',
  //     imageUrl: Assets.blackMirror,
  //     description:
  //         "When old college friends Danny and Karl reconnect in a VR version of their favorite video game, the late-night sessions yield an unexpected discovery."),
];
//
final List<Content> originals = [
  Content(
    name: 'Stranger Things',
    text: 'series',
    imageUrl: Assets.strangerThings,
    description:
        "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.",
    color: Colors.pink,
    logo: Assets.strangerLogo,
  ),
  Content(
    name: 'The Witcher',
    text: 'series',
    imageUrl: Assets.witcher,
    description:
        "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
    color: Colors.blue,
    logo: Assets.theWitcherLogo,
  ),
  Content(
      name: 'The Umbrella Academy',
      text: 'series',
      imageUrl: Assets.umbrellaAcademy,
      description:
          "The Umbrella Academy is a team of superpowered children who fight evil for much of their childhoods under the tutelage of their guardian and mentor",
      color: Colors.green,
      logo: Assets.umbrellaLogo),
  Content(
      name: '13 Reasons Why',
      text: 'series',
      imageUrl: Assets.thirteenReasonsWhy,
      description:
          "High school student Clay Jensen lands in the center of a series of heartbreaking mysteries set in motion by a friend's tragic suicide.",
      color: Colors.grey),
  Content(
      name: 'The End of the F***ing World',
      text: 'series',
      imageUrl: Assets.teotfw,
      description:
          "A budding teen psychopath and a rebel hungry for adventure embark on a star-crossed road trip in this darkly comic series based on a graphic novel",
      color: Colors.yellow),
  Content(
    name: 'Stranger Things',
    text: 'series',
    imageUrl: Assets.strangerThings,
    description:
        "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.",
    color: Colors.red,
    logo: Assets.strangerLogo,
  ),
  Content(
      name: 'The Witcher',
      text: 'series',
      imageUrl: Assets.witcher,
      description:
          "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
      color: Colors.deepPurpleAccent,
      logo: Assets.theWitcherLogo),
  Content(
      name: 'The Umbrella Academy',
      text: 'series',
      imageUrl: Assets.umbrellaAcademy,
      description:
          "The Umbrella Academy is a team of superpowered children who fight evil for much of their childhoods under the tutelage of their guardian and mentor",
      color: Colors.lightBlueAccent,
      logo: Assets.umbrellaLogo),
  Content(
    name: '13 Reasons Why',
    text: 'series',
    imageUrl: Assets.thirteenReasonsWhy,
    description:
        "High school student Clay Jensen lands in the center of a series of heartbreaking mysteries set in motion by a friend's tragic suicide.",
    color: Colors.orange,
  ),
  Content(
      name: 'The End of the F***ing World',
      imageUrl: Assets.teotfw,
      text: 'series',
      description:
          "A budding teen psychopath and a rebel hungry for adventure embark on a star-crossed road trip in this darkly comic series based on a graphic novel",
      color: Colors.pink),
];

final List<Content> originalsTwo = [
  Content(
    name: 'Stranger Things',
    text: 'series',
    imageUrl: Assets.strangerNew,
    description:
        "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.",
    color: Colors.pink,
    logo: Assets.strangerLogo,
  ),
  Content(
    name: 'The Witcher',
    text: 'series',
    imageUrl: Assets.theWitcherNew,
    description:
        "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
    color: Colors.blue,
    logo: Assets.theWitcherLogo,
  ),
  Content(
      name: 'The Umbrella Academy',
      text: 'series',
      imageUrl: Assets.theUmbrellaNew,
      description:
          "The Umbrella Academy is a team of superpowered children who fight evil for much of their childhoods under the tutelage of their guardian and mentor",
      color: Colors.green,
      logo: Assets.umbrellaLogo),
  Content(
      name: '13 Reasons Why',
      text: 'series',
      imageUrl: Assets.thirteenNew,
      description:
          "High school student Clay Jensen lands in the center of a series of heartbreaking mysteries set in motion by a friend's tragic suicide.",
      color: Colors.grey,
      logo: Assets.reasonsLogo),
  Content(
      name: 'The End of the F***ing World',
      text: 'series',
      imageUrl: Assets.theEndNew,
      description:
          "A budding teen psychopath and a rebel hungry for adventure embark on a star-crossed road trip in this darkly comic series based on a graphic novel",
      color: Colors.yellow,
      logo: Assets.theEndLogo),
  Content(
    name: 'Stranger Things',
    text: 'series',
    imageUrl: Assets.strangerNew,
    description:
        "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.",
    color: Colors.red,
    logo: Assets.strangerLogo,
  ),
  Content(
      name: 'The Witcher',
      text: 'series',
      imageUrl: Assets.theWitcherNew,
      description:
          "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
      color: Colors.deepPurpleAccent,
      logo: Assets.theWitcherLogo),
  Content(
      name: 'The Umbrella Academy',
      text: 'series',
      imageUrl: Assets.theUmbrellaNew,
      description:
          "The Umbrella Academy is a team of superpowered children who fight evil for much of their childhoods under the tutelage of their guardian and mentor",
      color: Colors.lightBlueAccent,
      logo: Assets.umbrellaLogo),
  Content(
      name: '13 Reasons Why',
      text: 'series',
      imageUrl: Assets.thirteenNew,
      description:
          "High school student Clay Jensen lands in the center of a series of heartbreaking mysteries set in motion by a friend's tragic suicide.",
      color: Colors.orange,
      logo: Assets.reasonsLogo),
  Content(
      name: 'The End of the F***ing World',
      imageUrl: Assets.theEndNew,
      text: 'series',
      description:
          "A budding teen psychopath and a rebel hungry for adventure embark on a star-crossed road trip in this darkly comic series based on a graphic novel",
      color: Colors.pink,
      logo: Assets.theEndLogo),
];
//
final List<Content> trending = [
  Content(
      name: 'Explained',
      text: 'series',
      imageUrl: Assets.explained,
      description:
          "This enlightening series from Vox digs into a wide range of topics such as the rise of cryptocurrency, why diets fail, and the wild world of K-pop."),
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
  Content(
      name: 'Tiger King',
      text: 'series',
      imageUrl: Assets.tigerKing,
      description:
          "A zoo owner spirals out of control amid a cast of eccentric characters in this true murder-for-hire story from the underworld of big cat breeding."),
  Content(
      name: 'The Crown',
      text: 'series',
      imageUrl: Assets.crown,
      description:
          "This drama follows the political rivalries and romance of Queen Elizabeth II's reign and the events that shaped the second half of the 20th century."),
  Content(
      name: 'Dogs',
      text: 'series',
      imageUrl: Assets.dogs,
      description:
          "These heartwarming stories explore the abiding emotional bonds that form between dogs and their caregivers, no matter the circumstances."),
  Content(
      name: 'Explained',
      text: 'series',
      imageUrl: Assets.explained,
      description:
          "This enlightening series from Vox digs into a wide range of topics such as the rise of cryptocurrency, why diets fail, and the wild world of K-pop."),
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
  Content(
      name: 'Tiger King',
      text: 'series',
      imageUrl: Assets.tigerKing,
      description:
          "A zoo owner spirals out of control amid a cast of eccentric characters in this true murder-for-hire story from the underworld of big cat breeding."),
  Content(
      name: 'The Crown',
      text: 'series',
      imageUrl: Assets.crown,
      description:
          "This drama follows the political rivalries and romance of Queen Elizabeth II's reign and the events that shaped the second half of the 20th century."),
  Content(
      name: 'Dogs',
      text: 'series',
      imageUrl: Assets.dogs,
      description:
          "These heartwarming stories explore the abiding emotional bonds that form between dogs and their caregivers, no matter the circumstances."),
];

final List<Content> anime = [
  Content(
      name: 'Carole and Tuesday',
      text: 'series',
      imageUrl: Assets.caroleAndTuesday,
      color: Colors.lightBlueAccent,
      titleImageUrl: Assets.caroleAndTuesdayTitle,
      description:
          "Carole is a penniless street performer and Tuesday is a runaway rich girl estranged from her family, but they fatefully discover one another ..."),
  Content(
      name: 'Violet Evergarden',
      text: 'series',
      imageUrl: Assets.violetEvergarden,
      description:
          "The war is over, and Violet Evergarden needs a job. Scarred and emotionless, she takes a job as a letter writer to understand herself and her past."),
  Content(
      name: 'Kakegurui',
      text: 'series',
      imageUrl: Assets.kakegurui,
      description:
          "High roller Yumeko Jabami plans to clean house at Hyakkaou Private Academy, a school where students are evaluated solely on their gambling skills."),
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
  Content(
      name: 'Carole and Tuesday',
      text: 'series',
      imageUrl: Assets.caroleAndTuesday,
      color: Colors.lightBlueAccent,
      titleImageUrl: Assets.caroleAndTuesdayTitle,
      description:
          "Carole is a penniless street performer and Tuesday is a runaway rich girl estranged from her family, but they fatefully discover one another ..."),
  Content(
      name: 'Violet Evergarden',
      text: 'series',
      imageUrl: Assets.violetEvergarden,
      description:
          "The war is over, and Violet Evergarden needs a job. Scarred and emotionless, she takes a job as a letter writer to understand herself and her past."),
  Content(
      name: 'Kakegurui',
      text: 'series',
      imageUrl: Assets.kakegurui,
      description:
          "High roller Yumeko Jabami plans to clean house at Hyakkaou Private Academy, a school where students are evaluated solely on their gambling skills."),
  Content(
      name: 'Avatar The Last Airbender',
      imageUrl: Assets.atla,
      description:
          'In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.'),
];
