exports = async function(arg){
  var collection = context.services.get("mongodb-atlas").db("data").collection("books");
  var docs;
  // if (arg.skip > 0) {
  //   if (arg.limit > 0) {
  //     docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } }).skip(arg.skip).limit(arg.limit);
  //   } else {
  //     docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } }).skip(arg.skip);
  //   }
  // } else {
  //   if (arg.limit > 0) {
  //     docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } }).limit(arg.limit);
  //   } else {
  //     docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } });
  //   }
  // }

  docs = await collection.find({ [`reviews.${context.user.id}`]: { $exists: true } });

  var favDocs = docs.filter(doc => doc?.favoritedBy?.includes(context.user.id)).sort((a, b) => {
    var x = a?.favTimestamps?.[context.user.id];
    var y = b?.favTimestamps?.[context.user.id];
    return y - x;
  });

  var reviewDocs = docs.filter(doc => !favDocs.find(i => i._id === doc._id)).sort((a, b) => {
    var x = a?.ratings?.[context.user.id];
    var y = b?.ratings?.[context.user.id];
    return y - x;
  });

  var newDocs = [...favDocs, ...reviewDocs].slice(arg.skip, arg.skip + arg.limit);
  return newDocs;

  // return docs;
};