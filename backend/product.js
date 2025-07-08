const mongoose = require("mongoose");

let productSchema = mongoose.Schema({
    "pname" : {
        required : true,
        type : String,
    },

    "pprice" : {
        required : true,
        type : String,
    },

    "pdesc" : {
        required : true,
        type : String,
    }
});

module.exports = mongoose.model("Node_JS", productSchema);