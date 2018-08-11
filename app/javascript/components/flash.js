const initFlash = function() {
  const flashEl = document.querySelector(".alert");
  if (flashEl) {
    setTimeout(function(){
      flashEl.remove();
    },2500);
  }
}

export { initFlash }
