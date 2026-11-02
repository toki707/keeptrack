import express from "express";
import { getAllVoitures } from "../controller/voitureController.js";

const router = express.Router();

router.get("/voitures", getAllVoitures);

export default router;