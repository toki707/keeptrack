import { VoitureModel } from "../model/voiture.js";

export const getAllVoitures = async (req, res) => {
    try {
        const voitures = await VoitureModel.find();
        res.status(200).json(voitures);
    } catch (err) {
        console.log(err);
        res.status(500).json("Server Error");
    }
};