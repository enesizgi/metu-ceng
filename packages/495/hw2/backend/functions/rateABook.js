exports = async function(){
  var arg = {bookID: '62864bc90dc76f568f17ed2d', rating: 5};
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var bookID = new BSON.ObjectId(arg.bookID);
  var book = await collection.findOne({_id: bookID});
  var ratings = book.ratings || {};
  
  ratings["6286848dd0df270d4c3794d6"] = arg.rating;
  var newBook = {...book, ratings};
  // return newBook;
  
  await collection.updateOne({_id: bookID}, {$set: {ratings: ratings}});
  return newBook;
  
};