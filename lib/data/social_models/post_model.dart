class PostModel{
  late String name;
  late String uId;
  late String image;
  late String dateTime;
  late String text;
  late String postImage;


  PostModel({
    required this.name,
    this.text='',
    this.dateTime='',
    this.postImage='',
    this.uId='',
    this.image='https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=740&t=st=1675466919~exp=1675467519~hmac=6be1881e4980926154b3c3bd0d7890facd0e0a1a99751a603e37d820745e0b06',
  });

  PostModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    uId=json['uId'];
    image=json['image'];
    dateTime=json['dateTime'];
    postImage=json['postImage'];
    text=json['text'];
  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'uId':uId,
      'image':image,
      'text':text,
      'dateTime':dateTime,
      'postImage':postImage,

    };
  }
}