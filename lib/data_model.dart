class DataModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final dynamic promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final dynamic description;
  final dynamic altDescription;
  final Urls? urls;
  final Links? links;
  final List<dynamic>? categories;
  final int? likes;
  final bool? likedByUser;
  final List<dynamic>? currentUserCollections;
  final Sponsorship? sponsorship;
  final User? user;

  DataModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.user,
  });

  DataModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      promotedAt = json['promoted_at'],
      width = json['width'] as int?,
      height = json['height'] as int?,
      color = json['color'] as String?,
      blurHash = json['blur_hash'] as String?,
      description = json['description'],
      altDescription = json['alt_description'],
      urls = (json['urls'] as Map<String,dynamic>?) != null ? Urls.fromJson(json['urls'] as Map<String,dynamic>) : null,
      links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
      categories = json['categories'] as List?,
      likes = json['likes'] as int?,
      likedByUser = json['liked_by_user'] as bool?,
      currentUserCollections = json['current_user_collections'] as List?,
      sponsorship = (json['sponsorship'] as Map<String,dynamic>?) != null ? Sponsorship.fromJson(json['sponsorship'] as Map<String,dynamic>) : null,
      user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'promoted_at' : promotedAt,
    'width' : width,
    'height' : height,
    'color' : color,
    'blur_hash' : blurHash,
    'description' : description,
    'alt_description' : altDescription,
    'urls' : urls?.toJson(),
    'links' : links?.toJson(),
    'categories' : categories,
    'likes' : likes,
    'liked_by_user' : likedByUser,
    'current_user_collections' : currentUserCollections,
    'sponsorship' : sponsorship?.toJson(),
    'user' : user?.toJson()
  };
}

class Urls {
  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;
  final String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  Urls.fromJson(Map<String, dynamic> json)
    : raw = json['raw'] as String?,
      full = json['full'] as String?,
      regular = json['regular'] as String?,
      small = json['small'] as String?,
      thumb = json['thumb'] as String?,
      smallS3 = json['small_s3'] as String?;

  Map<String, dynamic> toJson() => {
    'raw' : raw,
    'full' : full,
    'regular' : regular,
    'small' : small,
    'thumb' : thumb,
    'small_s3' : smallS3
  };
}

