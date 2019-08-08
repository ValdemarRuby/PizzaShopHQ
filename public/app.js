function something() {

  var x = window.localStorage.getItem('key');

  window.localStorage.setItem('key', 'value');

  alert(x);
}
