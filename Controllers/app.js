const express = require("express");
const app = express();
const functions = require("../CheckController/CheckUrl");
app.get("/getotp/:countryCode/:phoneNumber",(req,res)=>{
 
    let countryCode = req.params.countryCode;
    let phoneNumber = req.params.phoneNumber;
    res.send(countryCode + phoneNumber);
    // if(countryCode){
    //     res.send("Success");
    // }
    // else{
    //   res.send("error");
    //   res.sendStatus(404);
    // }
})

const port = process.env.port || 3001;
app.listen(port, ()=> {
    console.log(`server listening at ${port}`);
})