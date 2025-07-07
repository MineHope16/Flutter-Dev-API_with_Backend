const express = require("express");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

//Data to be stored in this list
const productData = [];

app.listen(2003, () => {
    console.log("Connected: http://localhost:2003");
})

// Post API
app.post("/api/add_product", (req, res) => {
    
    console.log("Result: ", req.body); 

    const pdata = {
        "id" : productData.length + 1,
        "pname" : req.body.pname,
        "pprice" : req.body.pprice,
        "pdesc" : req.body.pdesc,
    };

    productData.push(pdata);

    console.log(pdata);

    // Sending the response to the user
    res.status(200).send({
        "status_code": 200,
        "message" : "Product Added Successfully",
        "product" : pdata,
    });
})


// Get API
app.get("/api/get_product", (req, res) => {
    if( productData.length > 0) {
        res.status(200).send({
            "status_code" : 200,
            "products" : productData,
        })
    }

    else {
        res.status(200).send({
            "status_code" : 200,
            "products" : [],
        })
    }
});


// Put API
app.put("/api/update_product/:id", (req, res) => {
    let id = parseInt(req.params.id);
    console.log("ID CHECKED: ", id)

    let index = productData.findIndex(p => p.id === id)
    console.log("INDEX OF THE PRODUCT CHECKED: ", index);
    console.log("PRODUCT OF INDEX CHECKED: ", productData[index]);

    productData[index] = {
        'pname': req.body.pname,
        'pprice': req.body.pprice,
        'pdesc': req.body.pdesc,
    };

    res.status(200).send({
        status_code: 200,
        message: "Product updated successfully",
        updated_product: productData[index],
    });
});


// Delete API
app.post("/api/delete_product/:id", (req, res) => {
    let id = parseInt(req.params.id);
    let index = productData.findIndex(p => p.id === id);
    
    productData.splice(index, 1);

    res.status(200).send({
        "status_code" : 200,
        "message" : "Product deleted successfully"
    })
})


