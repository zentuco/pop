import Slider from "bootstrap-slider";

const initRangeSlider = function () {
  const element = document.getElementById("ex6");
  if (element) {
    var slider = new Slider("#ex6");
    slider.on("slide", function(slideEvt) {
      $("#ex6SliderVal").text(slideEvt.value);
    });
  }
}

export { initRangeSlider };
