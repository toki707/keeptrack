import mongoose from "mongoose";

const { Schema } = mongoose;

const VoitureSchema = new Schema({
    id: { type: String, required: true },
    name: { type: String, required: true },
    brand: { type: String, required: false },
    description: { type: String, required: false },
    tags: [{ type: String, required: false }],
    classCar: { type: String, required: false },
    specs: {
        bhp: { type: String, required: false },
        torque: { type: String, required: false },
        weight: { type: String, required: false },
        topSpeed: { type: String, required: false },
        acceleration: { type: String, required: false },
        pwratio: { type: String, required: false },
        range: { type: Number, required: false },
    },
    preview: { type: String, required: true },
});

export const VoitureModel = mongoose.model("Voiture", VoitureSchema);