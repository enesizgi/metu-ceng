exports = async function(arg){
  var bookID = new BSON.ObjectId(arg.bookID);
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var book = await collection.findOne({ _id: bookID });
  var favorites = book.favoritedBy || [];
  var newFavorites = favorites.filter(i => i !== context.user.id);

  var favTimestamps = book.favTimestamps || {};
  delete favTimestamps[context.user.id];

  var newBook = await collection.updateOne({_id: bookID}, {$set: {favoritedBy: newFavorites, favTimestamps: favTimestamps}});
  return newBook;
};