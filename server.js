const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const bodyParser = require('body-parser')

const server = express();
server.use(bodyParser.json());

const db = mysql.createConnection({
    host:"localhost",
    user:'root',
    password:'',
    database:'cuisine'
});

db.connect();

// db.query(`SELECT * FROM user`, function (error, results, fields) {
//   if (error) throw error;
//   console.log('good: ', results);
// });

server.use(cors({
  origin:"*"
}))

server.listen(3000,console.log('server start on 3000'))

server.get("/select/:table", (req, res) => {
  let table = req.params.table;
  var sql = `SELECT * FROM ${table} `;
  db.query(sql, function (error, result) {
    if (error) {
      console.log("Error Connecting to DB");
    } else {
      res.send( {result} );
    }
  });
});

//insertion de categorie
 
server.post("/insert/categorie", (req, res) => {
  let details = {
    cat_code: req.body.cat_code,
    libelleCa: req.body.libelleCa,
  };
  let sql = "INSERT INTO categorie SET ?";
  db.query(sql, details, (error) => {
    if (error) {
      res.send({ status: false, message: "Categorie created Failed" });
    } else {
      res.send({ status: true, message: "Categorie created successfully" });
    }
  });
});

//supression du categorie

server.delete("/delete/categorie/:id", (req, res) => {
  let sql = "DELETE FROM categorie WHERE cat_id=" + req.params.id + "";
  let query = db.query(sql, (error) => {
    if (error) {
      res.send({ status: false, message: "Categorie Deleted Failed" });
    } else {
      res.send({ status: true, message: "Categorie Deleted successfully" });
    }
  });
});

//insertion de produit

server.post("/insert/produit", (req, res) => {
  let detailsPro = {
    libellePro: req.body.libellePro,
    codeCa: req.body.codeCa,
    unite: req.body.unite,
  };
  let sql = "INSERT INTO produit SET ?";
  db.query(sql, detailsPro, (error) => {
    if (error) {
      res.send({ status: false, message: "produit created Failed" });
    } else {
      res.send({ status: true, message: "produit created successfully" });
    }
  });
});

//supression du produit

server.delete("/delete/produit/:id", (req, res) => {
  let sql = "DELETE FROM produit WHERE codePro=" + req.params.id + "";
  let query = db.query(sql, (error) => {
    if (error) {
      res.send({ status: false, message: "Produit Deleted Failed" });
    } else {
      res.send({ status: true, message: "Produit Deleted successfully" });
    }
  });
});

//insertion de plat (nommer recette en FrontEnd)

server.post("/insert/recette", (req, res) => {
  let detailsPla = {
    nom_plat: req.body.nom_plat,
  };
  let sql = "INSERT INTO plat SET ?";
  db.query(sql, detailsPla, (error) => {
    if (error) {
      res.send({ status: false, message: "plat created Failed" });
    } else {
      res.send({ status: true, message: "plat created successfully" });
    }
  });
});