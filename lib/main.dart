import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// string for description_page:
const String description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? \n It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). \n Where does it come from? \n Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.";

void main() {
  runApp(const MyApp());
}

AppBar buildAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      title: Image.asset('images/amazon-dark-logo-png-transparent.png',
          height: 10),
      actions: const [
        Padding(padding: EdgeInsets.all(8.0)),
      ],
    );
final List<BookModel> books = BookModel.books;
final newBook = BookModel.newBook;
///////////////////////////////
// Web-version home_page:

class HomePage extends StatelessWidget {
  // Don't know why i had to copy+paste this from home_page.dart ??
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
        title: Image.asset('images/amazon-dark-logo-png-transparent_new.png',
            height: 150),
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile_image_1.png'),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // aligns in-body text to start from left to right
          children: [
            /////////////////////////
            //  Header widget:
            const Padding(
                padding: EdgeInsets.only(
                  left: 2 * 8.0,
                  top: 8.0, //constants.kPaddding = 8.0
                ),
                child: Text('Welcome back',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ))),
            const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2 * 8.0,
                  vertical: 8.0, //constants.kPaddding = 8.0
                ),
                child: Text(
                  '',
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                )),
            //////////////////////////
            // Search-bar Widget:
            Padding(
              padding: const EdgeInsets.all(2 * 8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search for Products",
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            ///////////////////////////
            //    list_icons:
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // horizontal scroller
                child: Wrap(
                  // cant invoke spacing without wrap()
                  spacing: 50, // spacing between icons
                  children: List.generate(
                    headerImages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(
                        // put padding around icons to space them out
                        horizontal: 20,
                        vertical: 5.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                              headerImages[index]
                                  .icon, // convert image assets into icons
                              height: 50,
                              width: 50),
                          Text(headerImages[index].title)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ///////////////////////////
            // books_list <header>:
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2 * 8.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Top Rated",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 8.0,
                            ),
                            backgroundColor: Colors.grey, // color of button
                            minimumSize: const Size(5, 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          child: const Text('See all',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),

                    //////////////////////////////
                    //        book_list:
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        books.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: 2 * 8.0,
                            right: 8.0,
                            left: index == 0 ? 8.0 : 0,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => moviesPage(
                                    book: books[index],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 4,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                    child: Image.asset(
                                      books[index].image,
                                      height: 180,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(books[index].title),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    books[index].subtitle,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.blueGrey),
                                  ),
                                ),
                                ////////////
                                //
                                /////////////
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///////////////////
            //  New Releases:
            Column(
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 2 * 8.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, //  puts 'new releases' @ the end
                    children: [
                      Text('New Releases',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.keyboard_arrow_right) // shows arrow
                    ],
                  ),
                ),
                // copy + paste from inkWell() from book_list
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => moviesPage(
                          book: newBook,
                        ),
                      ),
                    );
                  }, //come back to this
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            child: Image.asset(
                              newBook
                                  .image, // previous error: undefined name 'index'
                              height: 180,
                              width: double
                                  .infinity, // to sspan the length of the screen
                              fit: BoxFit
                                  .cover, // for  place_holder image on web = .contain
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2 * 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // wrap text-boxes in column widgt so they're stacked on each other
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // crossAxisalignment starts text or data type at the right 1/2
                              children: [
                                // hand-side of the page 2/2
                                Text(newBook.title,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Text(
                                  newBook.subtitle,
                                  style: const TextStyle(
                                      color: Colors.blueGrey, fontSize: 10),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              // child:  Text('4.8', style: TextStyle(color: Colors.white)),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                backgroundColor: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                minimumSize: const Size(5,
                                    5), // gives button that specific size around the '4.8' to accentuate text
                              ),
                              child: const Text('4.8',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
            //////////////////////////////
          ],
        ), //////////////////////////
      ),
      ////////////////////
      //  navigation_bar:
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   // <-- button placement to 'float' over nav_bar
      //extendBody: true,
      floatingActionButton: buildFloatingActionBar(),
      bottomNavigationBar: buildNavigationBar(), // see nav_bar @ bottom
      /////////////////////
    );
  }
}
//////////////////////////////////////Scaffold
//  header widget:

List<Widget> buildHeader() => [
      const Padding(
          padding: EdgeInsets.only(
            left: 2 * 8.0,
            top: 8.0, //constants.kPaddding = 8.0
          ),
          child: Text('',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ))),
      const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * 8.0,
            vertical: 8.0, //constants.kPaddding = 8.0
          ),
          child: Text('', style: TextStyle(color: Colors.black54))),
    ];
////////////////////////////////////
//  search_bar widget:
Widget buildSearchBar() => const Padding(
      padding: EdgeInsets.all(2 * 8.0),
      child: TextField(
        decoration: InputDecoration(hintText: "Search for product"),
      ),
    );

/////////////////////////////////////
//  icon_widgets      // create icons using images
class IconModel {
  String icon;
  String title;
  IconModel({
    required this.icon,
    required this.title,
  });

  static List<IconModel> icons = [
    IconModel(
      icon: 'images/map_icon_1.png',
      title: "Discover",
    ),
    IconModel(
      icon: 'images/map_icon_2.png',
      title: "Discover Nearby",
    ),
    IconModel(
      icon: 'images/icons8-web-50-discover.png',
      title: "Discover Products",
    ),
    IconModel(
      icon: 'images/icons8-audio-50-audio.png',
      title: "Discover Audio Products",
    ),
  ];
}

