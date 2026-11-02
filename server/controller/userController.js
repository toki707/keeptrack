import { UserModel } from "../model/user.js";

export const getAllUsers = async (req, res) => {
    try {
        const users = await UserModel.find();
        res.status(200).json(users);
    } catch (err) {
        console.log(err);
        res.status(500).json("Server Error");
    }
};