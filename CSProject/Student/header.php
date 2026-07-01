<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$__loggedInStudentId = $_SESSION['student_id'] ?? null;
$__loggedInName = null;

if ($__loggedInStudentId) {
    if (!isset($conn)) {
        include_once $_SERVER['DOCUMENT_ROOT'] . '/CSProject/Teacher/Database.php';
    }
    $__stmt = mysqli_prepare($conn, "SELECT student_name FROM students WHERE id = ?");
    mysqli_stmt_bind_param($__stmt, "i", $__loggedInStudentId);
    mysqli_stmt_execute($__stmt);
    $__row = mysqli_fetch_assoc(mysqli_stmt_get_result($__stmt));
    $__loggedInName = $__row['student_name'] ?? null;
}
?>
<div class="header">
    <div class="logo">
        <div class="logo-box">T</div>
        <span>TripleT Edu</span>
    </div>

    <div class="nav-btns">
        <?php if ($__loggedInName): ?>
            <span style="color: var(--text-muted); font-size: 13px; margin-right: 4px;">
                Hi, <?php echo htmlspecialchars($__loggedInName); ?>
            </span>
            <a href="student-dashboard.php" class="btn outline">Dashboard</a>
            <a href="logout.php" class="btn outline">Leave Game</a>
        <?php else: ?>
            <a href="student-dashboard.php" class="btn outline">Exit</a>
        <?php endif; ?>
    </div>
</div>