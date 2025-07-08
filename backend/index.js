// Dev branch
const express = require("express");
const mongoose = require("mongoose");
require('dotenv').config();
const Product = require("./product");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

// Connect to Mongoose

mongoose.connect(process.env.MONGO_URL).then(() => {
    console.log("Status: Connected to Mongoose");

    // Post API
    app.post("/api/add_product", async (req, res) => {

        let data = Product(req.body);

        try {            
            let dataStore = await data.save();
            
            res.status(200).json(dataStore);

        } catch (e) {
            res.status(400).json({
                "status_code" : 400,
                "message" : e.message,
            });
            
        }

        // console.log("Result: ", req.body);

        // const pdata = {
        //     "id": productData.length + 1,
        //     "pname": req.body.pname,
        //     "pprice": req.body.pprice,
        //     "pdesc": req.body.pdesc,
        // };

        // productData.push(pdata);

        // console.log(pdata);

        // // Sending the response to the user
        // res.status(200).send({
        //     "status_code": 200,
        //     "message": "Product Added Successfully",
        //     "product": pdata,
        // });
    })


    // Get API
    app.get("/api/get_product", async (req, res) => {

        try {
            let data = await Product.find(req.params.id);
            res.status(200).json(data);
            
        } catch (error) {
            res.status(500).json(error.message);
            
        }

        // if (productData.length > 0) {
        //     res.status(200).send({
        //         "status_code": 200,
        //         "products": productData,
        //     })
        // }

        // else {
        //     res.status(200).send({
        //         "status_code": 200,
        //         "products": [],
        //     })
        // }
    });


    // Put API
    app.patch("/api/update_product/:id", async (req, res) => {

        let id = req.params.id
        let updatedData = req.body
        let options = {new : true}

        console.log('PATCH id:', id);
        console.log('Update request body:', updatedData);

        try {
            let data = await Product.findByIdAndUpdate(id, updatedData, options)
            console.log('Update result:', data);
            if (!data) {
                return res.status(404).json({ message: 'Product not found for update.' });
            }
            res.status(200).json(data)
        } catch (error) {
            console.error('Update error:', error);
            res.status(500).json({ message: error.message });
        }
        // let id = parseInt(req.params.id);
        // console.log("ID CHECKED: ", id)

        // let index = productData.findIndex(p => p.id === id)
        // console.log("INDEX OF THE PRODUCT CHECKED: ", index);
        // console.log("PRODUCT OF INDEX CHECKED: ", productData[index]);

        // productData[index] = {
        //     'pname': req.body.pname,
        //     'pprice': req.body.pprice,
        //     'pdesc': req.body.pdesc,
        // };

        // res.status(200).send({
        //     status_code: 200,
        //     message: "Product updated successfully",
        //     updated_product: productData[index],
        // });
    });


    // Delete API
    app.delete("/api/delete_product/:id", async (req, res) => {


        let id = req.params.id;

        try {

            let data = await Product.findByIdAndDelete(id);
            res.status(200).send({
                "message" : "Product Deleted Sucessfully"
            })
            
        } catch (error) {

            res.status(500).send(error.message);
            
        }

        // let id = parseInt(req.params.id);
        // let index = productData.findIndex(p => p.id === id);

        // productData.splice(index, 1);

        // res.status(200).send({
        //     "status_code": 200,
        //     "message": "Product deleted successfully"
        // })
    })
}).catch((err) => {
    console.error("Mongoose connection error:", err);
});




app.listen(2003, () => {
    console.log("Connected: http://localhost:2003");
})


