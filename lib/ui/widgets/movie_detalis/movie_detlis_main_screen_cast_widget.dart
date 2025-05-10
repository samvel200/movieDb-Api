import 'package:flutter/material.dart';
import 'package:moviedb/resources/resources.dart';

class MovieDetlisMainScreenCastWidget extends StatelessWidget {
  const MovieDetlisMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Актёрский состав сериала',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 300,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 20,
                itemExtent: 120,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                    color:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2)
                        )
                      ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Image(image: AssetImage(AppImages.nkar1)),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('Хироси Камия', maxLines: 1,),
                            SizedBox(height: 7,),
                            Text('(voice), Mephisto Pheles',maxLines: 4,),
                            SizedBox(height: 7,),
                            Text('77 эпизодов', maxLines: 1,)
                            ],
                           ),
                         )
                         
                        ],
                      ),
                    ),
                  )
                );
              }),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton(
              onPressed: (){},
               child: Text('Полный актёрский и съёмочный состав'),
               ),
          )
        ],
      ),
      );
  }
}