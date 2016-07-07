
// You dirty cheater.
// thanks Zach Holman!

stupid_shit = [
  "is a sea otter",
  "does not ever escape",
  "just wants followers",
  "refuses simple logos",
  "was replaced by a tiny shell script",
  "loves u",
  "loves cheesecake",
  "is a donut",
  "disagrees with bud selig",
  "made lots of mistakes",
  "made the holland great again",
  "ruined holland too",
  "is addicted to coffee",
  "is part of the problem",
  "failed as a human being",
  "still doesn't understand git",
  "reads a lot of books, once",
  "is a <marquee>&lt;marquee&gt;</marquee> tag",
  "reads every single RFC",
  "doesn't really have a twentsch accent",
  "sunk your battleship"
]

function randomness(){
	stupid_winner = stupid_shit[Math.floor(Math.random() * stupid_shit.length)];
	//document.getElementById("dope").innerHTML = " " + stupid_winner;
	setTimeout(randomness, 200);
}

document.addEventListener("DOMContentLoaded", function(event) {
	randomness();
})
