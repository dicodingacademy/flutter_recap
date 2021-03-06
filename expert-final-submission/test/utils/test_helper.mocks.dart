// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_recap/test/utils/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:flutter_recap/data/model/dog_breed_detail_model.dart'
    as _i4;
import 'package:flutter_recap/data/model/dog_breed_model.dart' as _i3;
import 'package:flutter_recap/data/service/api_service.dart' as _i9;
import 'package:flutter_recap/data/service/database_service.dart' as _i6;
import 'package:http/http.dart' as _i2;
import 'package:http/io_client.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeClient_0 extends _i1.Fake implements _i2.Client {}

class _FakeDogBreedModel_1 extends _i1.Fake implements _i3.DogBreedModel {}

class _FakeDogBreedDetailModel_2 extends _i1.Fake
    implements _i4.DogBreedDetailModel {}

class _FakeResponse_3 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_4 extends _i1.Fake implements _i2.StreamedResponse {
}

class _FakeIOStreamedResponse_5 extends _i1.Fake
    implements _i5.IOStreamedResponse {}

/// A class which mocks [DatabaseService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseService extends _i1.Mock implements _i6.DatabaseService {
  MockDatabaseService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get tableName =>
      (super.noSuchMethod(Invocation.getter(#tableName), returnValue: '')
          as String);
  @override
  _i7.Future<_i8.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i8.Database?>.value()) as _i7.Future<_i8.Database?>);
  @override
  _i7.Future<int> insertDogBreed(_i4.DogBreedDetailModel? breed) =>
      (super.noSuchMethod(Invocation.method(#insertDogBreed, [breed]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<List<_i4.DogBreedDetailModel>> getDogBreed() =>
      (super.noSuchMethod(Invocation.method(#getDogBreed, []),
              returnValue: Future<List<_i4.DogBreedDetailModel>>.value(
                  <_i4.DogBreedDetailModel>[]))
          as _i7.Future<List<_i4.DogBreedDetailModel>>);
  @override
  _i7.Future<bool> getDogBreedByDetail(_i4.DogBreedDetailModel? breed) =>
      (super.noSuchMethod(Invocation.method(#getDogBreedByDetail, [breed]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<int> removeDogBreed(_i4.DogBreedDetailModel? breed) =>
      (super.noSuchMethod(Invocation.method(#removeDogBreed, [breed]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i9.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get httpClient =>
      (super.noSuchMethod(Invocation.getter(#httpClient),
          returnValue: _FakeClient_0()) as _i2.Client);
  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_0()) as _i2.Client);
  @override
  set client(_i2.Client? _client) =>
      super.noSuchMethod(Invocation.setter(#client, _client),
          returnValueForMissingStub: null);
  @override
  _i7.Future<_i3.DogBreedModel> listDogBreed() => (super.noSuchMethod(
          Invocation.method(#listDogBreed, []),
          returnValue: Future<_i3.DogBreedModel>.value(_FakeDogBreedModel_1()))
      as _i7.Future<_i3.DogBreedModel>);
  @override
  _i7.Future<_i4.DogBreedDetailModel> dogBreed(String? breed) =>
      (super.noSuchMethod(Invocation.method(#dogBreed, [breed]),
              returnValue: Future<_i4.DogBreedDetailModel>.value(
                  _FakeDogBreedDetailModel_2()))
          as _i7.Future<_i4.DogBreedDetailModel>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i2.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i7.Future<_i11.Uint8List>);
  @override
  _i7.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_4()))
          as _i7.Future<_i2.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockIOClient extends _i1.Mock implements _i5.IOClient {
  MockIOClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.IOStreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue: Future<_i5.IOStreamedResponse>.value(
                  _FakeIOStreamedResponse_5()))
          as _i7.Future<_i5.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_3()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i7.Future<_i11.Uint8List>);
}
