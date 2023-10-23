// 1. Вывести названия треков без тега test
db.tracks.find(
  {
    tags: { $nin: ["test"] },
  },
  { title: 1, _id: 0 }
);
// 2. Вывести ко-во треков с продолжительностью до одного часа с тегом new
db.tracks.countDocuments({
  tags: "new",
  duration_secs: { $lte: 60 * 60 },
});
// 3. Увеличить баланс заблокированных юзеров не из Germany на 5%
db.users.updateMany(
  {
    is_blocked: { $ne: false },
    country: { $ne: "Germany" },
  },
  {
    $mul: { balance: 1.05 },
  }
);
// 4. Добавить всем трекам теги fresh и popular
db.tracks.updateMany(
  {},
  {
    $push: { tags: { $each: ["fresh", "popular"] } },
  }
);

// 5. С помощью инструмента онлайн-проектирования описать схему БД чат онлайн-поддержки
https://dbdiagram.io/d/techsupport_chat-65325afaffbf5169f019ccae