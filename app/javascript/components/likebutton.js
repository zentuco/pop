function initActivateLikeButton() {
  const likebutton = document.querySelector('.like-button-request');
  if (likebutton.lenght != 0) {
    likebutton.addEventListener("click", () => {
      likebutton.classList.add('active');
    });
  }
}

export { initActivateLikeButton };
