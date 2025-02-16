import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> get getProducts{
    return products;
  }
  ProductModel? findByProId (String productId){
    if(products.where((elemnt) => elemnt.productID == productId).isEmpty){
      return null;
    }
    return products.firstWhere((element) => element.productID == productId);
  }

  List<ProductModel> findProviderByCTG(String ctgName){
    List<ProductModel> listCTG = products.where((elemnt) => elemnt.productCatigory.toLowerCase().contains(ctgName.toLowerCase())).toList();
    return listCTG;
  }
  List<ProductModel> searchQuery(String prodName) {
    // Trim any spaces in the search string
    prodName = prodName.trim();
    List<ProductModel> listNames = products.where((elemnt) {
      return elemnt.productName.toLowerCase().contains(prodName.toLowerCase());
    }).toList();

    return listNames;
  }

  static List<ProductModel> products = [
    // Phones
    ProductModel(
      productID: 'iphone14-128gb-black',
      productName: "Apple iPhone 14 Pro (128GB) - Black",
      productPrice: "1399.99",
      productCatigory: "Phones",
      productDescription:
      "6.1-inch Super Retina XDR display with ProMotion and always-on display. Dynamic Island, a new and magical way to interact with your iPhone. 48MP main camera for up to 4x higher resolution. Cinematic mode, now in 4K Dolby Vision up to 30 fps. Action mode, for stable and smooth videos when you're on the move. Accident detection, vital safety technology that calls for help for you. All-day battery life and up to 23 hours of video playback.",
      productImage: "https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp",
      productQuantatiy: "10",
    ),
    ProductModel(
      productID: 'iphone13-mini-256gb-midnight',
      productName:
      "iPhone 13 Mini, 256GB, Midnight - Unlocked (Renewed Premium)",
      productPrice: "659.99",
      productCatigory: "Phones",
      productDescription:
      "5.4 Super Retina XDR display. 5G Superfast downloads, high quality streaming. Cinematic mode in 1080p at 30 fps. Dolby Vision HDR video recording up to 4K at 60 fps. 2X Optical zoom range. A15 Bionic chip. New 6-core CPU with 2 performance and 4 efficiency cores. New 4-core GPU. New 16-core Neural Engine. Up to 17 hours video playback. Face ID. Ceramic Shield front. Aerospace-grade aluminum. Water resistant to a depth of 6 meters for up to 30 minutes. Compatible with MagSafe accessories and wireless chargers.",
      productImage: "https://i.ibb.co/nbwTvXQ/2-iphone13-mini-256gb-midnight.webp",
      productQuantatiy: "15",
    ),
    ProductModel(
      productID: 'Acheter un iPhone 14',
      productName: "iPhone 14",
      productPrice: "1199.99",
      productCatigory: "Phones",
      productDescription:
      "Les détails concernant la livraison dans votre région s’afficheront sur la page de validation de la commande.",
      productImage: "https://i.ibb.co/G7nXCW4/3-i-Phone-14.jpg",
      productQuantatiy: "144",
    ),
    ProductModel(
      productID: 'samsung-galaxy-s22-ultra',
      productName:
      "Samsung Galaxy S22 Ultra 5G - 256GB - Phantom Black (Unlocked)",
      productPrice: "1199.99",
      productCatigory: "Phones",
      productDescription:
      "About this item\n6.8 inch Dynamic AMOLED 2X display with a 3200 x 1440 resolution\n256GB internal storage, 12GB RAM\n108MP triple camera system with 100x Space Zoom and laser autofocus\n40MP front-facing camera with dual pixel AF\n5000mAh battery with fast wireless charging and wireless power share\n5G capable for lightning fast download and streaming",
      productImage:
      "https://i.ibb.co/z5zMDCx/4-Samsung-Galaxy-S22-Ultra-5-G-256-GB-Phantom-Black-Unlocked.webp",
      productQuantatiy: "2363",
    ),
    ProductModel(
      productID: 'samsung-galaxy-s21-ultra',
      productName:
      "Samsung Galaxy S21 Ultra 5G | Factory Unlocked Android Cell Phone | US Version 5G Smartphone",
      productPrice: "1199.99",
      productCatigory: "Phones",
      productDescription:
      "About this item\nPro Grade Camera: Zoom in close with 100X Space Zoom, and take photos and videos like a pro with our easy-to-use, multi-lens camera.\n100x Zoom: Get amazing clarity with a dual lens combo of 3x and 10x optical zoom, or go even further with our revolutionary 100x Space Zoom.\nHighest Smartphone Resolution: Crystal clear 108MP allows you to pinch, crop and zoom in on your photos to see tiny, unexpected details, while lightning-fast Laser Focus keeps your focal point clear\nAll Day Intelligent Battery: Intuitively manages your cellphone’s usage, so you can go all day without charging (based on average battery life under typical usage conditions).\nPower of 5G: Get next-level power for everything you love to do with Samsung Galaxy 5G; More sharing, more gaming, more experiences and never miss a beat",
      productImage:
      "https://i.ibb.co/ww5WjkV/5-Samsung-Galaxy-S21-Ultra-5-G.png",
      productQuantatiy: "3625",
    ),
    ProductModel(
      productID: 'oneplus-9-pro-5g',
      productName:
      "OnePlus 9 Pro 5G LE2120 256GB 12GB RAM Factory Unlocked (GSM Only | No CDMA - not Compatible with Verizon/Sprint) International Version - Morning Mist",
      productPrice: "1099.99",
      productCatigory: "Phones",
      productDescription:
      "About this item\n6.7 inch LTPO Fluid2 AMOLED, 1B colors, 120Hz, HDR10+, 1300 nits (peak)\n256GB internal storage, 12GB RAM\nQuad rear camera: 48MP, 50MP, 8MP, 2MP\n16MP front-facing camera\n4500mAh battery with Warp Charge 65T (10V/6.5A) and 50W Wireless Charging\n5G capable for lightning fast download and streaming",
      productImage:
      "https://i.ibb.co/0yhgKVv/6-One-Plus-9-Pro-5-G-LE2120-256-GB-12-GB-RAM.png",
      productQuantatiy: "3636",
    ),
    ProductModel(
      productID: 'samsung-galaxy-z-flip3',
      productName: "Samsung Galaxy Z Flip3 5G",
      productPrice: "999.99",
      productCatigory: "Phones",
      productDescription:
      "About this item\nGet the latest Galaxy experience on your phone.\nFOLDING DISPLAY - Transform the way you capture, share and experience content.\nCAPTURE EVERYTHING - With the wide-angle camera and the front camera, take stunning photos and videos from every angle.\nWATER RESISTANT - Use your Galaxy Z Flip3 5G even when it rains.\nONE UI 3.1 - Enjoy the Galaxy Z Flip3 5G’s sleek, premium design and all the features you love from the latest One UI 3.1.",
      productImage: "https://i.ibb.co/NstFstg/7-Samsung-Galaxy-Z-Flip3-5-G.png",
      productQuantatiy: "525",
    ),
    ProductModel(
      productID: 'iphone-14-plus',
      productName: "Apple introduces iPhone 14 and iPhone 14 Plus",
      productPrice: "1199.99",
      productCatigory: "Phones",
      productDescription:
      "A new, larger 6.7-inch size joins the popular 6.1-inch design, featuring a new dual-camera system, Crash Detection, a smartphone industry-first safety service with Emergency SOS via satellite, and the best battery life on iPhone",
      productImage: "https://i.ibb.co/8P1HBm4/8-iphone14plushereo.jpg",
      productQuantatiy: "2526",
    ),
    ProductModel(
      productID: 'xiaomi-redmi-note-10-pro',
      productName: "Xiaomi Redmi Note 10 Pro",
      productPrice: "249.99",
      productCatigory: "Phones",
      productDescription:
      "About this item\n6.67-inch 120Hz AMOLED display with TrueColor\n108MP quad rear camera system with 8K video support\nQualcomm Snapdragon 732G processor\n5020mAh (typ) high-capacity battery\n33W fast charging support and 33W fast charger included in the box",
      productImage: "https://i.ibb.co/W3QcVMv/9-Xiaomi-Redmi-Note-10-Pro.png",
      productQuantatiy: "353",
    ),
    ProductModel(
      productID: 'oneplus-10-pro-5g',
      productName: "OnePlus 10 Pro 5G",
      productPrice: "899.99",
      productCatigory: "Phones",
      productDescription:
      "About this item\n6.7 inch Fluid AMOLED Display with LTPO, 120 Hz refresh rate, 10-bit color, HDR10+, and adaptive refresh",
      productImage: "https://i.ibb.co/9vGVHQk/10-One-Plus-10-Pro-5-G.png",
      productQuantatiy: "3873",
    ),
    ProductModel(
      productID: 'asus-rog-zephyrus-g15',
      productName: "ASUS ROG Zephyrus G15",
      productPrice: "1599.99",
      productCatigory: "Laptops",
      productDescription:
      "About this item\nAMD Ryzen 9 5900HS processor, NVIDIA GeForce RTX 3080 GPU\n15.6” QHD 165Hz/3ms Display\n1TB PCIe NVMe SSD, 16GB DDR4 RAM\nUltra-thin, ultra-light design with RGB lighting\nWindows 10 Home",
      productImage: "https://i.ibb.co/kMR5mpR/12-ASUS-ROG-Zephyrus-G15.png",
      productQuantatiy: "525",
    ),
    ProductModel(
      productID: 'acer-predator-helios-300',
      productName: "Acer Predator Helios 300",
      productPrice: "1199.99",
      productCatigory: "Laptops",
      productDescription:
      "About this item\n15.6” Full HD IPS Display, 144Hz Refresh Rate\nIntel Core i7-11800H Processor\n16GB DDR4 RAM, 512GB PCIe NVMe SSD\nNVIDIA GeForce RTX 3060 GPU\nCustomizable RGB Backlit Keyboard",
      productImage: "https://i.ibb.co/tcB3HXJ/13-Acer-Predator-Helios-300.webp",
      productQuantatiy: "5353",
    ),
    ProductModel(
      productID: 'razer-blade-15-base',
      productName: "Razer Blade 15 Base",
      productPrice: "1599.99",
      productCatigory: "Laptops",
      productDescription:
      "About this item\n15.6\" FHD 120Hz Display\nIntel Core i7-10750H 6-Core Processor\nNVIDIA GeForce GTX 1660 Ti Graphics\n16GB DDR4 RAM, 256GB SSD\nCompact and premium design",
      productImage: "https://i.ibb.co/XDtWpXC/14-Razer-Blade-15-Base.png",
      productQuantatiy: "5335",
    ),
    ProductModel(
      productID: 'msi-gs66-stealth',
      productName: "MSI GS66 Stealth",
      productPrice: "1999.99",
      productCatigory: "Laptops",
      productDescription:
      "About this item\n15.6\" UHD Display, 100% Adobe RGB\nIntel Core i9-11900H Processor\nNVIDIA GeForce RTX 3080 Graphics\n32GB DDR4 RAM, 1TB SSD\nSleek black design with long battery life",
      productImage: "https://i.ibb.co/0Q4xHVn/15-MSI-GS66-Stealth.png",
      productQuantatiy: "2599",
    ),
    ProductModel(
      //16
      productID: const Uuid().v4(),
      productName: "Apple Watch Series 7",
      productPrice: "399.99",
      productCatigory: "Watches",
      productDescription:
      "About this item\nAlways-On Retina display has been redesigned to be larger, yet still always on, so you can easily see the time and your watch face.\nAdvanced workout features let you measure your blood oxygen level, sleep, and heart rate, and there are cycling, yoga, and dance workouts to choose from.\nChoose from new watch faces, new colors, and new bands, including the Hermès Fastener, which is inspired by the buckle on the straps of Hermès horse harnesses.\nApple Watch Series 7 has a water resistance rating of 50 meters under ISO standard 22810:2010.",
      productImage: "https://i.ibb.co/8cNwrbJ/16-Apple-Watch-Series-7.png",
      productQuantatiy: "535352",
    ),
    ProductModel(
      //17
      productID: const Uuid().v4(),
      productName: "Samsung Galaxy Watch 4",
      productPrice: "249.99",
      productCatigory: "Watches",
      productDescription:
      "About this item\nTake your fitness to the next level with advanced sensors that track your body composition, heart rate, sleep quality, and more.\nThe watch automatically detects and tracks over 90 different exercises, from running and cycling to swimming and rowing.\nGalaxy Watch 4 lets you control your smart home devices right from your wrist, so you can turn off the lights, adjust the thermostat, and more.\nThe watch comes with a choice of watch faces, so you can customize it to match your style.",
      productImage: "https://i.ibb.co/tsq0VD8/17-Samsung-Galaxy-Watch-4.png",
      productQuantatiy: "252",
    ),
    ProductModel(
      //18
      productID: const Uuid().v4(),
      productName: "Fitbit Sense Advanced Smartwatch",
      productPrice: "299.95",
      productCatigory: "Watches",
      productDescription:
      "About this item\nThe Fitbit Sense is an advanced smartwatch that tracks your heart rate, skin temperature, and stress levels.\nIt also has built-in GPS and lets you control your Spotify music right from your wrist.\nThe watch comes with a choice of watch faces, and you can customize it with a variety of bands.\nThe battery lasts up to 6 days, so you can wear it all week without needing to recharge it.",
      productImage: "https://i.ibb.co/jrVQppF/18-Fitbit-Sense-Advanced-Smartwatch.png",
      productQuantatiy: "526",
    ),
    ProductModel(
      //19
      productID: const Uuid().v4(),
      productName: "Garmin Forerunner 945 LTE",
      productPrice: "649.99",
      productCatigory: "Watches",
      productDescription:
      "About this item\nThe Garmin Forerunner 945 LTE is a high-end GPS running watch with LTE connectivity, so you can leave your phone at home.\nIt has built-in music storage and lets you pay for purchases with Garmin Pay.\nThe watch comes with a choice of watch faces, and you can customize it with a variety of bands.\nThe battery lasts up to 10 days in smartwatch mode and up to 36 hours in GPS mode with music.",
      productImage: "https://i.ibb.co/xXhSfTh/19-Garmin-Forerunner-945-LTE.png",
      productQuantatiy: "58385",
    ),
    // SHOES
    ProductModel(
      //20
      productID: const Uuid().v4(),
      productName: "Nike Air Force 1 '07",
      productPrice: "90.88",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nFull-grain leather in the upper adds a premium look and feel.\nOriginally designed for performance hoops, Nike Air cushioning adds lightweight, all-day comfort.\nThe padded, low-cut collar looks sleek and feels great.\nPerforations on the toe provide airflow for breathability.\nThe non-marking rubber sole adds traction and durability.",
      productImage: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
      productQuantatiy: "7544",
    ),
    ProductModel(
      //21
      productID: const Uuid().v4(),
      productName: "Adidas Ultraboost 21",
      productPrice: "180.53",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nResponsive Boost midsole\n3D Heel Frame\nSock-like fit\nPrimeknit+ upper\nStretchweb outsole with Continental™ Rubber",
      productImage: "https://i.ibb.co/QM1dLww/21-Adidas-Ultraboost-21.webp",
      productQuantatiy: "7654",
    ),
    ProductModel(
      //22
      productID: const Uuid().v4(),
      productName: "Converse Chuck Taylor All Star High Top",
      productPrice: "55.12",
      productCatigory: "Shoes",
      productDescription:
      "About this item\n100% Synthetic\nImported\nRubber sole\nShaft measures approximately 4.5 from arch\nPlatform measures approximately 0.25\nLace-up, high-top sneaker\nOrthoLite insole for cushioning\nMedial eyelets for airflow\nCanvas upper",
      productImage: "https://i.ibb.co/TBQv7G6/22-Converse-Chuck-Taylor-All-Star-High-Top.png",
      productQuantatiy: "36437",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "New Balance Fresh Foam 1080v11",
      productPrice: "149.99",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nSynthetic and mesh upper for a breathable and supportive fit\nFresh Foam midsole cushioning is precision engineered to deliver an ultra-cushioned, lightweight ride\nBlown rubber outsole provides durability and traction\nLace closure ensures a secure fit\nOrtholite cushioning adds extra comfort",
      productImage: "https://i.ibb.co/k2BtR9X/23-New-Balance-Fresh-Foam-1080v11.webp",
      productQuantatiy: "36637",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Vans Old Skool",
      productPrice: "60.33",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nCanvas and suede upper for durability\nReinforced toe cap for added durability\nPadded collar for support and flexibility\nVulcanized construction for durability and grip\nSignature rubber waffle outsole for traction",
      productImage: "https://i.ibb.co/NNDk3pt/24-Vans-Old-Skool.png",
      productQuantatiy: "3637",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Adidas Ultraboost 21",
      productPrice: "180.7",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nBoost cushioning technology delivers comfort and energy return with every step\n3D Heel Frame cradles the heel for natural fit and optimal movement of the Achilles\nPrimeknit+ upper adapts to the changing shape of your foot through the gait cycle\nTorsion System provides a stable feel from heel strike to toe-off\nStretchweb outsole flexes naturally for an energized ride",
      productImage: "https://i.ibb.co/VmvdBqC/25-Adidas-Ultraboost-21.webp",
      productQuantatiy: "8565",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Nike Air Max 270",
      productPrice: "150.78",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nLarge Max Air unit delivers plush cushioning and all-day comfort\nNeoprene stretch bootie design delivers a snug fit\n3-piece midsole offers durability and a smooth transition\nMono-mesh window in the quarter and engineered mesh in the forefoot provide durability\nRubber toe tip provides durability and grip during training movements such as planks and push-ups",
      productImage: "https://i.ibb.co/Tk3WDX1/26-Nike-Air-Max-270.png",
      productQuantatiy: "6437",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "New Balance Fresh Foam 1080v11",
      productPrice: "149.99",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nFresh Foam midsole cushioning is precision engineered to deliver an ultra-cushioned, lightweight ride\nSynthetic/mesh upper\nOrtholite sockliner for comfort\nBlown rubber outsole provides durability\nUltra Heel design hugs the back of the foot for a snug, supportive fit",
      productImage: "https://i.ibb.co/5rxL1Ck/27-New-Balance-Fresh-Foam-1080v11.png",
      productQuantatiy: "7853",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Puma Future Z 1.1 FG/AG Soccer Cleats",
      productPrice: "199.99",
      productCatigory: "Shoes",
      productDescription:
      "About this item\nAdaptive FUZIONFIT+ compression band for unparalleled fit and lockdown\nMATRYXEVO woven upper constructed with reactive Kevlar and Carbon yarns for support during fast-forward motion\nDynamic Motion System outsole provides grip and agility\nGripControl Pro coating for better ball control",
      productImage: "https://i.ibb.co/8bMhmCj/28-Puma-Future-Z-1-1-FG.webp",
      productQuantatiy: "474",
    ),
    // Accessories
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Ray-Ban Wayfarer Sunglasses",
      productPrice: "150.75",
      productCatigory: "Accessories",
      productDescription:
      "About this item\n100% UV protection: Ray-Ban sunglass lenses are coated with 100% UV protection to protect your eyes from all harmful UV rays\nPolarized sunglasses: These classic Ray-Ban Wayfarer sunglasses feature polarized lenses to reduce glare and enhance clarity\nIconic style: The Wayfarer is one of Ray-Ban's most recognizable and classic designs, available in a variety of lens and frame colors\nDurable construction: These Ray-Ban sunglasses are built to last with high-quality materials and construction",
      productImage: "https://i.ibb.co/FDMK4Lq/29-Ray-Ban-Wayfarer-Sunglasses.png",
      productQuantatiy: "7436",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Herschel Supply Co. Settlement Backpack",
      productPrice: "64.99",
      productCatigory: "Accessories",
      productDescription:
      "About this item\nSignature striped fabric liner\n15 inch laptop sleeve\nFront storage pocket with key clip\nInternal media pocket with headphone port\nClassic woven label\nDimensions: 17.75 inches (H) x 12.25 inches (W) x 5.75 inches (D)",
      productImage: "https://i.ibb.co/1GV6Nrv/30-Herschel-Supply-Co-Settlement-Backpack.png",
      productQuantatiy: "3637",
    ),
    ProductModel(
      productID: const Uuid().v4(),
      productName: "Fitbit Charge 5 Advanced Fitness Tracker",
      productPrice: "179.95",
      productCatigory: "Accessories",
      productDescription:
      "About this item\nAdvanced sensors track daily activity, sleep, and stress levels\nUp to 7-day battery life\nEasily track heart rate and exercise metrics\nReceive notifications and control music from your wrist\nWater-resistant up to 50m\nConnect to your phone's GPS to track outdoor activities",
      productImage: "https://i.ibb.co/Wz2yzQ7/31-Fitbit-Charge-5-Advanced-Fitness-Tracker.png",
      productQuantatiy: "347343",
    ),


  ];

}