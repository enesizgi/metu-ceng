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
  
  return newBook;
};