const express = require("express");

const app = express();
const PORT = process.env.PORT || 3003;

app.get("/", (req, res) => {
    res.json({
        service: "order-service",
        message: "Order Service is running"
    });
});

app.get("/health", (req, res) => {
    res.json({
        service: "order-service",
        status: "UP"
    });
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Order Service running on port ${PORT}`);
});
