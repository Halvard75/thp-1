// MERCI https://github.com/clauel/JS101_grille


// (#1) demander taille + la retenir
var leNombre = prompt("Super, STP entre un nombre entier entre 1 et 70");   // demande la taille 
console.log(leNombre);                                                      // retiens la taille

// (#2) formation des carrés
var GridTable = document.getElementById("lesCarres");

var inside = "";     // ce qu'il y a à l'intérieur de la box

// (#3) euhhh ?????? 

function MkeGrid()  {     //function grid http://docs.opendap.org/index.php/Server_Side_Processing_Functions

    for (var i = 0; i < leNombre; i++)      {
        var insideCol = "";
        for (var j = 0; j < leNombre; j++)      {
            insideCol = insideCol + "<td></td>";
                                                }
        inside = inside + "<tr>" + insideCol + "</tr>";
                                            }
    GridTable.innerHTML = inside;
                    }

MkeGrid();

var allTd = document.getElementsByTagName("td");
var allTdLen = allTd.length;

for (var i = allTd.length - 1; i >= 0; i--) {
    allTd[i].style.width = (70 / leNombre) + "px";
    allTd[i].style.height = (70 / leNombre) + "px";
    allTd[i].style.border= "groove 0.1px";
}