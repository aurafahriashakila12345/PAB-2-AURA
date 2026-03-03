import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';
import 'package:pilem/services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  List<Movie> _allMovies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final results = await Future.wait([
        _apiService.getAllMovies(),
        _apiService.getTrendingMovies(),
        _apiService.getPopularMovies(),
      ]);

      if (!mounted) return;

      setState(() {
        _allMovies =
            results[0].map<Movie>((e) => Movie.fromJson(e)).toList();
        _trendingMovies =
            results[1].map<Movie>((e) => Movie.fromJson(e)).toList();
        _popularMovies =
            results[2].map<Movie>((e) => Movie.fromJson(e)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "Failed to load movies";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.red),
            )
          : _errorMessage != null
              ? Center(
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    _buildNetflixAppBar(),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFeaturedMovie(),
                          const SizedBox(height: 20),
                          _buildMovieSection("Trending Now", _trendingMovies),
                          _buildMovieSection("Popular on Pilem", _popularMovies),
                          _buildMovieSection("All Movies", _allMovies),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  // 🔥 Transparent Netflix AppBar
  Widget _buildNetflixAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: true,
      pinned: true,
      title: const Text(
        "PILEM",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      centerTitle: false,
    );
  }

  // 🎬 Featured Movie Banner
  Widget _buildFeaturedMovie() {
    if (_trendingMovies.isEmpty) return const SizedBox();

    final movie = _trendingMovies.first;

    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          height: 450,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 450,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black87,
                Colors.black
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(movie: movie),
                    ),
                  );
                },
                child: const Text("Play"),
              ),
            ],
          ),
        )
      ],
    );
  }

  // 🎞 Horizontal Section
  Widget _buildMovieSection(String title, List<Movie> movies) {
    if (movies.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(movie: movie),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}