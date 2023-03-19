class CourseModel {
  int? id;
  String? name;
  String? instructorName;
  String? videos;
  String? createdAt;
  String? updatedAt;

  CourseModel(
      {this.id,
      this.name,
      this.instructorName,
      this.videos,
      this.createdAt,
      this.updatedAt});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instructorName = json['instructor_name'];
    videos = json['videos'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
