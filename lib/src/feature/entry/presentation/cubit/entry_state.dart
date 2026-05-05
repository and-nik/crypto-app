part of '../entry_page.dart';

abstract class _EntryState {}

class _LoadingState extends _EntryState {}
class _FirstTimeState extends _EntryState {}
class _NotFirstTimeState extends _EntryState {}