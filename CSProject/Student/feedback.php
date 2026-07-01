<?php
session_start();
require_once $_SERVER['DOCUMENT_ROOT'] . '/CSProject/Teacher/Database.php';

$studentID = $_SESSION['student_id'] ?? null;

if (!$studentID) {
    header("Location: student-dashboard.php");
    exit();
}

$stmt = mysqli_prepare($conn, "SELECT * FROM students WHERE id = ?");
mysqli_stmt_bind_param($stmt, "i", $studentID);
mysqli_stmt_execute($stmt);
$student = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

if (!$student) {
    unset($_SESSION['student_id']);
    header("Location: student-dashboard.php");
    exit();
}

// Create the feedback table on first use if it doesn't exist yet.
mysqli_query($conn, "
    CREATE TABLE IF NOT EXISTS feedback (
        id INT AUTO_INCREMENT PRIMARY KEY,
        student_id INT NOT NULL,
        feedback_text TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
");

$submitted = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $text = trim($_POST['feedback'] ?? '');
    if ($text !== '') {
        $stmt = mysqli_prepare($conn, "INSERT INTO feedback (student_id, feedback_text) VALUES (?, ?)");
        mysqli_stmt_bind_param($stmt, "is", $studentID, $text);
        mysqli_stmt_execute($stmt);
        $submitted = true;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback - NeuroNet Quest</title>
  <link rel="stylesheet" href="style.css">
  <style>
    textarea {
        width: 100%;
        min-height: 120px;
        background: var(--bg-light);
        border: 1px solid var(--border-light);
        border-radius: var(--radius-sm);
        color: var(--text-main);
        padding: 12px;
        font-family: inherit;
        font-size: 14px;
        resize: vertical;
    }
    .submit-btn {
        margin-top: 12px;
        padding: 10px 20px;
        border-radius: 8px;
        border: none;
        background: linear-gradient(135deg, var(--accent), var(--primary));
        color: #04111f;
        font-weight: 600;
        cursor: pointer;
    }
  </style>
</head>
<body>

    <video class="bg-video" autoplay muted loop playsinline>
        <source src="video/12421439_3840_2160_30fps.mp4" type="video/mp4">
    </video>
    <div class="bg-video-overlay"></div>

    <?php include 'header.php'; ?>

    <div class="dashboard-wrap">
        <div class="card">
            <h3>Feedback</h3>
            <p>Tell us what you liked or what felt confusing about NeuroNet Quest, <?php echo htmlspecialchars($student['student_name']); ?>.</p>

            <?php if ($submitted): ?>
                <div class="alert">Thanks — your feedback has been recorded.</div>
            <?php endif; ?>

            <form method="POST">
                <textarea name="feedback" placeholder="Type your feedback here..." required></textarea>
                <br>
                <button type="submit" class="submit-btn">Send Feedback</button>
            </form>
        </div>
    </div>

</body>
</html>