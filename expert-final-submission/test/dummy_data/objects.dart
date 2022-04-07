import 'package:flutter_recap/data/model/dog_breed_detail_model.dart';
import 'package:flutter_recap/data/model/dog_breed_model.dart';

const testDogBreed = DogBreedModel(
  message: {
    "akita": [],
  },
  status: "success",
);

const testDogBreedDetail = DogBreedDetailModel(
  message: "https://images.dog.ceo/breeds/akita/Akita_inu_blanc.jpg",
  breed: "akita",
  status: "success",
);

const testListDogBreedDetail = <DogBreedDetailModel>[
  testDogBreedDetail,
];

const testMessageAkitaDog = "https://images.dog.ceo/breeds/akita/Akita_Inu_dog.jpg";
