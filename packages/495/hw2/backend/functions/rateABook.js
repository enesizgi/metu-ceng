exports = async function(arg){
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var bookID = new BSON.ObjectId(arg.bookID);
  var book = await collection.findOne({_id: bookID});
  var ratings = book.ratings || {};
  ratings[context.user.id] = arg.rating;
  
  var newBook = {...book, ratings};
  await collection.updateOne({_id: bookID}, {$set: {ratings: ratings}});
  return newBook;
};