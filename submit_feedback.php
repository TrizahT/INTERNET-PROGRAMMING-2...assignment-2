<?php

$servername = "localhost";
$username = "root";  
$password = "";      
$database = "campaign_feedback"; 

$conn = new mysqli($servername, $username, $password, $database);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$name = trim($_POST['name']);
$email = trim($_POST['email']);
$feedback = trim($_POST['feedback']);
$rating = (int)$_POST['rating'];


if (empty($name) || empty($email) || empty($feedback) || empty($rating)) {
    die("All fields are required.");
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("Invalid email format.");
}

if ($rating < 1 || $rating > 5) {
    die("Rating must be between 1 and 5.");
}

$sql = "INSERT INTO feedback (name, email, feedback, rating) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $name, $email, $feedback, $rating);

if ($stmt->execute()) {
    echo "Feedback submitted successfully!";
    echo "<br><a href='view_feedback.php'>View Feedback</a>";
} else {
    echo "Error: " . $stmt->error;
}


$stmt->close();
$conn->close();
?>
