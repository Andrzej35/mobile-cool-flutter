import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  void logout() {
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn
          ? HomePage(onLogout: logout)
          : LoginPage(onLoginSuccess: login),
    );
  }
}

// ------------------------------------------------------------
// LOGIN PAGE
// ------------------------------------------------------------

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginPage({super.key, required this.onLoginSuccess});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    await Future.delayed(const Duration(seconds: 1)); // udajemy request

    if (_passwordController.text == '123456') {
      widget.onLoginSuccess();
    } else {
      setState(() {
        _error = 'Wrong password (Password is: 123456 😉)';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logging...')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email address';
                      }
                      if (!value.contains('@')) {
                        return 'This does not look like email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Your password';
                      }
                      if (value.length < 6) {
                        return 'Min 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  if (_error != null)
                    Text(_error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submit,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Loggin'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------------

class HomePage extends StatelessWidget {
  final VoidCallback onLogout;

  const HomePage({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: onLogout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('You are logged in 🎉', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const SearchPage()));
              },
              icon: const Icon(Icons.search),
              label: const Text('Go to search'),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// SEARCH PAGE
// ------------------------------------------------------------

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  String _query = '';

  final List<String> _items = const [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Pineapple',
    'Strawberry',
    'Watermelon',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _items
        .where((item) => item.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(filtered[index]));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
