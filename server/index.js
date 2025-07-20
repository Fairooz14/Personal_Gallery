require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const multer = require('multer');
const ImageModel = require('./models/Image');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));

// connect to MongoDB Atlas free tier
mongoose.connect(process.env.MONGO_URI || 'mongodb://localhost:27017/gallery');

// disk storage
const storage = multer.diskStorage({
  destination: (_, __, cb) => cb(null, 'uploads'),
  filename: (_, file, cb) => cb(null, Date.now() + '-' + file.originalname),
});
const upload = multer({ storage });

// routes
app.get('/api/images', async (_, res) => {
  const images = await ImageModel.find().sort({ createdAt: -1 });
  res.json(images);
});

app.post('/api/images', upload.single('file'), async (req, res) => {
  const image = await ImageModel.create({
    url: `http://<YOUR_IP>:5000/uploads/${req.file.filename}`,
    label: req.body.label,
  });
  res.json(image);
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Node server on :${PORT}`));