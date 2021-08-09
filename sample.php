<?php
  $link = mysqli_connect('mariadb', 'cs332d19', 'zixahP9l', 'cs332d19');
  if (!$link) {
    die('Could not connect: ' .mysql_error());
  }

  if (isset($_POST['submit-1'])) {
    echo "<h2>Professor Class Data:</h2><hr>";
    $query = "SELECT C.Title, S.Classroom, S.MeetingDays, S.BeginningTime, S.EndTime FROM PROFESSOR P, SECTION S, COURSE C WHERE P.SSN = S.ProfessorSSN AND S.CourseNumber = C.Number AND P.SSN = ".'"'.$_POST["profSSN"].'"';
    $result = $link->query($query);
    $rowCount = $result->num_rows;

    for ($i = 0; $i < $rowCount; $i++) {
      $row = $result->fetch_assoc();
      echo "COURSE TITLE: ".$row["Title"]."<p>";
      echo "CLASSROOM: ".$row["Classroom"]."<p>";
      echo "MEETING DAYS: ".$row["MeetingDays"]."<p>";
      echo "BEGINNING TIME: ".$row["BeginningTime"]."<p>";
      echo "END TIME: ".$row["EndTime"]."<p><hr>";
    }

    $result->free_result();
    $link->close();
  }
  elseif(isset($_POST['submit-2'])) {
    echo "<h2>Grade Distribution:</h2><hr>";
    $query = "SELECT E.Grade, COUNT(*) FROM COURSE C, SECTION S, ENROLLMENT E WHERE E.SecNumber = S.SecNumber AND S.CourseNumber = C.Number AND S.SecNumber = ".'"'.$_POST["sectionNum"].'"'."AND S.CourseNumber = ".'"'.$_POST["courseNum"].'"'."GROUP BY E.Grade";
    $result = $link->query($query);
    $rowCount = $result->num_rows;

    for ($i = 0; $i < $rowCount; $i++) {
      $row = $result->fetch_assoc();
      echo "GRADE: ".$row["Grade"]."<p>";
      echo "TOTAL: ".$row["COUNT(*)"]."<p><hr>";
    }

    $result->free_result();
    $link->close();
  }
  elseif(isset($_POST['submit-3'])) {
    echo "<h2>Course Data:</h2><hr>";
    $query = "SELECT S.SecNumber, S.Classroom, S.MeetingDays, S.BeginningTime, S.EndTime, COUNT(*) FROM COURSE C, SECTION S, ENROLLMENT E WHERE C.Number = S.CourseNumber AND E.SecNumber = S.SecNumber AND C.Number = ".'"'.$_POST['cNUM'].'"'."GROUP BY E.SecNumber";
    $result = $link->query($query);
    $rowCount = $result->num_rows;

    for ($i = 0; $i < $rowCount; $i++) {
      $row = $result->fetch_assoc();
      echo "SECTION NUMBER: ".$row["SecNumber"]."<p>";
      echo "CLASSROOM: ".$row["Classroom"]."<p>";
      echo "MEETING DAYS: ".$row["MeetingDays"]."<p>";
      echo "BEGINNING TIME: ".$row["BeginningTime"]."<p>";
      echo "END TIME: ".$row["EndTime"]."<p>";
      echo "TOTAL ENROLLMENT: ".$row["COUNT(*)"]."<p><hr>";
    }

    $result->free_result();
    $link->close();
  }
  elseif(isset($_POST['submit-4'])) {
    echo "<h2>Student Grades:</h2><hr>";
    $query = "SELECT C.Number, C.Title, E.Grade FROM ENROLLMENT E, SECTION S, COURSE C, STUDENT ST WHERE E.SecNumber = S.SecNumber AND S.CourseNumber = C.Number AND E.StudentCWID = ST.CWID AND ST.CWID = ".'"'.$_POST["CWID"].'"';
    $result = $link->query($query);
    $rowCount = $result->num_rows;

    for ($i = 0; $i < $rowCount; $i++) {
      $row = $result->fetch_assoc();
      echo "COURSE NUMBER: ".$row["Number"]."<p>";
      echo "TITLE: ".$row["Title"]."<p>";
      echo "GRADE: ".$row["Grade"]."<p><hr>";
    }

    $result->free_result();
    $link->close();
  }
?>