class Links {
  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  Links({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  Links.fromJson(Map<String, dynamic> json)
    : self = json['self'] as String?,
      html = json['html'] as String?,
      download = json['download'] as String?,
      downloadLocation = json['download_location'] as String?;

  Map<String, dynamic> toJson() => {
    'self' : self,
    'html' : html,
    'download' : download,
    'download_location' : downloadLocation
  };
}

class Sponsorship {
  final List<String>? impressionUrls;
  final String? tagline;
  final String? taglineUrl;
  final Sponsor? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  Sponsorship.fromJson(Map<String, dynamic> json)
    : impressionUrls = (json['impression_urls'] as List?)?.map((dynamic e) => e as String).toList(),
      tagline = json['tagline'] as String?,
      taglineUrl = json['tagline_url'] as String?,
      sponsor = (json['sponsor'] as Map<String,dynamic>?) != null ? Sponsor.fromJson(json['sponsor'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'impression_urls' : impressionUrls,
    'tagline' : tagline,
    'tagline_url' : taglineUrl,
    'sponsor' : sponsor?.toJson()
  };
}

class Sponsor {
  final String? id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final dynamic lastName;
  final dynamic twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final dynamic location;
  final Links? links;
  final ProfileImage? profileImage;
  final dynamic instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;
  final Social? social;

  Sponsor({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  Sponsor.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?,
      updatedAt = json['updated_at'] as String?,
      username = json['username'] as String?,
      name = json['name'] as String?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'],
      twitterUsername = json['twitter_username'],
      portfolioUrl = json['portfolio_url'] as String?,
      bio = json['bio'] as String?,
      location = json['location'],
      links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
      profileImage = (json['profile_image'] as Map<String,dynamic>?) != null ? ProfileImage.fromJson(json['profile_image'] as Map<String,dynamic>) : null,
      instagramUsername = json['instagram_username'],
      totalCollections = json['total_collections'] as int?,
      totalLikes = json['total_likes'] as int?,
      totalPhotos = json['total_photos'] as int?,
      acceptedTos = json['accepted_tos'] as bool?,
      forHire = json['for_hire'] as bool?,
      social = (json['social'] as Map<String,dynamic>?) != null ? Social.fromJson(json['social'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'updated_at' : updatedAt,
    'username' : username,
    'name' : name,
    'first_name' : firstName,
    'last_name' : lastName,
    'twitter_username' : twitterUsername,
    'portfolio_url' : portfolioUrl,
    'bio' : bio,
    'location' : location,
    'links' : links?.toJson(),
    'profile_image' : profileImage?.toJson(),
    'instagram_username' : instagramUsername,
    'total_collections' : totalCollections,
    'total_likes' : totalLikes,
    'total_photos' : totalPhotos,
    'accepted_tos' : acceptedTos,
    'for_hire' : forHire,
    'social' : social?.toJson()
  };
}

class ProfileImage {
  final String? small;
  final String? medium;
  final String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  ProfileImage.fromJson(Map<String, dynamic> json)
    : small = json['small'] as String?,
      medium = json['medium'] as String?,
      large = json['large'] as String?;

  Map<String, dynamic> toJson() => {
    'small' : small,
    'medium' : medium,
    'large' : large
  };
}

class Social {
  final dynamic instagramUsername;
  final String? portfolioUrl;
  final dynamic twitterUsername;
  final dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  Social.fromJson(Map<String, dynamic> json)
    : instagramUsername = json['instagram_username'],
      portfolioUrl = json['portfolio_url'] as String?,
      twitterUsername = json['twitter_username'],
      paypalEmail = json['paypal_email'];

  Map<String, dynamic> toJson() => {
    'instagram_username' : instagramUsername,
    'portfolio_url' : portfolioUrl,
    'twitter_username' : twitterUsername,
    'paypal_email' : paypalEmail
  };
}



class User {
  final String? id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final dynamic lastName;
  final dynamic twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final dynamic location;
  final Links? links;
  final ProfileImage? profileImage;
  final dynamic instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;
  final Social? social;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String?,
      updatedAt = json['updated_at'] as String?,
      username = json['username'] as String?,
      name = json['name'] as String?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'],
      twitterUsername = json['twitter_username'],
      portfolioUrl = json['portfolio_url'] as String?,
      bio = json['bio'] as String?,
      location = json['location'],
      links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
      profileImage = (json['profile_image'] as Map<String,dynamic>?) != null ? ProfileImage.fromJson(json['profile_image'] as Map<String,dynamic>) : null,
      instagramUsername = json['instagram_username'],
      totalCollections = json['total_collections'] as int?,
      totalLikes = json['total_likes'] as int?,
      totalPhotos = json['total_photos'] as int?,
      acceptedTos = json['accepted_tos'] as bool?,
      forHire = json['for_hire'] as bool?,
      social = (json['social'] as Map<String,dynamic>?) != null ? Social.fromJson(json['social'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'updated_at' : updatedAt,
    'username' : username,
    'name' : name,
    'first_name' : firstName,
    'last_name' : lastName,
    'twitter_username' : twitterUsername,
    'portfolio_url' : portfolioUrl,
    'bio' : bio,
    'location' : location,
    'links' : links?.toJson(),
    'profile_image' : profileImage?.toJson(),
    'instagram_username' : instagramUsername,
    'total_collections' : totalCollections,
    'total_likes' : totalLikes,
    'total_photos' : totalPhotos,
    'accepted_tos' : acceptedTos,
    'for_hire' : forHire,
    'social' : social?.toJson()
  };
}

