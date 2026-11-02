import express from "express";
import { getAllCricuits } from "../controller/circuitController.js";

const router = express.Router();

router.get("/circuits", getAllCricuits);

export default router;