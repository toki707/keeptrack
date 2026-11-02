import mongoose, { mongo } from "mongoose";
const Schema = mongoose.Schema

const CircuitSchema = new Schema({
    id: { type: String, required: true },
    name: { type: String, required: true },
    description: { type: String, required: false },
    tags: [{ type: String, required: false }],
    country: { type: String, required: false },
    city: { type: String, required: false },
    lengthKm: { type: String, required: false },
    pitboxes: { type: String, required: false },
    run: { type: String, required: false },
    yearCreation: { type: Number, required: false },
    highestPoint: { type: String, required: false },
    lowestPoint: { type: String, required: false },
    preview: { type: String, required: false },
    outline: { type: String, required: false },
    location: { type: String, required: false },
});

export const CircuitModel = mongoose.model("Circuit", CircuitSchema);