//TO DO configurasi class dan logika script backend


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forgot Password Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForgotPassword(),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_left_outlined),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child:
                Text(
                  "Enter your email account to reset your password",
                  textAlign: TextAlign.center,
                ),
                ),
                SizedBox(height: 40),
                TextField(
                  style: TextStyle(color: Colors.grey[800]),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                FractionallySizedBox(
                  widthFactor: 0.99,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk mereset password di sini
                    },
                    child: Text('Reset Password'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      fixedSize: Size(double.infinity, 47),
                      backgroundColor: Color(0xFF0D6EFD),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
