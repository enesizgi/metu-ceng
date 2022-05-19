exports = async function(arg){
    var collection = context.services.get("mongodb-atlas").db("data").collection(arg.collection);
    var docs = await collection.find().skip(arg.skip).limit(arg.limit);
    return docs;
};