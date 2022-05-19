exports = async function(arg){
  var bookID = new BSON.ObjectId(arg.bookID);
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var book = await collection.findOne({ _id: bookID });
  var favorites = book.favoritedBy || [];
  var isFavorite = favorites.includes(context.user.id);

  if (isFavorite) {
    return book;
  }

  var newFavorites = [...favorites, context.user.id];
  var newBook = await collection.updateOne({_id: bookID}, {$set: {favoritedBy: newFavorites}})
  return newBook;
};