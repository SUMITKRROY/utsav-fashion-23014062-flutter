class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.parentId,
    required this.name,
    required this.isActive,
    required this.position,
    required this.level,
    required this.productCount,
    required this.childrenData,
  });
  late final int id;
  late final int parentId;
  late final String name;
  late final bool isActive;
  late final int position;
  late final int level;
  late final int productCount;
  late final List<ChildrenData> childrenData;

  CategoriesModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position']??'';
    level = json['level'];
    productCount = json['product_count'];
    childrenData = List.from(json['children_datafdf']).map((e)=>ChildrenData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['name'] = name;
    _data['is_active'] = isActive;
    _data['position'] = position;
    _data['level'] = level;
    _data['product_count'] = productCount;
    _data['children_data'] = childrenData.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ChildrenData {
  ChildrenData({
    required this.id,
    required this.parentId,
    required this.name,
    required this.isActive,
    required this.position,
    required this.level,
    required this.productCount,
    required this.childrenData,
  });
  late final int id;
  late final int parentId;
  late final String name;
  late final bool isActive;
  late final int position;
  late final int level;
  late final int productCount;
  late final List<ChildrenData> childrenData;

  ChildrenData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    childrenData = List.from(json['children_data']).map((e)=>ChildrenData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['name'] = name;
    _data['is_active'] = isActive;
    _data['position'] = position;
    _data['level'] = level;
    _data['product_count'] = productCount;
    _data['children_data'] = childrenData.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ChildrenDataMap {
  ChildrenDataMap({
    required this.id,
    required this.parentId,
    required this.name,
    required this.isActive,
    required this.position,
    required this.level,
    required this.productCount,
    required this.childrenDataMap,
  });
  late final int id;
  late final int parentId;
  late final String name;
  late final bool isActive;
  late final int position;
  late final int level;
  late final int productCount;
  late final List<ChildrenDataMap> childrenDataMap;

  ChildrenDataMap.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    childrenDataMap = List.from(json['children_data']).map((e)=>ChildrenDataMap.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['name'] = name;
    _data['is_active'] = isActive;
    _data['position'] = position;
    _data['level'] = level;
    _data['product_count'] = productCount;
    _data['children_data'] = childrenDataMap.map((e)=>e.toJson()).toList();
    return _data;
  }
}