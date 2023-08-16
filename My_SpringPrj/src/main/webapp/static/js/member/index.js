

var dksk1 = document.querySelector(".dksk1");
var dksk2 = document.querySelector(".dksk2");
var dksk3 = document.querySelector(".dksk3");
var good1 = document.querySelector(".good1");
var good2 = document.querySelector(".good2");
var good3 = document.querySelector(".good3");

dksk1.addEventListener("click", function(){
	dksk1.style.fontWeight = "bold";
	dksk2.style.fontWeight = "normal";
	dksk3.style.fontWeight = "normal";
	good1.style.display = "block";
	good2.style.display = "none";
	good3.style.display = "none";
	
});
dksk2.addEventListener("click", function(){
	dksk1.style.fontWeight = "normal";
	dksk2.style.fontWeight = "bold";
	dksk3.style.fontWeight = "normal";
	good1.style.display = "none";
	good2.style.display = "block";
	good3.style.display = "none";
	
});
dksk3.addEventListener("click", function(){
	dksk1.style.fontWeight = "normal";
	dksk2.style.fontWeight = "normal";
	dksk3.style.fontWeight = "bold";
	good1.style.display = "none";
	good2.style.display = "none";
	good3.style.display = "block";
	
});


var mapleJob_all = document.querySelector("#mapleJob_all");
var mapleJob_warrior = document.querySelector("#mapleJob_warrior");
var mapleJob_Wizard = document.querySelector("#mapleJob_Wizard");
var mapleJob_archer = document.querySelector("#mapleJob_archer");
var mapleJob_bandit = document.querySelector("#mapleJob_bandit");
var mapleJob_Pirate = document.querySelector("#mapleJob_Pirate");

var this0 = document.querySelector(".this0");
var this1 = document.querySelector(".this1");
var this2 = document.querySelector(".this2");
var this3 = document.querySelector(".this3");
var this4 = document.querySelector(".this4");
var this5 = document.querySelector(".this5");

mapleJob_all.addEventListener("click", function(){
	this0.style.display = "block";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight = "bold";
	mapleJob_warrior.style.fontWeight = "normal";
	mapleJob_Wizard.style.fontWeight = "normal";
	mapleJob_archer.style.fontWeight = "normal";
	mapleJob_bandit.style.fontWeight = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_warrior.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "block";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "bold";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_Wizard.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "block";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "bold";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_archer.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "block";
	this4.style.display = "none";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "bold";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_bandit.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "block";
	this5.style.display = "none";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "bold";
	mapleJob_Pirate.style.fontWeight  = "normal";
	
});
mapleJob_Pirate.addEventListener("click", function(){
	this0.style.display = "none";
	this1.style.display = "none";
	this2.style.display = "none";
	this3.style.display = "none";
	this4.style.display = "none";
	this5.style.display = "block";
	mapleJob_all.style.fontWeight  = "normal";
	mapleJob_warrior.style.fontWeight   = "normal";
	mapleJob_Wizard.style.fontWeight  = "normal";
	mapleJob_archer.style.fontWeight  = "normal";
	mapleJob_bandit.style.fontWeight  = "normal";
	mapleJob_Pirate.style.fontWeight  = "bold";
	
});

const mapleFree_show = document.querySelector(".mapleFree_show")
mapleFree_show.addEventListener("click", function(){
	window.location.href = "board_Free.do";
});

window.addEventListener("DOMContentLoaded", function() {
	$.ajax({
        url: "updategogo.do",
        type: "POST",
        data: { "gogo": 1 },
        dataType: "text",
        success: function(result) {
        },
        error: function() {
        }
    });
});




