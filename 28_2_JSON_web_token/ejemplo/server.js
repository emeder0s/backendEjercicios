const express = require("express");
    const jwt = require("jsonwebtoken");

    const app = express();

    app.get("/api", (req , res) => {
        res.json({
            mensaje: "Nodejs and JWT"
        });
    });

    app.post("/api/login", (req , res) => {
        const user = {
            id: 1,
            nombre : "Davinia",
            email: "daviniadelarosa@gmail.com"
        }
        jwt.sign({user}, 'secretkey', {expiresIn: '1000s'}, (err, token) => {
            res.json({
                token
            });
        });

    });

    app.post("/api/posts", verifyToken, (req , res) => {

        jwt.verify(req.token, 'secretkey', (error, authData) => {
            if(error){
                res.sendStatus(403);
                console.log(error);
            }else{
                res.json({
                        mensaje: "Acceso correcto",
                        authData
                    });
            }
        });
    });

    // Authorization: Bearer <token>
    function verifyToken(req, res, next){
        const bearerHeader =  req.headers['authorization'];

        if(typeof bearerHeader !== 'undefined'){
            const bearerToken = bearerHeader.split(" ")[1];
            req.token  = bearerToken;
            next();
        }else{
            res.sendStatus(403);
        }
    }

    app.listen(3000, () => {
        console.log("nodejs app running...");
    });