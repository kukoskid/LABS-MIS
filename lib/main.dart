import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratoriska 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Laboratoriska 1'),
    );
  }
}

class DetailView extends StatelessWidget {
  final Clothing item;

  const DetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          item.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Image.network(item.image),
        const SizedBox(height: 10),
        Text(
          item.price,
          style: const TextStyle(fontSize: 20, color: Colors.yellow),
        ),
        const SizedBox(height: 10),
        Text(
          item.description,
          style: const TextStyle(fontSize: 16),
        ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Clothing {
  String name;
  String description;
  String image;
  String price;
  
  Clothing(this.name, this.description, this.image, this.price);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Clothing> listClothes = [
    Clothing("T-shirt", "A comfortable cotton T-shirt", "//veirdo.in/cdn/shop/files/Artboard8.png?v=1724158576 980w", "17\$"),
    Clothing("Jeans", "A stylish denim jeans", "https://images.lee.com/is/image/Lee/2055551-HERO?$PDP24-XXLARGE$", "25\$"),
    Clothing("Sweater", "A warm and stylish  sweater", "https://image.uniqlo.com/UQ/ST3/us/imagesgoods/471229/item/usgoods_50_471229_3x4.jpg", "15\$"),
    Clothing("Jacket", "A stylish jacket to keep you warm", "https://assets.ajio.com/medias/sys_master/root/20231013/bPD2/65296135ddf77915193aaef7/-473Wx593H-443011920-olive-MODEL.jpg", "40\$"),
    Clothing("Shorts", "Shorts for summer", "https://m.media-amazon.com/images/I/71o3seXJPQL._AC_SX569_.jpg", "13\$"),
  ];
  
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('221094'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listClothes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listClothes[index].name),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailView(item: listClothes[index]),
                    ),
                    );
                  },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
