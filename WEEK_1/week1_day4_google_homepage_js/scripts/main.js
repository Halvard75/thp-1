/* (#1) bouton à l'ouverture de la page pour faire apparaître 
le bloc avec logo + form + boutons */

let content_bloc = document.getElementById("bloc_central");
let boutonStart = document.getElementById("bouton_affichage");

boutonStart.onclick = function ()
{
	content_bloc.style.display = 'block';
	boutonStart.style.display = 'none';
}


// (#2) bouton qui va faire la recherche google 

function RedirectionJavascript(){
	var maRecherche = document.getElementById('form_search').value;
  	document.location.href="https://www.google.fr/#q=" + maRecherche; 
}

// (#3) pop up de fesse

function open_infos()
{
    width = 300;
    height = 250;
    
    if(window.innerWidth)
    {
        var left = (window.innerWidth-width)/2;
        var top = (window.innerHeight-height)/2;
    }
    else
    {
        var left = (document.body.clientWidth-width)/2;
        var top = (document.body.clientHeight-height)/2;
    }

    window.open('popup.html','fenetre','menubar=yes, scrollbars=no, top='+top+', left='+left+', width='+width+', height='+height+'');
}