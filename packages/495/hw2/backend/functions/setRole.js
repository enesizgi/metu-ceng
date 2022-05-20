exports = async function(arg){
    var collection = context.services.get("mongodb-atlas").db("data").collection("users");
    var user = await collection.findOne();
    return user;
};