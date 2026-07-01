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

$studentInitial  = strtoupper(substr($student['student_name'], 0, 1));
$scoreMax        = WINNING_SCORE;
$progressPercent = ($scoreMax > 0) ? round(($student['score'] / $scoreMax) * 100) : 0;
$lapsCompleted   = (int) ($student['laps_completed'] ?? 0);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile - NeuroNet Quest</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

    <video class="bg-video" autoplay muted loop playsinline>
        <source src="video/12421439_3840_2160_30fps.mp4" type="video/mp4">
    </video>
    <div class="bg-video-overlay"></div>

    <?php include 'header.php'; ?>

    <div class="dashboard-wrap">
        <div class="card">
            <div class="profile">
                <div class="avatar"><?php echo $studentInitial; ?></div>
                <div>
                    <h3><?php echo htmlspecialchars($student['student_name']); ?></h3>
                    <p>Layer <?php echo (int) $student['layer_number']; ?> access</p>
                </div>
            </div>

            <p>Score progress</p>
            <div class="progress-bar" style="--progress: <?php echo $progressPercent; ?>%;"></div>
            <p><?php echo (int) $student['score']; ?> / <?php echo $scoreMax; ?></p>

            <div class="badges">
                <span>Tile <?php echo (int) $student['current_tile']; ?></span>
                <span>Lap <?php echo $lapsCompleted + 1; ?></span>
                <span>Reward ready: <?php echo $student['winner'] === 'Yes' ? 'Yes 🏆' : 'No'; ?></span>
            </div>
        </div>
    </div>

</body>
</html>