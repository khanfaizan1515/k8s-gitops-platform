const express = require("express");

const app = express();
const PORT = process.env.PORT || 3001;

app.get("/", (req, res) => {
    res.json({
        service: "user-service",
        message: "User Service is running"
    });
});

app.get("/health", (req, res) => {
    res.json({
        service: "user-service",
        status: "UP"
    });
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`User Service running on port ${PORT}`);
});
