class CompanyResponse {
  int? currentPageNumber;
  int? numItemsPerPage;
  List<Items>? items;

  CompanyResponse({currentPageNumber, numItemsPerPage, items});

  CompanyResponse.fromJson(Map<String, dynamic> json) {
    currentPageNumber = json['current_page_number'];
    numItemsPerPage = json['num_items_per_page'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page_number'] = currentPageNumber;
    data['num_items_per_page'] = numItemsPerPage;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? status;
  String? name;
  String? shortDescription;
  String? country;
  String? city;
  String? description;
  String? currency;
  List<String>? keywords;
  Logo? logo;
  Logo? backgroundImage;
  Setting? setting;
  List<Images>? images;
  String? facebookLink;
  String? instagramLink;
  String? youtubeUrl;
  double? balance;
  String? createdAt;
  String? updatedAt;
  num? cashbackPercent;
  List<Locations>? locations;
  bool? bookmarked;
  double? rating;

  Items(
      {id,
        status,
        name,
        slogan,
        shortDescription,
        country,
        city,
        zipCode,
        description,
        currency,
        keywords,
        logo,
        backgroundImage,
        setting,
        images,
        facebookLink,
        instagramLink,
        video,
        youtubeUrl,
        balance,
        distance,
        createdAt,
        updatedAt,
        cashbackPercent,
        locations,
        bookmarked,
        rating});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    shortDescription = json['short_description'];
    country = json['country'];
    city = json['city'];
    description = json['description'];
    currency = json['currency'];
    keywords = json['keywords'].cast<String>();
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    backgroundImage = json['background_image'] != null
        ? Logo.fromJson(json['background_image'])
        : null;
    setting =
    json['setting'] != null ? Setting.fromJson(json['setting']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    facebookLink = json['facebook_link'];
    instagramLink = json['instagram_link'];
    youtubeUrl = json['youtube_url'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cashbackPercent = json['cashback_percent'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    bookmarked = json['bookmarked'];
    rating = double.parse(json['rating'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['country'] = country;
    data['city'] = city;
    data['description'] = description;
    data['currency'] = currency;
    data['keywords'] = keywords;
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (backgroundImage != null) {
      data['background_image'] = backgroundImage!.toJson();
    }
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['facebook_link'] = facebookLink;
    data['instagram_link'] = instagramLink;
    data['youtube_url'] = youtubeUrl;
    data['balance'] = balance;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cashback_percent'] = cashbackPercent;
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    data['bookmarked'] = bookmarked;
    data['rating'] = rating;
    return data;
  }
}

class Logo {
  String? originalName;
  String? extension;
  String? mimeType;
  String? createdAt;
  String? updatedAt;
  Urls? urls;

  Logo(
      {originalName,
        extension,
        mimeType,
        createdAt,
        updatedAt,
        urls});

  Logo.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    extension = json['extension'];
    mimeType = json['mime_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original_name'] = originalName;
    data['extension'] = extension;
    data['mime_type'] = mimeType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    return data;
  }
}

class Urls {
  String? original;
  String? s100x;
  String? s200x;
  String? s400x;
  String? s200x200;
  String? s400x515;
  String? s600x;

  Urls(
      {original,
        s100x,
        s200x,
        s400x,
        s200x200,
        s400x515,
        s600x});

  Urls.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    s100x = json['100x_'];
    s200x = json['200x_'];
    s400x = json['400x_'];
    s200x200 = json['200x200'];
    s400x515 = json['400x515'];
    s600x = json['600x_'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original'] = original;
    data['100x_'] = s100x;
    data['200x_'] = s200x;
    data['400x_'] = s400x;
    data['200x200'] = s200x200;
    data['400x515'] = s400x515;
    data['600x_'] = s600x;
    return data;
  }
}

class Setting {
  int? id;
  String? language;
  String? timezone;
  String? methodDiscount;
  bool? enableStatusAuto;
  double? pointPercentage;
  String? bonusTerms;
  bool? enableReferral;
  double? referralPercent;
  bool? welcome;
  double? welcomePoint;
  String? welcomeText;
  bool? recommendation;
  double? recommendPoint;
  int? recommendLimit;
  bool? rewardCashier;
  bool? birthday;
  int? birthdayAt;
  bool? acceptOrder;
  bool? bonusPhoneNumber;
  bool? enableCheck;
  bool? limitInvoice;
  double? invoiceSum;
  bool? pointLife;
  PointLifeTime? pointLifeTime;
  bool? deadlineScore;
  bool? trackOperation;
  List<Status>? status;
  bool? delivery;
  bool? booking;
  String? createdAt;
  String? updatedAt;

  Setting(
      {id,
        language,
        timezone,
        methodDiscount,
        enableStatusAuto,
        pointPercentage,
        bonusTerms,
        enableReferral,
        referralPercent,
        welcome,
        welcomePoint,
        welcomeText,
        recommendation,
        recommendPoint,
        recommendLimit,
        rewardCashier,
        rewardCashierPercent,
        birthday,
        birthdayPoint,
        birthdayAt,
        birthdayMessage,
        acceptOrder,
        bonusPhoneNumber,
        enableCheck,
        limitInvoice,
        invoiceSum,
        pointLife,
        pointLifeTime,
        deadlineScore,
        deadlineScoreTime,
        trackOperation,
        operationCount,
        status,
        bonusPercent,
        delivery,
        booking,
        createdAt,
        updatedAt});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
    timezone = json['timezone'];
    methodDiscount = json['method_discount'];
    enableStatusAuto = json['enable_status_auto'];
    pointPercentage = json['point_percentage'];
    bonusTerms = json['bonus_terms'];
    enableReferral = json['enable_referral'];
    referralPercent = json['referral_percent'];
    welcome = json['welcome'];
    welcomePoint = json['welcome_point'];
    welcomeText = json['welcome_text'];
    recommendation = json['recommendation'];
    recommendPoint = json['recommend_point'];
    recommendLimit = json['recommend_limit'];
    rewardCashier = json['reward_cashier'];
    birthday = json['birthday'];
    birthdayAt = json['birthday_at'];
    acceptOrder = json['accept_order'];
    bonusPhoneNumber = json['bonus_phone_number'];
    enableCheck = json['enable_check'];
    limitInvoice = json['limit_invoice'];
    invoiceSum = json['invoice_sum'];
    pointLife = json['point_life'];
    pointLifeTime = json['point_life_time'] != null
        ? PointLifeTime.fromJson(json['point_life_time'])
        : null;
    deadlineScore = json['deadline_score'];
    trackOperation = json['track_operation'];
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(Status.fromJson(v));
      });
    }
    delivery = json['delivery'];
    booking = json['booking'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language'] = language;
    data['timezone'] = timezone;
    data['method_discount'] = methodDiscount;
    data['enable_status_auto'] = enableStatusAuto;
    data['point_percentage'] = pointPercentage;
    data['bonus_terms'] = bonusTerms;
    data['enable_referral'] = enableReferral;
    data['referral_percent'] = referralPercent;
    data['welcome'] = welcome;
    data['welcome_point'] = welcomePoint;
    data['welcome_text'] = welcomeText;
    data['recommendation'] = recommendation;
    data['recommend_point'] = recommendPoint;
    data['recommend_limit'] = recommendLimit;
    data['reward_cashier'] = rewardCashier;
    data['birthday'] = birthday;
    data['birthday_at'] = birthdayAt;
    data['accept_order'] = acceptOrder;
    data['bonus_phone_number'] = bonusPhoneNumber;
    data['enable_check'] = enableCheck;
    data['limit_invoice'] = limitInvoice;
    data['invoice_sum'] = invoiceSum;
    data['point_life'] = pointLife;
    if (pointLifeTime != null) {
      data['point_life_time'] = pointLifeTime!.toJson();
    }
    data['deadline_score'] = deadlineScore;
    data['track_operation'] = trackOperation;
    if (status != null) {
      data['status'] = status!.map((v) => v.toJson()).toList();
    }
    data['delivery'] = delivery;
    data['booking'] = booking;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PointLifeTime {
  String? time;
  bool? renew;

  PointLifeTime({time, renew});

  PointLifeTime.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    renew = json['renew'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['renew'] = renew;
    return data;
  }
}

class Status {
  int? id;
  int? company;
  String? name;
  double? percent;
  double? totalAmount;
  bool? system;
  String? createdAt;
  String? updatedAt;

  Status(
      {id,
        company,
        name,
        percent,
        totalAmount,
        system,
        createdAt,
        updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    percent = json['percent'];
    totalAmount = json['total_amount'];
    system = json['system'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['name'] = name;
    data['percent'] = percent;
    data['total_amount'] = totalAmount;
    data['system'] = system;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Locations {
  int? id;
  String? name;
  Address? address;
  String? phoneNumber;
  bool? aroundClock;
  List<WorkingDays>? workingDays;

  Locations(
      {id,
        name,
        address,
        phoneNumber,
        aroundClock,
        workingDays});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    phoneNumber = json['phone_number'];
    aroundClock = json['around_clock'];
    if (json['working_days'] != null) {
      workingDays = <WorkingDays>[];
      json['working_days'].forEach((v) {
        workingDays!.add(WorkingDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone_number'] = phoneNumber;
    data['around_clock'] = aroundClock;
    if (workingDays != null) {
      data['working_days'] = workingDays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? addressLine;
  double? latitude;
  double? longitude;

  Address(
      {id,
        addressLine,
        addressLine2,
        latitude,
        longitude,
        phoneNumber,
        distance});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressLine = json['address_line'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address_line'] = addressLine;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class WorkingDays {
  String? to;
  String? from;
  bool? dayOff;
  String? launchTo;
  String? launchFrom;
  bool? withoutLaunch;

  WorkingDays(
      {to,
        from,
        dayOff,
        weekDay,
        launchTo,
        launchFrom,
        withoutLaunch});

  WorkingDays.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
    dayOff = json['dayOff'];
    launchTo = json['launchTo'];
    launchFrom = json['launchFrom'];
    withoutLaunch = json['withoutLaunch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['from'] = from;
    data['dayOff'] = dayOff;
    data['launchTo'] = launchTo;
    data['launchFrom'] = launchFrom;
    data['withoutLaunch'] = withoutLaunch;
    return data;
  }
}

class Images {
  String? originalName;
  String? extension;
  String? mimeType;
  String? createdAt;
  String? updatedAt;
  Urls? urls;

  Images(
      {originalName,
        extension,
        mimeType,
        createdAt,
        updatedAt,
        urls});

  Images.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    extension = json['extension'];
    mimeType = json['mime_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['original_name'] = originalName;
    data['extension'] = extension;
    data['mime_type'] = mimeType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    return data;
  }
}