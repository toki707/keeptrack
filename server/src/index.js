import express from "express";
import { connectToDatabase, disconnectFromDatabase } from "./db.js";
import circuitRoutes from "../routes/circuitRoutes.js";
import voitureRoutes from "../routes/voitureRoutes.js";
import userRoutes from "../routes/userRoutes.js";

export const app = express();
app.use(express.json());

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    res.setHeader("Access-Control-Allow-Methods", "GET")
    res.setHeader("Access-Control-Allow-Headers", "Content-Type")
    next();
});

app.use("/api", circuitRoutes);
app.use("/api", voitureRoutes);
app.use("/api", userRoutes);

if (process.env.NODE_ENV !== "test") {
    await connectToDatabase();
    app.listen(3000, () => {
        console.log("Server running on port 3000");
    });
    process.on("SIGINT", async () => {
        await disconnectFromDatabase();
        process.exit();
    });
}