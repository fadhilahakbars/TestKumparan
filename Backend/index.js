const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
const { Client } = require('pg');
const { response } = require('express');
const port = process.env.PORT || 3000;
const client = new Client({
    // Lengkapi koneksi dengan database
    host: "localhost",
    port: 5432,
    user: "postgres",
    password: "fadil123",
    database: "postgres",
});

client.connect((err) =>{
    if (err) {
        console.error(err);
        return;
    }
    console.log('Database Connected');
});


app.post('/newArticle', function(req, res) {
    const query = `insert into articles (id, author_id, title, body, created_at) VALUES ('${req.body.id}', '${req.body.author_id}', '${req.body.title}', '${req.body.body}', '${req.body.created_at}'::timestamp)`;
    client.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.send(null);
            return;
        }
        res.send(`Data Artikel berhasil dimasukkan.`);
    });
});

app.get('/search', async (req, res) => {
	const title = req.body.title;
	const body = req.body.body;
	const author = req.body.author;
	let query;
	
	if (title == undefined && body == undefined && author == undefined ){
		query = `SELECT articles.id, articles.author_id, authors.name, title, body, created_at FROM articles inner join authors on articles.author_id = authors.id ORDER BY created_at DESC;`;
	}
	else if (title == undefined && body == undefined && author != undefined){
		query = `SELECT articles.id, articles.author_id, authors.name, title, body, created_at FROM articles inner join authors on articles.author_id = authors.id where name = '${author}' ORDER BY created_at DESC;`;    
	}
	else if (title != undefined && body != undefined && author == undefined){
		query = `SELECT articles.id, articles.author_id, authors.name, title, body, created_at FROM articles inner join authors on articles.author_id = authors.id where title like '%${title}%' AND body like '%${body}%' ORDER BY created_at desc;`;    
	}
	else {
		query = `SELECT articles.id, articles.author_id, authors.name, title, body, created_at FROM articles inner join authors on articles.author_id = authors.id where name = '${author}' AND title like '%${title}%' AND body like '%${body}%' ORDER BY created_at DESC;`; 
	}
    client.query(query ,(err, results) => {
         if (err) {
            console.log(err);
            res.statusCode = 500;
            res.send(null);
        } else if (results.rows.length === 0) {
            res.statusCode = 404;
            res.send(`data title dan body tidak ada`);
        } else {
            res.statusCode = 200;
            res.send(results.rows);
        }
    });
});


//server listening
app.listen(port, () => {
    console.log(`Program sudah berjalan pada port ${port}`);
});


