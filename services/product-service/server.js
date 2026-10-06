const express = require("express");

const app = express();
const PORT = process.env.PORT || 3002;

app.get("/", (req, res) => {
    res.json({
        service: "product-service",
        message: "Product Service is running"
    });
});

app.get("/health", (req, res) => {
    res.json({
        service: "product-service",
        status: "UP"
    });
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Product Service running on port ${PORT}`);
});
