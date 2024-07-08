// npm init -y
// npm install express

import express from "express"
import pool from './config/db.js';

const app = express();
const port = process.env.PORT || 3000;


// Middleware para parsear JSON
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public')); //indica que podemos usar HTML estatico para servir como servidor web



// Diferentes tipos de solicitud

app.get('/destinos', async (req, res) => {
    const sql = 'SELECT id_destino, nombre, pais, descripcion, precio FROM destinos ORDER BY destinos.precio DESC';

    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(sql);
        connection.release();
        res.json(rows);

    } catch (error) {
        console.error('Error al obtener destinos:', error);
        res.status(500).send('Internal server error');
    }
});

app.get('/destinos/:id', async (req, res) => {
    const id  = req.params.id;
    const sql = 'SELECT * FROM Destinos WHERE destinos.id_destino = ?';

    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(sql, [id]);
        connection.release();

        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).send('Destino no encontrado');
        }
    } catch (error) {
        res.status(500).send('Internal server error');
    }
});

    app.put('/destinos/:id', async (req, res) => {
        const id  = req.params.id;
        const { nombre, pais, descripcion, precio } = req.body;
        const sql = 'UPDATE destinos SET nombre = ?, pais = ?, descripcion = ?, precio = ? WHERE id_destino = ?';
        const values = [nombre, pais, descripcion, precio, id];
    
        try {
            const connection = await pool.getConnection();
            const result = await connection.query(sql, values);
            connection.release();
    
            if (result.affectedRows > 0) {
                res.send('Destino actualizado correctamente');
            } else {
                res.status(404).send('Destino no encontrado');
            }
        } catch (error) {
            res.status(500).send('Internal server error');
        }
    });

    app.delete('/destinos/:id', async (req, res) => {
        const id = req.params.id;
        const sql = 'DELETE FROM destinos WHERE id_destino = ?';
    
        try {
            const connection = await pool.getConnection();
            const result = await connection.query(sql, [id]);
            connection.release();
    
            if (result.affectedRows > 0) {
                res.send('Destino eliminado correctamente');
            } else {
                res.status(404).send('Destino no encontrado');
            }
        } catch (error) {
            console.error('Error deleting destino', error);
            res.status(500).send('Internal server error');
        }
    });



//encender servidor web y opcionalmente un callback para indicar, por ejemplo, en que puerto esta encendido el servidor
app.listen(port,() => {
    console.log('Servidor web online en puerto ${port)')
})