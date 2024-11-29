var id = document.getElementById("a");
var mt = document.getElementById("button");

mt.addEventListener('click', function() {

    var m = id.value;

    fetch('https://jsonplaceholder.typicode.com/todos/'+id.value)
      .then(response => response.json())
      .then(json => {
        var a = document.querySelector("body > main > section > table > tbody > tr:nth-child(1) > td:nth-child(2)")
        a.innerHTML = json.userId
        var a = document.querySelector("body > main > section > table > tbody > tr:nth-child(2) > td:nth-child(2)")
        a.innerHTML = json.id
        var a = document.querySelector("body > main > section > table > tbody > tr:nth-child(3) > td:nth-child(2)")
        a.innerHTML = json.title
        var a = document.querySelector("body > main > section > table > tbody > tr:nth-child(4) > td:nth-child(2)")
        a.innerHTML = json.completed
      }
    )
})


