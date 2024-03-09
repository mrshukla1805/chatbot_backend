const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise');

// Database connection
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'doctor_appointments'
});

const app = express();
const port = 3000;

app.use(bodyParser.json());

// Route for adding a new doctor
app.post('/doctors', async (req, res) => {
    try {
        const { doc_name } = req.body;
        const [result] = await db.query('CALL CreateDoctorAndSlots(?)', [doc_name]);
        res.status(201).send({ message: 'Doctor added successfully' });
    } catch (error) {
        console.error('Error adding doctor:', error);
        res.status(500).send({ message: 'Error adding doctor' });
    }
});

// Route for fetching appointments for a doctor
app.get('/doctors/:doctorId/slot', async (req, res) => {
    try {
        const { doctorId } = req.params;
        const [appointments] = await db.query('SELECT * FROM slot WHERE doc_id = ?', [doctorId]);
        res.status(200).send(appointments);
    } catch (error) {
        console.error('Error fetching appointments:', error);
        res.status(500).send({ message: 'Error fetching appointments' });
    }
});

app.listen(port, () => {
    console.log(`Doctor's Office API listening at http://localhost:${port}`);
});
