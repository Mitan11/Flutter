const express = require('express');
const mongoose = require('mongoose');

const app = express();
app.use(express.json());

// 1️⃣ MongoDB Connection
mongoose.connect('mongodb://127.0.0.1:27017/rrs')
.then(() => console.log('Connected to MongoDB'))
.catch(err => console.log(err));


// 2️⃣ Schema + Model (WRITE HERE 🔥)
const studentSchema = new mongoose.Schema({
    name: String,
    age: Number,
    city: String
});

const Student = mongoose.model("Student", studentSchema);


// 3️⃣ APIs (CRUD)

// CREATE
app.post("/add", async (req, res) => {
    const data = new Student(req.body);
    await data.save();
    res.send("Student Added");
});

// READ
app.get("/students", async (req, res) => {
    const data = await Student.find();
    res.json(data);
});

// UPDATE
app.put("/update/:id", async (req, res) => {
    await Student.findByIdAndUpdate(req.params.id, req.body);
    res.send("Updated");
});

// DELETE
app.delete("/delete/:id", async (req, res) => {
    await Student.findByIdAndDelete(req.params.id);
    res.send("Deleted");
});


// 4️⃣ Server Start
app.listen(3000, () => {
    console.log("Server running on port 3000");
});