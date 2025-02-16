

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
    String status;
    List<Food> foods;

    FoodModel({
        required this.status,
        required this.foods,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        status: json["status"],
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    };
}

class Food {
    String id;
    String name;
    String description;
    String portion;
    String shopId;
    String meal;
    int defaultprice;
    List<String> images;
    bool available;
    List<Customization> customizations;
    int avarageRating;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Food({
        required this.id,
        required this.name,
        required this.description,
        required this.portion,
        required this.shopId,
        required this.meal,
        required this.defaultprice,
        required this.images,
        required this.available,
        required this.customizations,
        required this.avarageRating,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        portion: json["portion"],
        shopId: json["shopId"],
        meal: json["meal"],
        defaultprice: json["defaultprice"],
        images: List<String>.from(json["images"].map((x) => x)),
        available: json["available"],
        customizations: List<Customization>.from(json["customizations"].map((x) => Customization.fromJson(x))),
        avarageRating: json["avarageRating"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "portion": portion,
        "shopId": shopId,
        "meal": meal,
        "defaultprice": defaultprice,
        "images": List<dynamic>.from(images.map((x) => x)),
        "available": available,
        "customizations": List<dynamic>.from(customizations.map((x) => x.toJson())),
        "avarageRating": avarageRating,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Customization {
    String name;
    int price;
    String description;
    String id;

    Customization({
        required this.name,
        required this.price,
        required this.description,
        required this.id,
    });

    factory Customization.fromJson(Map<String, dynamic> json) => Customization(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "_id": id,
    };
}
