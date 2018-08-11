function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-fixed-top');
  const navbarItem = document.querySelectorAll('.navbar-wagon-link-white');
  const navbarLogo = document.querySelector('.navbar-logo-white');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight - 110) {
        navbar.classList.add('navbar-wagon-white');
        navbarLogo.classList.remove('navbar-logo-white');
        navbarItem.forEach(function(item) {
          item.classList.remove('navbar-wagon-link-white');
          item.classList.add('navbar-wagon-link');
        });

      } else {
        navbar.classList.remove('navbar-wagon-white');
        navbarLogo.classList.add('navbar-logo-white');
        navbarItem.forEach(function(item) {
          item.classList.remove('navbar-wagon-link');
          item.classList.add('navbar-wagon-link-white');
        });
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
