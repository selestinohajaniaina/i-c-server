const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const bodyParser = require('body-parser')

const server = express();
server.use(bodyParser.json());

const db = mysql.createConnection({
    host:"sql113.epizy.com",
    user:'epiz_33884810',
    password:'Ub8tJRPd322eloO',
    database:'epiz_33884810_cuisine'
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

//selection tout par table

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

//insertion de categorie dans le table categorie
 
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

//supression du categorie dans le table categorie

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

//insertion de produit dans le table produit

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

//supression du produit dans le table produit

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

//selection nom du plat 

server.get("/select/plat/:id_plat", (req, res) => {
  let id_plat = req.params.id_plat;
  var sql = `SELECT * FROM plat WHERE id_plat=${id_plat} `;
  db.query(sql, function (error, result) {
    if (error) {
      console.log("Error Connecting to DB");
    } else {
      res.send( {result} );
    }
  });
});

//selection des produits dans un plat 

server.get("/select/detail/:id_plat", (req, res) => {
  let id_plat = req.params.id_plat;
  var sql = `SELECT * FROM detailplat WHERE id_plat=${id_plat} ORDER BY libellePro ASC`;
  db.query(sql, function (error, result) {
    if (error) {
      console.log("Error Connecting to DB");
    } else {
      res.send( {result} );
    }
  });
});

//insertion de plat (ou dite recette )

server.post("/plat/add/produit", (req, res) => {
  let detailsPro = {
    id_plat: req.body.id_plat,
    libellePro: req.body.libellePro,
    variete: req.body.variete,
    qte: req.body.qte,
  };
  let sql = "INSERT INTO detailplat SET ?";
  db.query(sql, detailsPro, (error) => {
    if (error) {
      res.send({ status: false, message: "produit's plat created Failed" });
    } else {
      res.send({ status: true, message: "produit's plat created successfully" });
    }
  });
});

//supression d'un produit dans un recette

server.delete("/delete/detail/:id", (req, res) => {
  let sql = "DELETE FROM detailplat WHERE id=" + req.params.id + "";
  let query = db.query(sql, (error) => {
    if (error) {
      res.send({ status: false, message: "Produit Deleted from detailplat Failed" });
    } else {
      res.send({ status: true, message: "Produit Deleted from detailplat successfully" });
    }
  });
});

//signup into db // insertion d'info d'utilisateur dans la base de donnée

server.post("/person/add", (req, res) => {
  let detailsUser = {
    username: req.body.username,
    email: req.body.email,
    password: req.body.password,
  };
  let sql = "INSERT INTO user SET ?";
  db.query(sql, detailsUser, (error) => {
    if (error) {
      res.send({ status: false, message: "user created Failed" });
    } else {
      res.send({ status: true, message: "user created successfully" });
    }
  });
});

//selection user in db

server.get("/user/:email", (req, res) => {
  let email = req.params.email;
  var sql = `SELECT * FROM user WHERE email='${email}'`;
  db.query(sql, function (error, result) {
    if (!result) {
      res.send({ status: false, message: "compte introuvable" });
    } else {
      res.send({ status: true, message: "user connected successfully", data: result });
    }
  });
});

//insertion avis dans la base de donnée

server.post("/insert/feedback", (req, res) => {
  let detailsUser = {
    id_plat:req.body.id_plat,
    temps: req.body.min,
    dificulte: req.body.dificulte,
    etoile: req.body.rating,
  };
  delFeedback(req.body.id_plat);
  let sql = "INSERT INTO avis SET ?";
  db.query(sql, detailsUser, (error) => {
    if (error) {
      res.send({ status: false, message: "avis created Failed" });
    } else {
      res.send({ status: true, message: "avis created successfully" });
    }
  });
});

//suprimer avis dans la base de donnée si existe, pour inserer a nouveau
function delFeedback(number){
  db.query('DELETE FROM avis WHERE id_plat='+number+'');
}

//selection de nom du plat dans base de donnée

server.get("/select/plat/:id_plat", (req, res) => {
  let id_plat = req.params.id_plat;
  var sql = `SELECT * FROM plat WHERE id_plat=${id_plat}`;
  db.query(sql, function (error, result) {
    if (error) {
      console.log("Error Connecting to DB");
    } else {
      res.send( {result} );
    }
  });
});