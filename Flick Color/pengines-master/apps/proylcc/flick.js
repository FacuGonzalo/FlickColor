// Reference to object provided by pengines.js library which interfaces with Pengines server (Prolog-engine)
// by making query requests and receiving answers.
var pengine;
// Bidimensional array representing grid configuration.
var gridData;
// Bidimensional array with grid cells elements.
var cellElems = null;
// Number of turns
var turns = -1;
// Reference to element displaying turns
var turnsElem;
// Almacena el resultado de la ayuda simple
var resAyudaSimple;
// almacena el resultado de la ayuda extendida
var resAyudaExtendida;

/**
 * Representation of color enumerate as object where each property key defines an enum value (a color), and the
 * associated property value (the string) defines the color name.
 *
 * Values: RED, VIOLET, PINK, GREEN, BLUE, YELLOW
 */

const colors = Object.freeze({
    RED : "red",
    VIOLET : "violet",
    PINK : "pink",
    GREEN : "green",
    BLUE : "blue",
    YELLOW : "yellow"
});

/*
 * Returns the Prolog representation of the received color
 */

function colorToProlog(color) {
    return colors[color].charAt(0);
}

/*
 * Returns the color in colors enum associated to pColor, in Prolog representation.
 */

function colorFromProlog(pColor) {
    for (let color in colors) {
        if (colorToProlog(color) == pColor)
            return color;
    }
    return null;
}

/*
 * Returns the CSS representation of the received color.
 */

function colorToCss(color) {
    return colors[color];
}

/**
* Initialization function. Requests to server, through pengines.js library, 
* the creation of a Pengine instance, which will run Prolog code server-side.
*/

function init() {
    turnsElem = document.getElementById("turnsNum");
    pengine = new Pengine({
        server: "http://localhost:3030/pengine",
        application: "proylcc",
        oncreate: handleCreate,
        onsuccess: handleSuccess,
        destroy: false
    });

    var buttonsPanelElem = document.getElementById("buttonsPanel");

    for (let color in colors) {
        var buttonElem = document.createElement("button");
        buttonElem.className = "colorBtn";
        buttonElem.style.backgroundColor = colorToCss(color);
		buttonElem.setAttribute("id","boton"+color);
        buttonElem.addEventListener("click", function(e) {
            handleColorClick(color);
        });
        buttonsPanelElem.appendChild(buttonElem);
    }
	
	document.getElementById("mostrarAyudaSimple").addEventListener("click", function(e) {
		ayuda();
	});
	
	document.getElementById("mostrarAyudaExtendida").addEventListener("click", function(e) {
		ayudaExtendida();
	});
	
	document.getElementById("gridSelectBtn").addEventListener("click", function(e) {
		handleCreate();
	});
}

/**
 * Callback for Pengine server creation
 */

function handleCreate() {
	var NGrilla = Math.floor(Math.random() * (4 - 1 + 1)) + 1;
    pengine.ask("grid("+NGrilla+", Grid)");
	turns = -1;
}

/**
 * Callback for successful response received from Pengines server
 */

function handleSuccess(response) {
	for (let color in colors) 
	{
		var botonElem = document.getElementById("boton"+color);
		botonElem.innerHTML = "";
		botonElem.style.color = "black";
	}
	var gridDataAux = gridData;
    gridData = response.data[0].Grid;
	if(gridData != undefined)
	{
		if (cellElems == null) 
		{
			turns = 0;
			createGridElems(gridData.length, gridData[0].length);	
		}
		else 
		{
			if(turns < 0)
				turns = 0;
			else
				if(gridDataAux[0][0]!==gridData[0][0])
					turns++;
		}		
		for (let row = 0; row < gridData.length; row++)
			for (let col = 0; col < gridData[row].length; col++)
				cellElems[row][col].style.backgroundColor = colorToCss(colorFromProlog(gridData[row][col]));
			turnsElem.innerHTML = turns;						
	}
	else
	{
		resAyudaSimple = response.data[0].ResultadoSimple;
		if(resAyudaSimple != undefined) 
		{
			var i = 0;
			for (let color in colors) {
				var botonElem = document.getElementById("boton"+color);
				var valor = resAyudaSimple[i];
				botonElem.innerHTML = valor;
				i++;
			}
			resAyudaSimple = undefined;
		}
		else
		{
			resAyudaExtendida = response.data[0].ResultadoExtendido;
			if(resAyudaExtendida != undefined) 
			{
				var i = 0;
				for (let color in colors) {
					var botonElem = document.getElementById("boton"+color);
					var valor = resAyudaExtendida[i][1];
					botonElem.innerHTML = ""+valor;
					var colorTexto = resAyudaExtendida[i][0];
					botonElem.style.color = ""+colorTexto;
					i++;
				}
				resAyudaExtendida = undefined;
			}
		}
		gridData = gridDataAux;
	}
}

/**
 * Create grid cells elements
 */

function createGridElems(numOfRows, numOfCols) {
    var gridElem = document.getElementById("grid");
    cellElems = [];
    for (let row = 0; row < numOfRows; row++) {
        cellElems[row] = [];
        for (let col = 0; col < numOfCols; col++) {
            var cellElem = document.createElement("div");
            gridElem.appendChild(cellElem);
            cellElems[row][col] = cellElem;
        }
    }
}

/**
 * Handler for color click. Ask query to Pengines server.
 */

function handleColorClick(color) {
    var s = "flick(" + Pengine.stringify(gridData) + "," + Pengine.stringify(colorToProlog(color)) + ",Grid)";
    pengine.ask(s)
}

function ayuda() {
	var s = "ayudaSimple(" + Pengine.stringify(gridData) + ", ResultadoSimple)";
	pengine.ask(s);
}

function ayudaExtendida() {
	var s = "ayudaExtendida(" + Pengine.stringify(gridData) + ", ResultadoExtendido)";
	pengine.ask(s);
}

/**
* Call init function after window loaded to ensure all HTML was created before
* accessing and manipulating it.
*/

window.onload = init;