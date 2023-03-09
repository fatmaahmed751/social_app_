import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const BouncingScrollPhysics() ,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              margin: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: const [
                  Image(
                    image: NetworkImage(
                     'https://img.freepik.com/free-photo/indoor-shot-positive-bearded-male-casual-red-t-shirt-points-with-index-finger-aside_273609-16274.jpg?w=740&t=st=1676455489~exp=1676456089~hmac=194b92bce1f23e043af42fa8c0056a7bc52d540ae8a894f583622fa095cc06c4'),
                   // fit: BoxFit.cover,
                    height: 230.0,

                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'communicate with friends',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         ListView.separated(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemBuilder:(context,index)=>buildPostItem(context) ,
         separatorBuilder: (context,index)=> SizedBox(height: 8.0,),
         itemCount: 10,),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
  Widget buildPostItem(context)=> Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:  [
                        Text(
                          'Abdullah Ahmed',
                          style: TextStyle(
                              height: 1.4,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.check_circle_outline_sharp,
                            color: Colors.white,

                            size: 17.0,
                          ),
                        ),
                      ],
                    ),
                     Text(
                      '20/2/1990',
                      style: TextStyle(
                          height: 1.4, fontWeight: FontWeight.w300,
                      color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: 19.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\''
                's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.,',
            style: TextStyle(
                height: 1.0,
                fontWeight: FontWeight.w400,
                fontSize: 12.0),
          ),
          Container(
            width: double.infinity,
            height: 30.0,
            //color: Colors.orange,
            child: Wrap(
              // alignment: WrapAlignment.start,
              // direction: Axis.horizontal,
              children: [
                MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  minWidth: 1.0,
                  child: const Text(
                    '#software  ',
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: Colors.blue, fontSize: 10.0),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  minWidth: 1.0,
                  child: const Text(
                    '#software_development ',
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: Colors.blue, fontSize: 10.0),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  minWidth: 1.0,
                  child: const Text(
                    '#software',
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: Colors.blue, fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
          const Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 20.0,
            child: Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/indoor-shot-positive-bearded-male-casual-red-t-shirt-points-with-index-finger-aside_273609-16274.jpg?w=740&t=st=1676455489~exp=1676456089~hmac=194b92bce1f23e043af42fa8c0056a7bc52d540ae8a894f583622fa095cc06c4'),
              fit: BoxFit.cover,
              height: 150.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.favorite_border,
                            size: 13.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '120',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.messenger_outline_sharp,
                            size: 13.0,
                            color: Colors.amber,
                          ),
                          Text(
                            ' 120 comments',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: InkWell(
              onTap:(){},
              child: Row(
                children:  [
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675468830~exp=1675469430~hmac=e0013d2202071e7b5b433488e4b03272c13736aed7812adf7ab7d0289fe213c4'),
                  ),
                  const SizedBox(
                    width: 9.0,
                  ),
                  const Text(
                    'Write a comment ...',
                    style: TextStyle(
                        height: 1.0,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                  SizedBox(width: 140,),
                  InkWell(
                    child: Row(
                      children:  const [
                        Icon(
                          Icons.favorite_border,
                          size: 13.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
