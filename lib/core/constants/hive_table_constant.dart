class HiveTableConstant {
  //private constructor to prevent instantiation
  HiveTableConstant._();

  //Database name
  static const String dbName = 'lost_n_found_db';

  //Table names: Box names in Hive
  static const int batchTypeId = 0;
  static const String batchTable = 'batch_table';

  static const int itemTypeId = 1;
  static const String itemTable = 'item_table';

  static const int studentTypeId = 2;
  static const String studentTable = 'student_table';

  static const int categoryTypeId = 3;
  static const String categoryTable = 'category_table';

  static const int commentTypeId = 4;
  static const String commentTable = 'comment_table';
  
}
