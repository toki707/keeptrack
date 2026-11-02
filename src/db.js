import mongoose, { mongo } from "mongoose";
import { MongoMemoryServer } from "mongodb-memory-server";
const mongodb = await MongoMemoryServer.create();

export async function connectToDatabase() {
    if (process.env.NODE_ENV === "test") {
        const uri = mongodb.getUri();
        await mongoose.connect(uri);
        console.log("Connected to in-memory database");
        return;
    }
    try {
        await mongoose.connect('mongodb://localhost:27017/keeptrack');
        console.log("Connected to database");
    }
    catch (err) {
        console.log("Error connecting to database")
    }
}

export async function disconnectFromDatabase() {
    if (process.env.NODE_ENV === "test") {
        await mongoose.connection.dropDatabase();
        await mongoose.connection.close();
        await mongodb.stop();
    }
    await mongoose.disconnect();
    console.log("Disconnected from database")
}

export async function prepareDatabase() {
    if (process.env.NODE_ENV !== "test") {
        throw new Error("prepareDatabase can only be used in test environment")
    }
    mongoose.connection.collection("circuits").insertMany(
        [
            {
                "_id": new mongoose.Types.ObjectId("6a82f5c8f30ec9c08d94324c")
                ,
                "name": "Spa",
                "country": "Belgique",
                "length_km": 7.004,
                "fastest_car": {
                    "car": "Ferrari F1 2004",
                    "time": "1:41.234"
                },
                "cars": [
                    {
                        "name": "Ferrari F1 2004",
                        "times": [
                            "1:42.987",
                            "1:41.234",
                            "1:43.501",
                            "1:41.890"
                        ]
                    },
                    {
                        "name": "Porsche 918 Spyder",
                        "times": [
                            "2:05.412",
                            "2:04.876",
                            "2:06.203"
                        ]
                    },
                    {
                        "name": "Mclaren P1",
                        "times": [
                            "2:03.998",
                            "2:04.512",
                            "2:03.654",
                            "2:05.001"
                        ]
                    }
                ],
                "year_creation": 1921,
                "highest_point": "470m",
                "lowest_point": "373m"
            },
            {
                "_id": new mongoose.Types.ObjectId("6a82f5c8f30ec9c08d94324d")
                ,
                "name": "Silverstone",
                "country": "Royaume-Uni",
                "length_km": 5.891,
                "fastest_car": {
                    "car": "Ferrari LaFerrari",
                    "time": "1:38.452"
                },
                "cars": [
                    {
                        "name": "Ferrari LaFerrari",
                        "times": [
                            "1:39.876",
                            "1:38.452",
                            "1:40.120"
                        ]
                    },
                    {
                        "name": "Abarth 500",
                        "times": [
                            "2:15.334",
                            "2:14.789",
                            "2:16.045",
                            "2:14.998"
                        ]
                    },
                    {
                        "name": "Mclaren P1",
                        "times": [
                            "1:41.223",
                            "1:40.876",
                            "1:41.998"
                        ]
                    }
                ],
                "year_creation": 1948,
                "highest_point": "133m",
                "lowest_point": "94m"
            },
            {
                "_id": new mongoose.Types.ObjectId("6a82f5c8f30ec9c08d94324e")
                ,
                "name": "Nürburgring",
                "country": "Allemagne",
                "length_km": 25.378,
                "fastest_car": {
                    "car": "Porsche 918 Spyder",
                    "time": "8:12.456"
                },
                "cars": [
                    {
                        "name": "Porsche 918 Spyder",
                        "times": [
                            "8:15.789",
                            "8:12.456",
                            "8:18.234"
                        ]
                    },
                    {
                        "name": "Ferrari LaFerrari",
                        "times": [
                            "8:20.112",
                            "8:22.876",
                            "8:19.543",
                            "8:21.998"
                        ]
                    },
                    {
                        "name": "Abarth 500",
                        "times": [
                            "10:45.678",
                            "10:52.334",
                            "10:48.901"
                        ]
                    }
                ],
                "year_creation": 1925,
                "highest_point": "620m",
                "lowest_point": "320m"
            }
        ]
    )
}