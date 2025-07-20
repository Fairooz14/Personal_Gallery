const { Schema, model } = require('mongoose');
module.exports = model('Image', new Schema({ url: String, label: String }, { timestamps: true }));