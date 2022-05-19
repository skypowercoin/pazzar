class Aggregmodel {
  bool? isSuccess;
  int? statusCode;
  bool? error;
  Result? result;
  Headers? headers;

  Aggregmodel({isSuccess, statusCode, error, result, headers});

  Aggregmodel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    statusCode = json['statusCode'];
    error = json['error'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['statusCode'] = statusCode;
    data['error'] = error;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    return data;
  }
}

class Result {
  String? slpName;
  List<Products>? products;
  int? totalCount;
  String? roughTotalCount;
  String? searchStrategy;
  String? title;
  String? uxLayout;
  String? queryTerm;
  int? pageIndex;
  List<String>? widgets;

  Result(
      {this.slpName,
      this.products,
      this.totalCount,
      this.roughTotalCount,
      this.searchStrategy,
      this.title,
      this.uxLayout,
      this.queryTerm,
      this.pageIndex,
      this.widgets});

  Result.fromJson(Map<String, dynamic> json) {
    slpName = json['slpName'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v, k) {
        print(k);
        products!.add(Products.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    roughTotalCount = json['roughTotalCount'];
    searchStrategy = json['searchStrategy'];
    title = json['title'];
    uxLayout = json['uxLayout'];
    queryTerm = json['queryTerm'];
    pageIndex = json['pageIndex'];

    ///if (json['widgets'] != null) {
    /// widgets = List<Widget>[];
    /// json['widgets'].forEach((v) {
    ///  widgets!.add(Widget.fromJson(v));
    /// }
    // );
    //}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slpName'] = slpName;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    data['roughTotalCount'] = roughTotalCount;
    data['searchStrategy'] = searchStrategy;
    data['title'] = title;
    data['uxLayout'] = uxLayout;
    data['queryTerm'] = queryTerm;
    data['pageIndex'] = pageIndex;

    ///if (widgets != null) {
    ///   data['widgets'] = widgets!.map((v) => v!.toJson()).toList();
    //}
    return data;
  }
}

class Products {
  int? id;
  String? name;
  List<String>? images;
  String? imageAlt;
  Brand? brand;
  int? tax;
  String? businessUnit;
  bool? showSexualContent;
  int? productGroupId;
  bool? hasReviewPhoto;
  List<Sections>? sections;
  List<Variants>? variants;
  String? categoryHierarchy;
  int? categoryId;
  String? categoryName;
  String? url;
  int? merchantId;
  int? campaignId;
  Price? price;
  List<Promotions>? promotions;
  int? rushDeliveryDuration;
  bool? freeCargo;
  int? margin;
  String? campaignName;
  String? listingId;
  String? winnerVariant;
  int? itemNumber;
  String? discountedPriceInfo;
  bool? hasCollectableCoupon;
  List<Stamps>? stamps;
  RatingScore? ratingScore;

  Products(
      {this.id,
      this.name,
      this.images,
      this.imageAlt,
      this.brand,
      this.tax,
      this.businessUnit,
      this.showSexualContent,
      this.productGroupId,
      this.hasReviewPhoto,
      this.sections,
      this.variants,
      this.categoryHierarchy,
      this.categoryId,
      this.categoryName,
      this.url,
      this.merchantId,
      this.campaignId,
      this.price,
      this.promotions,
      this.rushDeliveryDuration,
      this.freeCargo,
      this.margin,
      this.campaignName,
      this.listingId,
      this.winnerVariant,
      this.itemNumber,
      this.discountedPriceInfo,
      this.hasCollectableCoupon,
      this.stamps,
      this.ratingScore});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'].cast<String>();
    imageAlt = json['imageAlt'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    tax = json['tax'];
    businessUnit = json['businessUnit'];
    showSexualContent = json['showSexualContent'];
    productGroupId = json['productGroupId'];
    hasReviewPhoto = json['hasReviewPhoto'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    categoryHierarchy = json['categoryHierarchy'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    url = json['url'];
    merchantId = json['merchantId'];
    campaignId = json['campaignId'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['promotions'] != null) {
      promotions = <Promotions>[];
      json['promotions'].forEach((v) {
        promotions!.add(Promotions.fromJson(v));
      });
    }
    rushDeliveryDuration = json['rushDeliveryDuration'];
    freeCargo = json['freeCargo'];
    margin = json['margin'];
    campaignName = json['campaignName'];
    listingId = json['listingId'];
    winnerVariant = json['winnerVariant'];
    itemNumber = json['itemNumber'];
    discountedPriceInfo = json['discountedPriceInfo'];
    hasCollectableCoupon = json['hasCollectableCoupon'];
    if (json['stamps'] != null) {
      stamps = <Stamps>[];
      json['stamps'].forEach((v) {
        stamps!.add(Stamps.fromJson(v));
      });
    }
    ratingScore = json['ratingScore'] != null
        ? RatingScore.fromJson(json['ratingScore'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['images'] = images;
    data['imageAlt'] = imageAlt;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['tax'] = tax;
    data['businessUnit'] = businessUnit;
    data['showSexualContent'] = showSexualContent;
    data['productGroupId'] = productGroupId;
    data['hasReviewPhoto'] = hasReviewPhoto;
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['categoryHierarchy'] = categoryHierarchy;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['url'] = url;
    data['merchantId'] = merchantId;
    data['campaignId'] = campaignId;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (promotions != null) {
      data['promotions'] = promotions!.map((v) => v.toJson()).toList();
    }
    data['rushDeliveryDuration'] = rushDeliveryDuration;
    data['freeCargo'] = freeCargo;
    data['margin'] = margin;
    data['campaignName'] = campaignName;
    data['listingId'] = listingId;
    data['winnerVariant'] = winnerVariant;
    data['itemNumber'] = itemNumber;
    data['discountedPriceInfo'] = discountedPriceInfo;
    data['hasCollectableCoupon'] = hasCollectableCoupon;
    if (stamps != null) {
      data['stamps'] = stamps!.map((v) => v.toJson()).toList();
    }
    if (ratingScore != null) {
      data['ratingScore'] = ratingScore!.toJson();
    }
    return data;
  }
}

///الماركة
class Brand {
  int? id;
  String? name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

///الاقسام الرىيسية
class Sections {
  String? id;

  Sections({this.id});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Variants {
  String? attributeValue;
  String? attributeName;
  Price? price;
  String? listingId;
  int? campaignId;
  int? merchantId;
  String? discountedPriceInfo;
  bool? hasCollectableCoupon;

  Variants(
      {this.attributeValue,
      this.attributeName,
      this.price,
      this.listingId,
      this.campaignId,
      this.merchantId,
      this.discountedPriceInfo,
      this.hasCollectableCoupon});

  Variants.fromJson(Map<String, dynamic> json) {
    attributeValue = json['attributeValue'];
    attributeName = json['attributeName'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    listingId = json['listingId'];
    campaignId = json['campaignId'];
    merchantId = json['merchantId'];
    discountedPriceInfo = json['discountedPriceInfo'];
    hasCollectableCoupon = json['hasCollectableCoupon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attributeValue'] = attributeValue;
    data['attributeName'] = attributeName;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['listingId'] = listingId;
    data['campaignId'] = campaignId;
    data['merchantId'] = merchantId;
    data['discountedPriceInfo'] = discountedPriceInfo;
    data['hasCollectableCoupon'] = hasCollectableCoupon;
    return data;
  }
}

class Price {
  int? sellingPrice;
  int? originalPrice;
  int? manipulatedOriginalPrice;
  int? discountedPrice;
  int? buyingPrice;

  Price(
      {this.sellingPrice,
      this.originalPrice,
      this.manipulatedOriginalPrice,
      this.discountedPrice,
      this.buyingPrice});

  Price.fromJson(Map<String, dynamic> json) {
    sellingPrice = json['sellingPrice'];
    originalPrice = json['originalPrice'];
    manipulatedOriginalPrice = json['manipulatedOriginalPrice'];
    discountedPrice = json['discountedPrice'];
    buyingPrice = json['buyingPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sellingPrice'] = sellingPrice;
    data['originalPrice'] = originalPrice;
    data['manipulatedOriginalPrice'] = manipulatedOriginalPrice;
    data['discountedPrice'] = discountedPrice;
    data['buyingPrice'] = buyingPrice;
    return data;
  }
}

///العروض
class Promotions {
  int? id;
  String? name;
  String? shortName;
  String? promotionEndDate;

  Promotions({this.id, this.name, this.shortName, this.promotionEndDate});

  Promotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    promotionEndDate = json['promotionEndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    data['promotionEndDate'] = promotionEndDate;
    return data;
  }
}

///الصور المصغرة ك طوابع
class Stamps {
  String? imageUrl;
  String? type;
  String? position;
  double? aspectRatio;
  int? priority;

  Stamps(
      {this.imageUrl,
      this.type,
      this.position,
      this.aspectRatio,
      this.priority});

  Stamps.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    type = json['type'];
    position = json['position'];
    aspectRatio = json['aspectRatio'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['type'] = type;
    data['position'] = position;
    data['aspectRatio'] = aspectRatio;
    data['priority'] = priority;
    return data;
  }
}

/// نصنيف المنتج او الباىع
class RatingScore {
  int? averageRating;
  int? totalCount;

  RatingScore({this.averageRating, this.totalCount});

  RatingScore.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageRating'] = averageRating;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Headers {
  String? tysidecarcachable;

  Headers({this.tysidecarcachable});

  Headers.fromJson(Map<String, dynamic> json) {
    tysidecarcachable = json['tysidecarcachable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tysidecarcachable'] = tysidecarcachable;
    return data;
  }
}

class SelectedFilters {
  String? id;
  String? filterField;
  String? type;
  bool? isVisible;
  String? text;
  String? beautifiedName;
  String? url;
  int? source;

  SelectedFilters(
      {this.id,
      this.filterField,
      this.type,
      this.isVisible,
      this.text,
      this.beautifiedName,
      this.url,
      this.source});

  SelectedFilters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filterField = json['filterField'];
    type = json['type'];
    isVisible = json['isVisible'];
    text = json['text'];
    beautifiedName = json['beautifiedName'];
    url = json['url'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filterField'] = filterField;
    data['type'] = type;
    data['isVisible'] = isVisible;
    data['text'] = text;
    data['beautifiedName'] = beautifiedName;
    data['url'] = url;
    data['source'] = source;
    return data;
  }
}

class ResolvedQuery {
  List<Filters>? filters;
  String? searchKey;
  List<Filters>? alternateFilters;

  ResolvedQuery({this.filters, this.searchKey, this.alternateFilters});

  ResolvedQuery.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(Filters.fromJson(v));
      });
    }
    searchKey = json['searchKey'];
    if (json['alternateFilters'] != null) {
      alternateFilters = <Filters>[];
      json['alternateFilters'].forEach((v) {
        alternateFilters!.add(Filters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.map((v) => v.toJson()).toList();
    }
    data['searchKey'] = searchKey;
    if (alternateFilters != null) {
      data['alternateFilters'] =
          alternateFilters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  String? filterKey;
  String? filterType;
  String? type;
  String? filterField;
  List<String>? values;
  List<Filter>? filters;

  Filters(
      {this.filterKey,
      this.filterType,
      this.type,
      this.filterField,
      this.values,
      this.filters});

  Filters.fromJson(Map<String, dynamic> json) {
    filterKey = json['filterKey'];
    filterType = json['filterType'];
    type = json['type'];
    filterField = json['filterField'];
    values = json['values'].cast<String>();
    if (json['filters'] != null) {
      filters = <Filter>[];
      json['filters'].forEach((v) {
        filters!.add(Filter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filterKey'] = filterKey;
    data['filterType'] = filterType;
    data['type'] = type;
    data['filterField'] = filterField;
    data['values'] = values;
    if (filters != null) {
      data['filters'] = filters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///التصنيغات
class Aggregations {
  String? group;
  String? type;
  String? title;
  String? filterKey;
  int? order;
  int? totalCount;
  List<Values>? values;
  String? id;
  String? filterType;
  String? filterField;

  Aggregations(
      {this.group,
      this.type,
      this.title,
      this.filterKey,
      this.order,
      this.totalCount,
      this.values,
      this.id,
      this.filterType,
      this.filterField});

  Aggregations.fromJson(Map<String, dynamic> json) {
    group = json['group'];
    type = json['type'];
    title = json['title'];
    filterKey = json['filterKey'];
    order = json['order'];
    totalCount = json['totalCount'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
    id = json['id'];
    filterType = json['filterType'];
    filterField = json['filterField'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['group'] = group;
    data['type'] = type;
    data['title'] = title;
    data['filterKey'] = filterKey;
    data['order'] = order;
    data['totalCount'] = totalCount;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['filterType'] = filterType;
    data['filterField'] = filterField;
    return data;
  }
}

class Values {
  String? id;
  String? text;
  String? beautifiedName;
  int? count;
  bool? filtered;
  String? filterField;
  String? type;
  String? url;

  Values(
      {this.id,
      this.text,
      this.beautifiedName,
      this.count,
      this.filtered,
      this.filterField,
      this.type,
      this.url});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    beautifiedName = json['beautifiedName'];
    count = json['count'];
    filtered = json['filtered'];
    filterField = json['filterField'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['beautifiedName'] = beautifiedName;
    data['count'] = count;
    data['filtered'] = filtered;
    data['filterField'] = filterField;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

/// for ResolvedQuery class
class Filter {
  String? key;
  String? beautifiedName;
  String? name;

  Filter({this.key, this.beautifiedName, this.name});

  Filter.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    beautifiedName = json['beautifiedName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['beautifiedName'] = beautifiedName;
    data['name'] = name;

    return data;
  }
}
