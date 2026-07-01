<?php
session_start();
require_once $_SERVER['DOCUMENT_ROOT'] . '/CSProject/Teacher/Database.php';

$studentID = $_SESSION['student_id'] ?? null;
$student   = null;

if ($studentID) {
    $stmt = mysqli_prepare($conn, "SELECT * FROM students WHERE id = ?");
    mysqli_stmt_bind_param($stmt, "i", $studentID);
    mysqli_stmt_execute($stmt);
    $student = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

    // Session points at a student that no longer exists (e.g. teacher hit Reset)
    if (!$student) {
        unset($_SESSION['student_id']);
        $studentID = null;
    }
}

$isLoggedIn = $studentID && $student;

if ($isLoggedIn) {
    $studentInitial = strtoupper(substr($student['student_name'], 0, 1));
}

// Used by the scanner to build/validate the join link's own host
$hostForScanner = $_SERVER['HTTP_HOST'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard - NeuroNet Quest</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

    <video class="bg-video" autoplay muted loop playsinline>
        <source src="video/background.mp4" type="video/mp4">
    </video>
    <div class="bg-video-overlay"></div>

    <?php include 'header.php'; ?>

    <div class="dashboard-wrap">

        <?php if ($isLoggedIn): ?>

            <div class="dashboard-hero">
                <div class="avatar"><?php echo $studentInitial; ?></div>
                <div>
                    <h2><?php echo htmlspecialchars($student['student_name']); ?></h2>
                    <p>Layer <?php echo (int) $student['layer_number']; ?> access · <?php echo (int) $student['score']; ?> pts</p>
                </div>
            </div>

            <div class="dashboard-grid">

                <a href="Question.php" class="node-card enter-game">
                    <div class="node-icon">▶</div>
                    <h3>Enter Game</h3>
                    <p>Jump back into your board and continue answering questions.</p>
                </a>

                <a href="about.php" class="node-card">
                    <div class="node-icon">i</div>
                    <h3>About</h3>
                    <p>Learn how NeuroNet Quest works and what each tile means.</p>
                </a>

                <a href="profile.php" class="node-card">
                    <div class="node-icon"><?php echo $studentInitial; ?></div>
                    <h3>View Profile</h3>
                    <p>See your name, avatar, score, and badges.</p>
                </a>

                <a href="feedback.php" class="node-card">
                    <div class="node-icon">✎</div>
                    <h3>Feedback</h3>
                    <p>Tell us what you liked or what felt confusing.</p>
                </a>

            </div>

        <?php else: ?>

            <div class="card" style="text-align:center; max-width:520px; margin:0 auto;">
                <h3>Join a Game</h3>
                <p>Scan the class QR code on your teacher's screen to join the current game.</p>

                <button class="scan" style="margin-top:8px;" onclick="openScanner()">▶ Enter Game (Scan QR)</button>

                <p style="margin-top:16px; font-size:12px;">
                    No camera access?
                    <a href="#" id="manualCodeToggle" style="color:var(--accent);">Enter the class code manually</a>
                </p>

                <div id="manualCodeBox" style="display:none; margin-top:10px;">
                    <input type="text" id="manualCode" placeholder="e.g. TT-1234"
                        style="width:100%; padding:10px; border-radius:8px; border:1px solid var(--border-light); background: var(--bg-light); color: var(--text-main); text-align:center; text-transform:uppercase;">
                    <button class="scan" style="margin-top:8px; width:100%;" onclick="submitManualCode()">Join</button>
                </div>
            </div>

        <?php endif; ?>

    </div>

    <!-- QR SCANNER MODAL -->
    <div class="qr-modal-overlay" id="qr-modal-overlay">
        <div class="qr-modal">
            <div class="qr-modal-header">
                <h3>Scan Class QR</h3>
                <button class="qr-close-btn" onclick="closeScanner()" aria-label="Close scanner">✕</button>
            </div>

            <div id="qr-reader"></div>

            <p class="qr-modal-hint">Point your camera at the QR code on your teacher's screen.</p>
        </div>
    </div>

    <?php if (!$isLoggedIn): ?>
    <script src="https://unpkg.com/html5-qrcode"></script>
    <script>
        let html5QrCode;

        function openScanner() {
            document.getElementById("qr-modal-overlay").classList.add("active");

            html5QrCode = new Html5Qrcode("qr-reader");

            Html5Qrcode.getCameras().then(devices => {
                if (devices && devices.length) {
                    html5QrCode.start(
                        devices[0].id,
                        { fps: 10, qrbox: 220 },
                        onScanSuccess
                    ).catch(err => {
                        console.error("Unable to start camera:", err);
                        alert("Could not access the camera. You can use 'Enter the class code manually' instead.");
                        closeScanner();
                    });
                }
            }).catch(err => {
                console.error("Unable to list cameras:", err);
                alert("No camera found. Use 'Enter the class code manually' instead.");
                closeScanner();
            });
        }

        function closeScanner() {
            if (html5QrCode && html5QrCode.isScanning) {
                html5QrCode.stop().then(() => {
                    html5QrCode.clear();
                    document.getElementById("qr-modal-overlay").classList.remove("active");
                }).catch(() => {
                    document.getElementById("qr-modal-overlay").classList.remove("active");
                });
            } else {
                document.getElementById("qr-modal-overlay").classList.remove("active");
            }
        }

        function goToLogin(code) {
            code = code.trim();
            if (!code) return;
            window.location.href = "StudentLogin.php?code=" + encodeURIComponent(code);
        }

        function onScanSuccess(decodedText) {
            // Expect a full StudentLogin.php?code=XXXX URL from the teacher's QR.
            // Fall back to treating the raw text as the code itself.
            try {
                const url = new URL(decodedText);
                const code = url.searchParams.get("code");
                if (code) {
                    closeScanner();
                    goToLogin(code);
                    return;
                }
            } catch (e) {
                // not a URL — maybe it's just the raw code
            }

            if (/^[A-Za-z0-9-]+$/.test(decodedText)) {
                closeScanner();
                goToLogin(decodedText);
            } else {
                alert("That doesn't look like a NeuroNet Quest class code. Please scan the QR code on your teacher's screen.");
            }
        }

        document.getElementById("qr-modal-overlay").addEventListener("click", function (e) {
            if (e.target === this) closeScanner();
        });

        document.getElementById("manualCodeToggle").addEventListener("click", function (e) {
            e.preventDefault();
            document.getElementById("manualCodeBox").style.display = "block";
        });

        function submitManualCode() {
            goToLogin(document.getElementById("manualCode").value);
        }
    </script>
    <?php endif; ?>

</body>
</html>