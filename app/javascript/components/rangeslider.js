import Slider from "bootstrap-slider";

const initRangeSlider = function () {
  var slider = new Slider("#ex6");
  console.log('slider');
  slider.on("slide", function(slideEvt) {
    $("#ex6SliderVal").text(slideEvt.value);
  });
}

export { initRangeSlider };
