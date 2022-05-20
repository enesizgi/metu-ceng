exports = async function(arg){
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var bookID = new BSON.ObjectId(arg.bookID);
  var book = await collection.findOne({_id: bookID});
  var ratings = book.ratings || {};
  ratings[context.user.id] = arg.rating;
  
  var readings = book.readings || [];
  var newReadings;
  if (readings.includes(context.user.id)) {
    newReadings = [...readings];
  } else {
    newReadings = [...readings, context.user.id];
  }
  
  var newBook = {...book, ratings, readings: newReadings};
  await collection.updateOne({_id: bookID}, {$set: {ratings: ratings, readings: newReadings}});
  
  // updating user read books
  // var userCollection = context.services.get("mongodb-atlas").db("data").collection("users");
  // var user = await userCollection.findOne({userID: context.user.id});
  // var readings = user.readings || [];
  // var newReadings = [...readings, arg.bookID];
  // await collection.updateOne();
  
  return newBook;
};