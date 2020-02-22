var initMoveZero = () => {
  window.moveZero = function() {
    var elem = document.querySelector(".zero");
    elem.style.display = "block";
    var pos = -10;
    var id = setInterval(frame, 60);
    function frame() {
      if (pos == 100) {
        clearInterval(id);
        elem.style.display = "none";
      } else {
        pos++;
        elem.style.left = pos + 'vw';
      }
    }
  }
}

export { initMoveZero };
