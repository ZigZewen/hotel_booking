const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();

const connection = require("./db.js"); // Import the database connection

// Middleware
app.use(bodyParser.json());
app.use(cors());

// Endpoint for getting data from the database
app.get("/api/bookings", (req, res) => {
  connection.query("SELECT * FROM hotel_bookings", (err, results) => {
    if (err) {
      console.error("Error fetching data from the database:", err);
      res.status(500).json({ error: "An error occurred" });
    } else {
      res.json(results);
    }
  });
});

// Endpoint for getting data from the 'hotels' table
app.get("/api/hotels", (req, res) => {
  connection.query("SELECT * FROM hotels", (err, results) => {
    if (err) {
      console.error("Error fetching data from the hotels table:", err);
      res.status(500).json({ error: "An error occurred" });
    } else {
      res.json(results);
    }
  });
});

// Endpoint for getting data from the 'hotel_admins' table
app.get("/api/admins", (req, res) => {
  connection.query("SELECT * FROM hotel_admins", (err, results) => {
    if (err) {
      console.error("Error fetching data from the hotel_admins table:", err);
      res.status(500).json({ error: "An error occurred" });
    } else {
      res.json(results);
    }
  });
});

// Endpoint for getting a hotel by ID
app.get("/api/hotels/:id", (req, res) => {
  const hotelId = req.params.id; // Get the hotel ID from the URL parameter

  connection.query(
    "SELECT * FROM hotels WHERE id = ?",
    [hotelId],
    (err, results) => {
      if (err) {
        console.error("Error fetching data from the hotels table:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        if (results.length === 0) {
          res.status(404).json({ error: "Hotel not found" });
        } else {
          res.json(results[0]);
        }
      }
    }
  );
});

// Endpoint for getting a booking by ID
app.get("/api/bookings/:id", (req, res) => {
  const bookingId = req.params.id; // Get the booking ID from the URL parameter

  connection.query(
    "SELECT * FROM hotel_bookings WHERE booking_id = ?",
    [bookingId],
    (err, results) => {
      if (err) {
        console.error(
          "Error fetching data from the hotel_bookings table:",
          err
        );
        res.status(500).json({ error: "An error occurred" });
      } else {
        if (results.length === 0) {
          res.status(404).json({ error: "Booking not found" });
        } else {
          res.json(results[0]);
        }
      }
    }
  );
});

// Endpoint for getting an admin by ID
app.get("/api/admins/:id", (req, res) => {
  const adminId = req.params.id; // Get the admin ID from the URL parameter

  connection.query(
    "SELECT * FROM hotel_admins WHERE id = ?",
    [adminId],
    (err, results) => {
      if (err) {
        console.error("Error fetching data from the hotel_admins table:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        if (results.length === 0) {
          res.status(404).json({ error: "Admin not found" });
        } else {
          res.json(results[0]);
        }
      }
    }
  );
});

// Endpoint for adding a new hotel
app.post("/api/hotels", (req, res) => {
  const { name, address, phone_number, description, image } = req.body;

  connection.query(
    "INSERT INTO hotels (name, address, phone_number, description, image) VALUES (?, ?, ?, ?, ?)",
    [name, address, phone_number, description, image],
    (err, results) => {
      if (err) {
        console.error("Error adding a new hotel:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({ message: "New hotel added", hotelId: results.insertId });
      }
    }
  );
});

// Endpoint for adding a new booking
app.post("/api/bookings", (req, res) => {
  const { hotel_id, guest_name, phone_number, check_in_date, check_out_date } = req.body;

  connection.query(
    "INSERT INTO hotel_bookings (hotel_id, guest_name, phone_number, check_in_date, check_out_date) VALUES (?, ?, ?, ?, ?)",
    [hotel_id, guest_name, phone_number, check_in_date, check_out_date],
    (err, results) => {
      if (err) {
        console.error("Error adding a new booking:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({ message: "New booking added", bookingId: results.insertId });
      }
    }
  );
});

// Endpoint for adding a new admin
app.post("/api/admins", (req, res) => {
  const { username, password } = req.body;

  connection.query(
    "INSERT INTO hotel_admins (username, password) VALUES (?, ?)",
    [username, password],
    (err, results) => {
      if (err) {
        console.error("Error adding a new admin:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({ message: "New admin added", adminId: results.insertId });
      }
    }
  );
});

// PUT endpoint for updating data in the 'hotels' table by ID
app.put("/api/hotels/:id", (req, res) => {
  const hotelId = req.params.id; // Get the hotel ID from the URL parameter
  const updatedData = req.body; // Updated data sent in the request body

  connection.query(
    "UPDATE hotels SET ? WHERE id = ?",
    [updatedData, hotelId],
    (err, results) => {
      if (err) {
        console.error("Error updating the hotel:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({
          message: "Hotel updated",
          updatedRows: results.affectedRows,
        });
      }
    }
  );
});

// PUT endpoint for updating data in the 'hotel_admins' table by ID
app.put("/api/admins/:id", (req, res) => {
  const adminId = req.params.id; // Get the admin ID from the URL parameter
  const updatedData = req.body; // Updated data sent in the request body

  connection.query(
    "UPDATE hotel_admins SET ? WHERE id = ?",
    [updatedData, adminId],
    (err, results) => {
      if (err) {
        console.error("Error updating the admin:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({
          message: "Admin updated",
          updatedRows: results.affectedRows,
        });
      }
    }
  );
});

// PUT endpoint for updating data in the 'hotel_bookings' table by ID
app.put("/api/bookings/:id", (req, res) => {
  const bookingId = req.params.id; // Get the booking ID from the URL parameter
  const updatedData = req.body; // Updated data sent in the request body

  connection.query(
    "UPDATE hotel_bookings SET ? WHERE booking_id = ?",
    [updatedData, bookingId],
    (err, results) => {
      if (err) {
        console.error("Error updating the booking:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({
          message: "Booking updated",
          updatedRows: results.affectedRows,
        });
      }
    }
  );
});

// DELETE endpoint for deleting a hotel by ID
app.delete("/api/hotels/:id", (req, res) => {
  const hotelId = req.params.id; // Get the hotel ID from the URL parameter

  connection.query(
    "DELETE FROM hotels WHERE id = ?",
    [hotelId],
    (err, results) => {
      if (err) {
        console.error("Error deleting the hotel:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({
          message: "Hotel deleted",
          deletedRows: results.affectedRows,
        });
      }
    }
  );
});

// DELETE endpoint for deleting an admin by ID
app.delete("/api/admins/:id", (req, res) => {
  const adminId = req.params.id; // Get the admin ID from the URL parameter

  connection.query(
    "DELETE FROM hotel_admins WHERE id = ?",
    [adminId],
    (err, results) => {
      if (err) {
        console.error("Error deleting the admin:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({
          message: "Admin deleted",
          deletedRows: results.affectedRows,
        });
      }
    }
  );
});

// DELETE endpoint for deleting a booking by ID
app.delete("/api/bookings/:id", (req, res) => {
  const bookingId = req.params.id; // Get the booking ID from the URL parameter

  connection.query(
    "DELETE FROM hotel_bookings WHERE booking_id = ?",
    [bookingId],
    (err, results) => {
      if (err) {
        console.error("Error deleting the booking:", err);
        res.status(500).json({ error: "An error occurred" });
      } else {
        res.json({
          message: "Booking deleted",
          deletedRows: results.affectedRows,
        });
      }
    }
  );
});

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
