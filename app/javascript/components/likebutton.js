function initActivateLikeButton() {
  const likebutton = document.querySelector('.like-button-request');
  if (likebutton) {
    likebutton.addEventListener("click", () => {
      likebutton.classList.add('active');
    });
  }
}

export { initActivateLikeButton };
