import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/API/api.dart';
import 'package:youtube_clone/model/subscription.dart';


class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  _listSubscriptions(){
    Future <List<Subscription>> subscriptions;
    Api api = Api();
    subscriptions = api.subs();
    return subscriptions;

  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Subscription>>(
      future: _listSubscriptions(),
      builder: (contex, snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){
                    List<Subscription> subscriptions = snapshot.data;
                    Subscription subscription = subscriptions[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(subscription.thumbnails)
                              )
                          ),
                        ),
                        ListTile(
                          title: Text(subscription.title),
                          subtitle: Text(subscription.description),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider(height: 2, color: Colors.grey);
                  },
                  itemCount: snapshot.data.length
              );


            }else{
              return Center(
                child: Text("Erro ao carregar pagina "+ snapshot.error.toString()),
              );
            }
            break;

        }

      },
    );
  }
}