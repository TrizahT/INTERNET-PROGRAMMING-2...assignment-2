<?php

$conn = new mysqli("localhost", "root", "", "campaign_feedback");


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$limit = 5;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;


$sql = "SELECT * FROM feedback ORDER BY submission_date DESC LIMIT $limit OFFSET $offset";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Feedback</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: #fff; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background: blue; color: white; }
        .pagination { margin: 20px; }
        .pagination a { padding: 8px 12px; margin: 5px; border: 1px solid #007bff; color: #007bff; text-decoration: none; }
        .pagination a.active { background: #007bff; color: white; }
    </style>
</head>
<body>

    <h2>Feedback Received</h2>
    
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Feedback</th>
            <th>Rating</th>
            <th>Submission Date</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['name']); ?></td>
                <td><?php echo htmlspecialchars($row['email']); ?></td>
                <td><?php echo htmlspecialchars($row['feedback']); ?></td>
                <td><?php echo $row['rating']; ?></td>
                <td><?php echo $row['submission_date']; ?></td>
            </tr>
        <?php endwhile; ?>
    </table>

    
    <div class="pagination">
        <?php for ($i = 1; $i <= ceil($conn->query("SELECT COUNT(*) FROM feedback")->fetch_row()[0] / $limit); $i++): ?>
            <a href="?page=<?php echo $i; ?>" class="<?php echo ($i == $page) ? 'active' : ''; ?>"><?php echo $i; ?></a>
        <?php endfor; ?>
    </div>

</body>
</html>

<?php
$conn->close();
?>
