const initProgressbar = function() {
  const progressbar = document.getElementById('progressbar');
  let current_step;

  if (progressbar) {
    const steps = progressbar.querySelectorAll('li');
    const nextBtns = document.querySelectorAll('.next-btn');
    const prevBtns = document.querySelectorAll('.prev-btn');
    current_step = 1;

    nextBtns.forEach((next) => {
      next.addEventListener('click', () => {
        current_step += 1;

        steps.forEach((step) => {
          if (step.dataset.step == current_step) {
            step.classList.add('active');
          }
        });
      })
    });

    prevBtns.forEach((prev) => {
      prev.addEventListener('click', () => {
        steps.forEach((step) => {
          if (step.dataset.step == current_step) {
            step.classList.remove('active');
          }
        });

        current_step -= 1;
      })
    });
  }
};

export { initProgressbar };
