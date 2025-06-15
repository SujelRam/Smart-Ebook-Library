import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EbookApp());
}

class EbookApp extends StatelessWidget {
  const EbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Ebook Library',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFFFF6584), // trendy purple
          onPrimary: Colors.white,
          secondary: const Color(0xFFFF6584), // vibrant pink
          onSecondary: Colors.white,
          error: Colors.red.shade700,
          onError: Colors.white,
          background: const Color(0xFFF5F7FA), // light background
          onBackground: Colors.black87,
          surface: Colors.white,
          onSurface: Colors.black87,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6584),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFFFF6584),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      home: const MainScaffold(),
    );
  }
}

class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String fileUrl; // URL to EPUB or PDF file
  final String? description;
  final double? rating;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.fileUrl,
    this.description,
    this.rating,
  });
}

  const List<Book> sampleBooks = [
    Book(
      id: '1',
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description: '\nDescription : Pride and Prejudice (1813) by Jane Austen follows Elizabeth Bennet as she learns the consequences of hasty judgments and the value of true character. Mr. Bennet has five daughters, but his estate can only pass to a male heir, making it crucial for at least one daughter to marry well to secure the family future.\n\nSubjects: Fiction, Romance, Historical',
      rating: 4.1,
      coverUrl: 'https://covers.openlibrary.org/b/id/8226191-L.jpg',
      fileUrl: 'https://www.gutenberg.org/cache/epub/1342/pg1342-images.html',
    ),
    Book(
      id: '2',
      title: 'The Adventures of Sherlock Holmes',
      author: 'Arthur Conan Doyle',
      description: 'Description : The Adventures of Sherlock Holmes is a collection of twelve short stories by Arthur Conan Doyle, first published on 14 October 1892. It contains the earliest short stories featuring the consulting detective Sherlock Holmes, which had been published in twelve monthly issues of The Strand Magazine from July 1891 to June 1892. The stories are collected in the same sequence, which is not supported by any fictional chronology. The only characters common to all twelve are Holmes and Dr. Watson and all are related in first-person narrative from Watsons point of view.\n\nSubjects : Classic Literature, Murder, Mystery',
      rating: 4.1,
      coverUrl: 'https://covers.openlibrary.org/b/id/8231856-L.jpg',
      fileUrl: 'https://www.gutenberg.org/cache/epub/1661/pg1661-images.html',
    ),
  Book(
    id: '3',
    title: 'Frankenstein',
    author: 'Mary Shelley',
    description: 'Description : Frankenstein; or, The Modern Prometheus (1818) is a novel written by English author Mary Shelley. The novel follows Victor Frankenstein, a young scientist who, using unorthodox scientific experiments, creates a sapient creature. At just 18 years old Shelley began writing the novel which was later published anonymously in London in 1818, when she was 20. Her name first appeared in the second edition, which was published in Paris in 1821.Frankenstein; or, The Modern Prometheus (1818) is a novel written by English author Mary Shelley. The novel follows Victor Frankenstein, a young scientist who, using unorthodox scientific experiments, creates a sapient creature. At just 18 years old Shelley began writing the novel which was later published anonymously in London in 1818, when she was 20. Her name first appeared in the second edition, which was published in Paris in 1821.\n\nSubjects : Frankenstein (Fictitious character), Frankensteins monster (Fictitious character), Fiction,Horror',
    rating: 3.9,
    coverUrl: 'https://covers.openlibrary.org/b/id/8319256-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/42324/pg42324-images.html',
  ),
  Book(
    id: '4',
    title: 'Moby-Dick',
    author: 'Herman Melville',
    description: 'Description : Moby Dick (1851) by Herman Melville begins with the famous line “Call me Ishmael.” The novel blends adventure, vengeance, and whaling lore as Ishmael joins the Pequod, unaware of Captain Ahab’s obsession with hunting the white whale, Moby Dick. Drawing from Melville’s own whaling experiences, the book is rich in detail and style, ranging from soliloquies to ship inventories. This is the New York edition, which restored original content and included the previously omitted epilogue.\n\nSubjects :  Science Fiction & Fantasy',
    rating: 3.9, 
    coverUrl: 'https://covers.openlibrary.org/b/id/12621992-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/2701/pg2701-images.html',
  ),
  Book(
    id: '5',
    title: 'Dracula',
    author: 'Bram Stoker',
    description: 'Description : Dracula is one of the most famous public-domain horror novels in existence, responsible not just for introducing the eponymous Count Dracula, but for introducing many of the common tropes we see in modern horror fiction.Count Dracula isnt the first vampire to have graced the pages of literature—that honor is thought to belong to Lord Ruthven in The Vampyr, by John William Polidori—but Dracula is the vampire on which modern vampires are based.Dracula wasnt as famous in its day as it is today; readers of the time seemed to enjoy it as nothing more than a good story, and Stoker died nearly penniless. But its long-lasting influence is undeniable, and for all its age Dracula remains a gripping, fast-paced, and enjoyable read.\n\nSubjects :  Count Dracula (Fictitious character), Dracula, Conde (Personaje literario), Horror, Thriller, Vampires, Psychological fiction',
    rating: 4,
    coverUrl: 'https://covers.openlibrary.org/b/id/10560381-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/345/pg345-images.html',
  ),
  Book(
    id: '6',
    title: 'The Picture of Dorian Gray',
    author: 'Oscar Wilde',
    description: 'Description : The Picture of Dorian Gray (1891) is a philosophical novel by Irish playwright Oscar Wilde; it is his only novel. The story centres on Dorian Gray, the subject of a full-length portrait in oil by Basil Hallward, an artist impressed and infatuated by Dorians beauty. Through Basil, Dorian meets Lord Henry Wotton, an aristocrat who teaches him that beauty and sensual fulfilment are the only things worth pursuing in life.The Picture of Dorian Gray (1891) is a philosophical novel by Irish playwright Oscar Wilde; it is his only novel. The story centres on Dorian Gray, the subject of a full-length portrait in oil by Basil Hallward, an artist impressed and infatuated by Dorians beauty. Through Basil, Dorian meets Lord Henry Wotton, an aristocrat who teaches him that beauty and sensual fulfilment are the only things worth pursuing in life.\n\nSubjects : British and irish fiction (fictional works by one author), Conduct of life, fiction, Fantasy fiction, Childrens fiction',
    rating: 4.1,
    coverUrl: 'https://covers.openlibrary.org/b/id/12752033-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/174/pg174-images.html',
  ),
  Book(
    id: '7',
    title: 'The Time Machine',
    author: 'H.G. Wells',
    description: 'Description : The Time Machine is the novel that gave us the concept of—and even the word for—a “time machine.” While its not Wells first story involving time travel, it is the one that most fully fleshes out the concept of a device that can send a person backwards and forwards in time with complete precision. Time machines have since become a staple of the science fiction and fantasy genres, making The Time Machine one of the most deeply influential science fiction novels of the era.\n\nSubjects : Self-experimentation in medicine in fiction, Fiction, Time travel in fiction, Dystopias in fiction',
    rating: 3.9,
    coverUrl: 'https://covers.openlibrary.org/b/id/12621679-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/35/pg35-images.html',
  ),
  Book(
    id: '8',
    title: 'A Tale of Two Cities',
    author: 'Charles Dickens',
    description: 'Description : In the early days of the French Revolution, a young Englishman determines to do the utmost to save the husband of the woman he loves from the guillotine.\n\nSubjects : British, British and irish fiction (fictional works by one author), Childrens fiction, Criticism and interpretation, English fiction, English literature',
    rating: 3.8,
    coverUrl: 'https://covers.openlibrary.org/b/id/13323666-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/98/pg98-images.html',
  ),
  Book(
    id: '9',
    title: 'The Call of the Wild',
    author: 'Jack London',
    description: 'Description : As Buck, a mixed breed dog, is taken away from his home, instead of facing a feast for breakfast and the comforts of home, he faces the hardships of being a sled dog. Soon he lands in the wrong hands, being forced to keep going when it is too rough for him and the other dogs in his pack. He also fights the urges to run free with his ancestors, the wolves who live around where he is pulling the sled.\n\nSubjects Gold discoveries, Bienestar, Lobos, Descubrimiento de oro, Crítica e interpretación, American Nature stories, Cartoons and comics, Feral dogs, Robo de mascotas, Pet theft, Dogs in literature',
    rating: 3.8,
    coverUrl: 'https://covers.openlibrary.org/b/id/10778738-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/215/pg215-images.html',
  ),
  Book(
    id: '10',
    title: 'The Scarlet Letter',
    author: 'Nathaniel Hawthorne',
    description: 'Description : A stark and allegorical tale of adultery, guilt, and social repression in Puritan New England, The Scarlet Letter is a foundational work of American literature. Nathaniel Hawthornes exploration of the dichotomy between the public and private self, internal passion and external convention, gives us the unforgettable Hester Prynne, who discovers strength in the face of ostracism and emerges as a heroine ahead of her time.\n\nSubjects : Fiction, Puritans, Puritans in fiction, History, Adultery in fiction, Adultery',
    rating: 3.2,
    coverUrl: 'https://covers.openlibrary.org/b/id/11137386-L.jpg',
    fileUrl: 'https://www.gutenberg.org/cache/epub/25344/pg25344-images.html',
  ),
  Book(
    id: '11',
    title: 'Harry Potter and the Philosophers Stone',
    author: 'J. K. Rowling',
    description: 'Description : When mysterious letters start arriving on his doorstep, Harry Potter has never heard of Hogwarts School of Witchcraft and Wizardry.They are swiftly confiscated by his aunt and uncle.Then, on Harrys eleventh birthday, a strange man bursts in with some important news: Harry Potter is a wizard and has been awarded a place to study at Hogwarts.And so the first of the Harry Potter adventures is set to begin.\n\nSubjects : Ghosts, Monsters, Vampires, Witches, Challenges and Overcoming Obstacles, Magic and Supernatural',
    rating: 4.2,
    coverUrl: 'https://covers.openlibrary.org/b/id/11788945-L.jpg',
    fileUrl: 'https://standardebooks.org/ebooks/herman-melville/moby-dick/text/single-page',
  ),
];

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  final List<Book> _downloadedBooks = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addDownloadedBook(Book book) {
    if (!_downloadedBooks.any((b) => b.id == book.id)) {
      setState(() {
        _downloadedBooks.add(book);
      });
    }
  }

  void _openBookDetails(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(
          book: book,
          onDownload: () => _addDownloadedBook(book),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(
        downloadedBooks: _downloadedBooks,
        openBookDetails: _openBookDetails,
      ),
      DownloadedBooksPage(
        downloadedBooks: _downloadedBooks,
        openBookDetails: _openBookDetails,
      ),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Book> downloadedBooks;
  final void Function(BuildContext, Book) openBookDetails;

  const HomePage({
    Key? key,
    required this.downloadedBooks,
    required this.openBookDetails,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  late List<Book> _filteredBooks;

  @override
  void initState() {
    super.initState();
    _filteredBooks = sampleBooks;
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
      _filteredBooks = sampleBooks
          .where((book) =>
              book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              book.author.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final combinedBooks = [...widget.downloadedBooks, ..._filteredBooks]
        .toSet()
        .toList(); // Remove duplicates

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Ebook Reader'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: _updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: combinedBooks.isEmpty
          ? Center(
              child: Text(
                'No books found',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: combinedBooks.length,
              itemBuilder: (context, index) {
                final book = combinedBooks[index];
                return ListTile(
                  leading: Image.network(
                    book.coverUrl,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.book),
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => widget.openBookDetails(context, book),
                );
              },
            ),
    );
  }
}

class DownloadedBooksPage extends StatelessWidget {
  final List<Book> downloadedBooks;
  final void Function(BuildContext, Book) openBookDetails;

  const DownloadedBooksPage({
    Key? key,
    required this.downloadedBooks,
    required this.openBookDetails,
  }) : super(key: key);

  void _readBook(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReaderPage(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloaded Books'),
        centerTitle: true,
      ),
      body: downloadedBooks.isEmpty
          ? Center(
              child: Text(
                'No downloaded books',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: downloadedBooks.length,
              itemBuilder: (context, index) {
                final book = downloadedBooks[index];
                return ListTile(
                  leading: Image.network(
                    book.coverUrl,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.book),
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: ElevatedButton(
                    onPressed: () => _readBook(context, book),
                    child: const Text('Read'),
                  ),
                );
              },
            ),
    );
  }
}

class BookDetailsPage extends StatefulWidget {
  final Book book;
  final VoidCallback? onDownload;

  const BookDetailsPage({Key? key, required this.book, this.onDownload})
      : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  bool _isDownloading = false;
  bool _isDownloaded = false;

  Future<void> _downloadBook() async {
    setState(() {
      _isDownloading = true;
    });

    // Simulate download delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isDownloading = false;
      _isDownloaded = true;
    });

    widget.onDownload?.call();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded "${widget.book.title}"')),
    );
  }

  void _readBook() {
    if (!_isDownloaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please download the book first.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReaderPage(book: widget.book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                book.coverUrl,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.book, size: 100),
              ),
              const SizedBox(height: 16),
              Text(
                book.title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'by ${book.author}',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              if (book.description != null) ...[
                const SizedBox(height: 12),
                Text(
                  book.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ],
              if (book.rating != null) ...[
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final icon = index < book.rating!.round()
                        ? Icons.star
                        : Icons.star_border;
                    return Icon(icon, color: Colors.amber);
                  }),
                ),
              ],
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _isDownloading ? null : _downloadBook,
                    icon: _isDownloading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.download),
                    label: Text(_isDownloading
                        ? 'Downloading...'
                        : _isDownloaded
                            ? 'Downloaded'
                            : 'Download'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _readBook,
                    icon: const Icon(Icons.menu_book),
                    label: const Text('Read'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReaderPage extends StatelessWidget {
  final Book book;

  const ReaderPage({Key? key, required this.book}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    _launchURL(book.fileUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading: ${book.title}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Opening book in external reader...\n\n'
            'Book file URL:\n${book.fileUrl}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
