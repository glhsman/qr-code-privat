<?php
// NACH GEBRAUCH SOFORT LÖSCHEN!
$passwort = 'HIER_DEIN_PASSWORT_EINGEBEN'; // ← anpassen

$hash = password_hash($passwort, PASSWORD_DEFAULT);
echo '<pre>';
echo 'Hash: ' . $hash . "\n\n";
echo 'Diesen Wert in credentials.json bei ADMIN_PASS_HASH eintragen.' . "\n";
echo 'Dann diese Datei löschen!';
echo '</pre>';
?>
