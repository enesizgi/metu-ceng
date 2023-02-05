exports = async function(arg){
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var docs;
  if (arg.skip > 0) {
    if (arg.limit > 0) {
      docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } }).skip(arg.skip).limit(arg.limit);
    } else {
      docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } }).skip(arg.skip);
    }
  } else {
    if (arg.limit > 0) {
      docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } }).limit(arg.limit);
    } else {
      docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } });
    }
  }
  return docs;
};