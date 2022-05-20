exports = async function(arg){
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var docs;
  if (arg.skip > 0) {
    if (arg.limit > 0) {
      docs = await collection.find({ favoritedBy: context.user.id }).skip(arg.skip).limit(arg.limit);
    } else {
      docs = await collection.find({ favoritedBy: context.user.id }).skip(arg.skip);
    }
  } else {
    if (arg.limit > 0) {
      docs = await collection.find({ favoritedBy: context.user.id }).limit(arg.limit);
    } else {
      docs = await collection.find({ favoritedBy: context.user.id });
    }
  }
  return docs;
};