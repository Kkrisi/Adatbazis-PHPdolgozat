<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dolgozat_KadarKristof</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <h1>PHP-Dolgozat-Kadar Kristof :)</h1>

    <h2>Táblázat - C csoport</h2>

    <table align = "left" border = "1" cellpadding = "3" cellspacing = "0">  
    <tr>  
    <td class="OszlopNev">Név</td>  
    <td class="OszlopNev">Klub neve</td>
    <td class="OszlopNev">Maximális méret</td> 
    </tr>  
    
    <?php
        $felhasznalok = array("Pitner Alexandra", "Néda Irisz", "Tar Gergo");
        $klubbok = array("Golf", "Poker", "Gamer");
        $maxMeret = array();


        for ($i = 0; $i < 3; $i++) {
            $szam = rand(10,50);
            $maxMeret[$i] = $szam;
          }
    




        for ($i = 0; $i < 3; $i++) {
            echo "<tr>";
            echo "<td>",$felhasznalok[$i],"</td>";
            echo "<td>",$klubbok[$i],"</td>";
            echo "<td>",$maxMeret[$i],"</td>";
            echo "</tr>";  
        }

    
    ?>

    </table>

</body>
</html>