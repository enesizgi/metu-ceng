exports = async function(arg){
    var collection = context.services.get("mongodb-atlas").db("data").collection(arg.collection);
    var docs;
    if (arg.skip === 0) {
      if (arg.limit === 0) {
        docs = await collection.find();
      } else {
        docs = await collection.find().limit(arg.limit);
      }
    } else {
      if (arg.limit === 0) {
        docs = await collection.find().skip(arg.skip);
      } else {
        docs = await collection.find().skip(arg.skip).limit(arg.limit);
      }
    }
    return docs;
};