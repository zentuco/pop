
const initTabs = function() {
  const tabs = document.querySelectorAll(".tab");
  tabs.forEach((tab) => {
    tab.addEventListener("click", toggleTabs);
  })
}


const toggleTabs = function(event) {
  const tabs = document.querySelectorAll(".tab");
  tabs.forEach((tab) => {
    tab.classList.remove('active');
  event.target.classList.add('active');
  })

  const section = event.currentTarget.getAttribute("data-page");
  const sectionElement = document.querySelector(section);
  const allSections = document.querySelectorAll('.tab-section');

  allSections.forEach((section) => {
    section.classList.remove("active")
  });
  sectionElement.classList.add("active")
}

export { initTabs };
