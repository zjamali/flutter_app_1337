// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.id,
    this.email,
    this.login,
    this.firstName,
    this.lastName,
    this.usualFirstName,
    this.url,
    this.phone,
    this.displayname,
    this.usualFullName,
    this.imageUrl,
    this.staff,
    this.correctionPoint,
    this.poolMonth,
    this.poolYear,
    this.location,
    this.wallet,
    this.anonymizeDate,
    this.groups,
    this.cursusUsers,
    this.projectsUsers,
    this.languagesUsers,
    this.achievements,
    this.titles,
    this.titlesUsers,
    this.partnerships,
    this.patroned,
    this.patroning,
    this.expertisesUsers,
    this.roles,
    this.campus,
    this.campusUsers,
  });

  int id;
  String email;
  String login;
  String firstName;
  String lastName;
  dynamic usualFirstName;
  String url;
  String phone;
  String displayname;
  String usualFullName;
  String imageUrl;
  bool staff;
  int correctionPoint;
  String poolMonth;
  String poolYear;
  String location;
  int wallet;
  DateTime anonymizeDate;
  List<dynamic> groups;
  List<CursusUser> cursusUsers;
  List<ProjectsUser> projectsUsers;
  List<LanguagesUser> languagesUsers;
  List<Achievement> achievements;
  List<dynamic> titles;
  List<dynamic> titlesUsers;
  List<dynamic> partnerships;
  List<dynamic> patroned;
  List<dynamic> patroning;
  List<dynamic> expertisesUsers;
  List<dynamic> roles;
  List<Campus> campus;
  List<CampusUser> campusUsers;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    email: json["email"],
    login: json["login"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    usualFirstName: json["usual_first_name"],
    url: json["url"],
    phone: json["phone"],
    displayname: json["displayname"],
    usualFullName: json["usual_full_name"],
    imageUrl: json["image_url"],
    staff: json["staff?"],
    correctionPoint: json["correction_point"],
    poolMonth: json["pool_month"],
    poolYear: json["pool_year"],
    location: json["location"],
    wallet: json["wallet"],
    anonymizeDate: DateTime.parse(json["anonymize_date"]),
    groups: List<dynamic>.from(json["groups"].map((x) => x)),
    cursusUsers: List<CursusUser>.from(json["cursus_users"].map((x) => CursusUser.fromJson(x))),
    projectsUsers: List<ProjectsUser>.from(json["projects_users"].map((x) => ProjectsUser.fromJson(x))),
    languagesUsers: List<LanguagesUser>.from(json["languages_users"].map((x) => LanguagesUser.fromJson(x))),
    achievements: List<Achievement>.from(json["achievements"].map((x) => Achievement.fromJson(x))),
    titles: List<dynamic>.from(json["titles"].map((x) => x)),
    titlesUsers: List<dynamic>.from(json["titles_users"].map((x) => x)),
    partnerships: List<dynamic>.from(json["partnerships"].map((x) => x)),
    patroned: List<dynamic>.from(json["patroned"].map((x) => x)),
    patroning: List<dynamic>.from(json["patroning"].map((x) => x)),
    expertisesUsers: List<dynamic>.from(json["expertises_users"].map((x) => x)),
    roles: List<dynamic>.from(json["roles"].map((x) => x)),
    campus: List<Campus>.from(json["campus"].map((x) => Campus.fromJson(x))),
    campusUsers: List<CampusUser>.from(json["campus_users"].map((x) => CampusUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "login": login,
    "first_name": firstName,
    "last_name": lastName,
    "usual_first_name": usualFirstName,
    "url": url,
    "phone": phone,
    "displayname": displayname,
    "usual_full_name": usualFullName,
    "image_url": imageUrl,
    "staff?": staff,
    "correction_point": correctionPoint,
    "pool_month": poolMonth,
    "pool_year": poolYear,
    "location": location,
    "wallet": wallet,
    "anonymize_date": anonymizeDate.toIso8601String(),
    "groups": List<dynamic>.from(groups.map((x) => x)),
    "cursus_users": List<dynamic>.from(cursusUsers.map((x) => x.toJson())),
    "projects_users": List<dynamic>.from(projectsUsers.map((x) => x.toJson())),
    "languages_users": List<dynamic>.from(languagesUsers.map((x) => x.toJson())),
    "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
    "titles": List<dynamic>.from(titles.map((x) => x)),
    "titles_users": List<dynamic>.from(titlesUsers.map((x) => x)),
    "partnerships": List<dynamic>.from(partnerships.map((x) => x)),
    "patroned": List<dynamic>.from(patroned.map((x) => x)),
    "patroning": List<dynamic>.from(patroning.map((x) => x)),
    "expertises_users": List<dynamic>.from(expertisesUsers.map((x) => x)),
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "campus": List<dynamic>.from(campus.map((x) => x.toJson())),
    "campus_users": List<dynamic>.from(campusUsers.map((x) => x.toJson())),
  };
}

class Achievement {
  Achievement({
    this.id,
    this.name,
    this.description,
    this.tier,
    this.kind,
    this.visible,
    this.image,
    this.nbrOfSuccess,
    this.usersUrl,
  });

  int id;
  String name;
  String description;
  String tier;
  String kind;
  bool visible;
  String image;
  int nbrOfSuccess;
  String usersUrl;

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tier: json["tier"],
    kind: json["kind"],
    visible: json["visible"],
    image: json["image"],
    nbrOfSuccess: json["nbr_of_success"] == null ? null : json["nbr_of_success"],
    usersUrl: json["users_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "tier": tier,
    "kind": kind,
    "visible": visible,
    "image": image,
    "nbr_of_success": nbrOfSuccess == null ? null : nbrOfSuccess,
    "users_url": usersUrl,
  };
}

class Campus {
  Campus({
    this.id,
    this.name,
    this.timeZone,
    this.language,
    this.usersCount,
    this.vogsphereId,
    this.country,
    this.address,
    this.zip,
    this.city,
    this.website,
    this.facebook,
    this.twitter,
    this.active,
    this.emailExtension,
  });

  int id;
  String name;
  String timeZone;
  Language language;
  int usersCount;
  int vogsphereId;
  String country;
  String address;
  String zip;
  String city;
  String website;
  String facebook;
  String twitter;
  bool active;
  String emailExtension;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
    id: json["id"],
    name: json["name"],
    timeZone: json["time_zone"],
    language: Language.fromJson(json["language"]),
    usersCount: json["users_count"],
    vogsphereId: json["vogsphere_id"],
    country: json["country"],
    address: json["address"],
    zip: json["zip"],
    city: json["city"],
    website: json["website"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    active: json["active"],
    emailExtension: json["email_extension"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "time_zone": timeZone,
    "language": language.toJson(),
    "users_count": usersCount,
    "vogsphere_id": vogsphereId,
    "country": country,
    "address": address,
    "zip": zip,
    "city": city,
    "website": website,
    "facebook": facebook,
    "twitter": twitter,
    "active": active,
    "email_extension": emailExtension,
  };
}

class Language {
  Language({
    this.id,
    this.name,
    this.identifier,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String identifier;
  DateTime createdAt;
  DateTime updatedAt;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    id: json["id"],
    name: json["name"],
    identifier: json["identifier"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "identifier": identifier,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class CampusUser {
  CampusUser({
    this.id,
    this.userId,
    this.campusId,
    this.isPrimary,
  });

  int id;
  int userId;
  int campusId;
  bool isPrimary;

  factory CampusUser.fromJson(Map<String, dynamic> json) => CampusUser(
    id: json["id"],
    userId: json["user_id"],
    campusId: json["campus_id"],
    isPrimary: json["is_primary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "campus_id": campusId,
    "is_primary": isPrimary,
  };
}

class CursusUser {
  CursusUser({
    this.grade,
    this.level,
    this.skills,
    this.blackholedAt,
    this.id,
    this.beginAt,
    this.endAt,
    this.cursusId,
    this.hasCoalition,
    this.user,
    this.cursus,
  });

  String grade;
  double level;
  List<Skill> skills;
  DateTime blackholedAt;
  int id;
  DateTime beginAt;
  DateTime endAt;
  int cursusId;
  bool hasCoalition;
  User user;
  Cursus cursus;

  factory CursusUser.fromJson(Map<String, dynamic> json) => CursusUser(
    grade: json["grade"] == null ? null : json["grade"],
    level: json["level"].toDouble(),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    blackholedAt: json["blackholed_at"] == null ? null : DateTime.parse(json["blackholed_at"]),
    id: json["id"],
    beginAt: DateTime.parse(json["begin_at"]),
    endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
    cursusId: json["cursus_id"],
    hasCoalition: json["has_coalition"],
    user: User.fromJson(json["user"]),
    cursus: Cursus.fromJson(json["cursus"]),
  );

  Map<String, dynamic> toJson() => {
    "grade": grade == null ? null : grade,
    "level": level,
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "blackholed_at": blackholedAt == null ? null : blackholedAt.toIso8601String(),
    "id": id,
    "begin_at": beginAt.toIso8601String(),
    "end_at": endAt == null ? null : endAt.toIso8601String(),
    "cursus_id": cursusId,
    "has_coalition": hasCoalition,
    "user": user.toJson(),
    "cursus": cursus.toJson(),
  };
}

class Cursus {
  Cursus({
    this.id,
    this.createdAt,
    this.name,
    this.slug,
    this.parentId,
  });

  int id;
  DateTime createdAt;
  String name;
  String slug;
  int parentId;

  factory Cursus.fromJson(Map<String, dynamic> json) => Cursus(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    name: json["name"],
    slug: json["slug"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "name": name,
    "slug": slug,
    "parent_id": parentId == null ? null : parentId,
  };
}

class Skill {
  Skill({
    this.id,
    this.name,
    this.level,
  });

  int id;
  String name;
  double level;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    name: json["name"],
    level: json["level"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "level": level,
  };
}

class User {
  User({
    this.id,
    this.login,
    this.url,
  });

  int id;
  String login;
  String url;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    login: json["login"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "url": url,
  };
}

class LanguagesUser {
  LanguagesUser({
    this.id,
    this.languageId,
    this.userId,
    this.position,
    this.createdAt,
  });

  int id;
  int languageId;
  int userId;
  int position;
  DateTime createdAt;

  factory LanguagesUser.fromJson(Map<String, dynamic> json) => LanguagesUser(
    id: json["id"],
    languageId: json["language_id"],
    userId: json["user_id"],
    position: json["position"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "language_id": languageId,
    "user_id": userId,
    "position": position,
    "created_at": createdAt.toIso8601String(),
  };
}

class ProjectsUser {
  ProjectsUser({
    this.id,
    this.occurrence,
    this.finalMark,
    this.status,
    this.validated,
    this.currentTeamId,
    this.project,
    this.cursusIds,
    this.markedAt,
    this.marked,
    this.retriableAt,
  });

  int id;
  int occurrence;
  int finalMark;
  Status status;
  bool validated;
  int currentTeamId;
  Cursus project;
  List<int> cursusIds;
  DateTime markedAt;
  bool marked;
  DateTime retriableAt;

  factory ProjectsUser.fromJson(Map<String, dynamic> json) => ProjectsUser(
    id: json["id"],
    occurrence: json["occurrence"],
    finalMark: json["final_mark"] == null ? null : json["final_mark"],
    status: statusValues.map[json["status"]],
    validated: json["validated?"] == null ? null : json["validated?"],
    currentTeamId: json["current_team_id"],
    project: Cursus.fromJson(json["project"]),
    cursusIds: List<int>.from(json["cursus_ids"].map((x) => x)),
    markedAt: json["marked_at"] == null ? null : DateTime.parse(json["marked_at"]),
    marked: json["marked"],
    retriableAt: json["retriable_at"] == null ? null : DateTime.parse(json["retriable_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "occurrence": occurrence,
    "final_mark": finalMark == null ? null : finalMark,
    "status": statusValues.reverse[status],
    "validated?": validated == null ? null : validated,
    "current_team_id": currentTeamId,
    "project": project.toJson(),
    "cursus_ids": List<dynamic>.from(cursusIds.map((x) => x)),
    "marked_at": markedAt == null ? null : markedAt.toIso8601String(),
    "marked": marked,
    "retriable_at": retriableAt == null ? null : retriableAt.toIso8601String(),
  };
}

enum Status { IN_PROGRESS, FINISHED }

final statusValues = EnumValues({
  "finished": Status.FINISHED,
  "in_progress": Status.IN_PROGRESS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
