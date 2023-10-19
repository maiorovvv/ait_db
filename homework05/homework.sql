//Вывести имена юзеров не из France
db.users.find(
    { country: { $ne: 'France' } },
    {fullname: 1, _id: 0}
)

//Добавить несколько реакций на треки
db.tracks.updateMany(
    { _id: {$gte: 1, $lte:3 } }, // filter
    { $set: { reaction: 5 } } // action
)

//Вывести названия треков продолжительностью от 1 до 10 мин
db.tracks.find(
    { duration_secs: { $gte: 1 * 60, $lte: 10 * 60 } },
    { title: 1, _id: 0 }
)
//Вывести треки юзера 4  //? тут не понятно у юзера вроде нет треков, треки есть только у авторов
db.tracks.findOne(
    { _id: 4 },
    { title: 1, duration_secs: 1, _id: 0 }
)

//С помощью инструмента онлайн-проектирования описать БД music (юзеры, треки, реакции, плейлисты)

https://dbdiagram.io/d/music_db-6530357cffbf5169f0f8c4e7
Table users{
user_id integer
username varchar(128)
email varchar(128) 
create_date timestamp
}

Table tracks{
track_id integer
title varchar(256)
artist varchar(128) 
album varchar(128)
duration integer
genre varchar(128)
}

Table reactions {
reaction_id integer
user_id integer
track_id integer
type_reaction varchar(128)
create_date timestamp
}

Table playlists{
playlist_id integer
user_id integer
track_id integer
name_list varchar(128)
description varchar(128) 
create_date timestamp
}

Ref: "users"."user_id" < "playlists"."user_id"

Ref: "users"."user_id" < "reactions"."user_id"

Ref: "tracks"."track_id" < "playlists"."track_id"

Ref: "tracks"."track_id" < "reactions"."track_id"