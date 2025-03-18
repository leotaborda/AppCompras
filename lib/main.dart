import 'package:flutter/material.dart';
import 'screens/sorvete.dart';
import 'screens/burguer.dart';
import 'screens/rosca.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burn Calories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(
        title: "Sorvete",
        color: Colors.lightBlue,
        route: SorveteScreen(),
        icon: Icons.icecream,
        description: "Descubra como queimar calorias de Sorvetes"
    ),
    FoodItem(
        title: "Burguer",
        color: Colors.orange,
        route: BurguerScreen(),
        icon: Icons.lunch_dining,
        description: "Exercícios para compensar um Hamburguer"
    ),
    FoodItem(
        title: "Rosquinha",
        color: Colors.pink,
        route: RoscaScreen(),
        icon: Icons.donut_large,
        description: "Como eliminar as calorias de uma Rosquinha"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Queimar Calorias',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [Colors.grey[900]!, Colors.grey[800]!]
                : [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Escolha um alimento',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Descubra como queimar as calorias dos seus alimentos favoritos',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    return FoodCard(foodItem: foodItems[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar funcionalidade para pesquisar ou adicionar novos alimentos
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Funcionalidade em desenvolvimento'))
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar alimento',
      ),
    );
  }
}

class FoodItem {
  final String title;
  final Color color;
  final Widget route;
  final IconData icon;
  final String description;

  FoodItem({
    required this.title,
    required this.color,
    required this.route,
    required this.icon,
    required this.description,
  });
}

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => foodItem.route),
          );
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: foodItem.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  foodItem.icon,
                  color: foodItem.color,
                  size: 36,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      foodItem.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}