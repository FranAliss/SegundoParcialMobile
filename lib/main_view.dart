import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(),
        '/recuperar_view': (context) => Recuperar_Contra_View(),
        '/user_view': (context) => User_view(),
        '/main_view': (context) => MainView()
      },
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login View'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'you@email.com',
                    icon: Icon(Icons.contact_mail)),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.vpn_key)),
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main_view');
                    },
                    child: const Text('Ingresar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/recuperar_view');
                    },
                    child: const Text('Recuperar Contraseña'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.facebook,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Google"),
          ),
        ],
      ),
    );
  }
}

class Recuperar_Contra_View extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PasswordChangeViewState createState() => _PasswordChangeViewState();
}

class _PasswordChangeViewState extends State<Recuperar_Contra_View> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  String message = '';

  void _changePassword() {
    String currentPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String repeatPassword = repeatPasswordController.text;

    if (newPassword == currentPassword) {
      setState(() {
        message = 'Nueva constraseña no puede ser la antigua';
      });
    } else {
      if (newPassword == repeatPassword) {
        setState(() {
          message = 'Contraseña cambiada';
        });
      } else {
        setState(() {
          message = 'Las contraseñas no coinciden';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña actual',
              ),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Nueva Contraseña',
              ),
            ),
            TextField(
              controller: repeatPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Repetir Nueva Contraseña',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _changePassword,
              child: const Text('Confirmar'),
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(
                color: message == 'Contraseña cambiada'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User_view extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UserSettingsViewState createState() => _UserSettingsViewState();
}

class _UserSettingsViewState extends State<User_view> {
  TextEditingController usernameController =
      TextEditingController(text: 'usuario1');
  TextEditingController emailController =
      TextEditingController(text: 'usuario@mail.com');

  bool isEditing = false;

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1433039224/photo/blue-user-3d-icon-person-profile-concept-isolated-on-white-background-with-social-member.webp?b=1&s=612x612&w=0&k=20&c=2vlWjUXTk0K8_S58_krOytfNQhcbemXjw_1yJ0W6c4c=',
              width: 80,
            ),
            TextField(
              controller: usernameController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: emailController,
              enabled: isEditing, // Email field is not editable
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  _saveChanges();
                }
                _toggleEditing();
              },
              child: Text(isEditing ? 'Guardar' : 'Editar'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user_view');
              },
              child: const Text('Editar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