final List<IconModel> headerImages = IconModel.icons;

////////////////////////////////////
// books_list:
class BuildBookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.1),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2 * 8.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Rated",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////
//  books_model:
class BookModel {
  String image;
  String secondImage;
  String title;
  String subtitle;
  bool favourite;

// assign variables to BookModel class

  BookModel({
    required this.image,
    required this.secondImage,
    required this.title,
    required this.subtitle,
    required this.favourite,
  });
  // create new book
  static BookModel newBook = BookModel(
    image: 'images/dune+part+two.png',
    secondImage: 'images/dune+part+two.png',
    title: 'new_title_1',
    subtitle: 'new_subtitle_1',
    favourite: true,
  );
  // create book-list:
  static List<BookModel> books = [
    BookModel(
        image:
            'images/ethan-hawke-denzel-washington-training-day-2001-2JHCP8C.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_1',
        subtitle: 'subtitle_1',
        favourite: false),
    BookModel(
        image:
            'images/daniel-day-lewis-poster-there-will-be-blood-2007-2JHM0YD.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_2',
        subtitle: 'subtitle_2',
        favourite: false),
    BookModel(
        image:
            'images/josh-brolin-javier-bardem-tommy-lee-jones-poster-no-country-for-old-men-2007-2JHCPD5.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_3',
        subtitle: 'subtitle_3',
        favourite: false),
    BookModel(
        image:
            'images/original-film-title-eyes-wide-shut-english-title-eyes-wide-shut-film-director-stanley-kubrick-year-1999-credit-warner-bros-pictures-album-P4PM13.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_4',
        subtitle: 'subtitle_4',
        favourite: false),
    BookModel(
        image:
            'images/a-clockwork-orange-year-1971-director-stanley-kubrick-movie-poster-BK68C3.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_5',
        subtitle: 'subtitle_5',
        favourite: false),
    BookModel(
        image:
            'images/full-metal-jacket-poster-for-1987-warner-film-directed-by-stanley-A31WBH.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_6',
        subtitle: 'subtitle_6',
        favourite: false),
    BookModel(
        image: 'images/film-poster-apocalypse-now-1979-2JD85NC.jpg',
        secondImage: 'images/book_image_2.png',
        title: 'title_7',
        subtitle: 'subtitle_7',
        favourite: false),
  ];
}

////////////////////////////////////
//  New_book:
class BuildNewBook extends StatelessWidget {
  // stateless widgt in order to access the context
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.1),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2 * 8.0, vertical: 8.0),
            child: Row(
              children: [
                Text("New Releases", style: TextStyle(color: Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
}

///////////////////////////////////
//  Navigation_bar:
Widget buildNavigationBar() => BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.message_outlined)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.add_shopping_cart)),
          ),
        ],
      ),
    );

////////////////////////////////////
// floating_action_bar:
class buildFloatingActionBar extends StatefulWidget {
  @override
  State<buildFloatingActionBar> createState() => _buildFloatingActionBarState();
}

class _buildFloatingActionBarState extends State<buildFloatingActionBar> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    const Text('Shop by',
                        style: TextStyle(color: Colors.black54)),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.search, color: Colors.black)
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    /////////////////////////
                    // categories tab in pop-up menu:
                    _buildCategory(
                        category: "Books",
                        iconData: Icons.book,
                        color: Colors.blue), // books category
                    _buildCategory(
                        category: "Video Games",
                        iconData: Icons.sports_esports,
                        color: Colors.blue), //
                    _buildCategory(
                        category: "Home Essentials",
                        iconData: Icons.local_grocery_store,
                        color: Colors.blue),
                    _buildCategory(
                        category: "Health & Beauty",
                        iconData: Icons.home,
                        color: Colors.blue),
                    _buildCategory(
                        category: "Sports & Leisure",
                        iconData: Icons.sports_soccer,
                        color: Colors.blue),
                    /////////////////////////
                    const SizedBox(height: 40.0)
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.list_alt_rounded, color: Colors.grey));
  }

  Widget _buildCategory({
    required String category,
    required IconData iconData,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 2 * 8.0,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(iconData, color: Colors.white),
              ),
              Text(
                category,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////
// movies_page:
class moviesPage extends StatefulWidget {
  moviesPage({required this.book});
  final BookModel book;
  // const moviesPage({super.key});

  @override
  _moviesPageState createState() => _moviesPageState();
}

class _moviesPageState extends State<moviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          // leading arg places iconButton @ the right end of the screen in AppBar
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined,
              color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState((){
                widget.book.favourite = !widget.book.favourite;     // to invert heart color on click
              });
            },
            icon:  Icon(
              widget.book.favourite ? Icons.favorite: Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0 * 4,
            ),
            child: Column(
              children: [
                // movie_display widget:
                ...buildMovieDisplay(
                    book: widget
                        .book), // . . . fixed the 'element type List<Widget> can't be assigned to this list type 1/2
                ...buildDescription(), // 'widget'' error 2/2
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////
//  movie_display:
List<Widget> buildMovieDisplay({required BookModel book}) => [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(book.image, height: 350, fit: BoxFit.cover),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ];

///////////////////////////////
// 'description':

List<Widget> buildDescription() => [
     const Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Text(
              description,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              child: const Text('Share', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  //padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8.0),
                 // minimumSize: const Size(5, 5),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              child: const Text('Purhcase Title',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    ];

//////////////////////////////
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // controls everythings like theme (color of app) and 'debug' banner
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, // removes 'debug' banner
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
