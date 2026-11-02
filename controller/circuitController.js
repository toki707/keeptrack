import { CircuitModel } from "../model/circuit.js";

export const getAllCricuits = async (req, res) => {
    try {
        const circuits = await CircuitModel.find();
        res.status(200).json(circuits);
    } catch (err) {
        console.log(err);
        res.status(500).json("Server Error");
    }
};