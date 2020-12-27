// To parse this JSON data, do
//
//     final usersList = usersListFromJson(jsonString);

import 'dart:convert';

List<UsersList> usersListFromJson(String str) => List<UsersList>.from(json.decode(str).map((x) => UsersList.fromJson(x)));

String usersListToJson(List<UsersList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersList {
  UsersList({
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

  Grade grade;
  double level;
  List<Skill> skills;
  DateTime blackholedAt;
  int id;
  DateTime beginAt;
  dynamic endAt;
  int cursusId;
  bool hasCoalition;
  User user;
  Cursus cursus;

  factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
    grade: json["grade"] == null ? null : gradeValues.map[json["grade"]],
    level: json["level"].toDouble(),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    blackholedAt: json["blackholed_at"] == null ? null : DateTime.parse(json["blackholed_at"]),
    id: json["id"],
    beginAt: DateTime.parse(json["begin_at"]),
    endAt: json["end_at"],
    cursusId: json["cursus_id"],
    hasCoalition: json["has_coalition"],
    user: User.fromJson(json["user"]),
    cursus: Cursus.fromJson(json["cursus"]),
  );

  Map<String, dynamic> toJson() => {
    "grade": grade == null ? null : gradeValues.reverse[grade],
    "level": level,
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "blackholed_at": blackholedAt == null ? null : blackholedAt.toIso8601String(),
    "id": id,
    "begin_at": beginAt.toIso8601String(),
    "end_at": endAt,
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
  });

  int id;
  DateTime createdAt;
  SlugEnum name;
  SlugEnum slug;

  factory Cursus.fromJson(Map<String, dynamic> json) => Cursus(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    name: slugEnumValues.map[json["name"]],
    slug: slugEnumValues.map[json["slug"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "name": slugEnumValues.reverse[name],
    "slug": slugEnumValues.reverse[slug],
  };
}

enum SlugEnum { THE_42_CURSUS }

final slugEnumValues = EnumValues({
  "42cursus": SlugEnum.THE_42_CURSUS
});

enum Grade { MEMBER, LEARNER }

final gradeValues = EnumValues({
  "Learner": Grade.LEARNER,
  "Member": Grade.MEMBER
});

class Skill {
  Skill({
    this.id,
    this.name,
    this.level,
  });

  int id;
  SkillName name;
  double level;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    name: skillNameValues.map[json["name"]],
    level: json["level"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": skillNameValues.reverse[name],
    "level": level,
  };
}

enum SkillName { COMPANY_EXPERIENCE, GROUP_INTERPERSONAL, WEB, ALGORITHMS_AI, DB_DATA, UNIX, IMPERATIVE_PROGRAMMING, RIGOR, NETWORK_SYSTEM_ADMINISTRATION, TECHNOLOGY_INTEGRATION, SECURITY, OBJECT_ORIENTED_PROGRAMMING, ADAPTATION_CREATIVITY, GRAPHICS, ORGANIZATION, FUNCTIONAL_PROGRAMMING }

final skillNameValues = EnumValues({
  "Adaptation & creativity": SkillName.ADAPTATION_CREATIVITY,
  "Algorithms & AI": SkillName.ALGORITHMS_AI,
  "Company experience": SkillName.COMPANY_EXPERIENCE,
  "DB & Data": SkillName.DB_DATA,
  "Functional programming": SkillName.FUNCTIONAL_PROGRAMMING,
  "Graphics": SkillName.GRAPHICS,
  "Group & interpersonal": SkillName.GROUP_INTERPERSONAL,
  "Imperative programming": SkillName.IMPERATIVE_PROGRAMMING,
  "Network & system administration": SkillName.NETWORK_SYSTEM_ADMINISTRATION,
  "Object-oriented programming": SkillName.OBJECT_ORIENTED_PROGRAMMING,
  "Organization": SkillName.ORGANIZATION,
  "Rigor": SkillName.RIGOR,
  "Security": SkillName.SECURITY,
  "Technology integration": SkillName.TECHNOLOGY_INTEGRATION,
  "Unix": SkillName.UNIX,
  "Web": SkillName.WEB
});

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
