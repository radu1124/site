<?php
$servername = "	185.199.108.153";
$username = "root";  // Schimbă aceste detalii după necesitate
$password = "";
$dbname = "EventsDB";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexiune eșuată: " . $conn->connect_error);
}

$city = $_GET['city'];
$eventType = $_GET['eventType'];
$startTime = $_GET['startTime'];
$endTime = $_GET['endTime'];

$sql = "SELECT e.name AS event_name, c.city_name, et.type_name, e.event_time
        FROM events e
        JOIN cities c ON e.city_id = c.id
        JOIN event_types et ON e.event_type_id = et.id
        WHERE (c.id = ? OR ? = '')
          AND (et.id = ? OR ? = '')
          AND (e.event_time >= ? OR ? = '')
          AND (e.event_time <= ? OR ? = '')";

$stmt = $conn->prepare($sql);
$stmt->bind_param("isississ", $city, $city, $eventType, $eventType, $startTime, $startTime, $endTime, $endTime);
$stmt->execute();

$result = $stmt->get_result();
$data = array();

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
