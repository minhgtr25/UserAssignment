document.addEventListener('DOMContentLoaded', function() {
    // Toggle sidebar
    const menuToggle = document.getElementById('menu-toggle');
    const wrapper = document.getElementById('wrapper');
    
    if (menuToggle) {
        menuToggle.addEventListener('click', function() {
            wrapper.classList.toggle('toggled');
        });
    }
    
    // Handle window resize
    function handleResize() {
        if (window.innerWidth < 992) {
            wrapper.classList.add('toggled');
        } else {
            wrapper.classList.remove('toggled');
        }
    }
    
    // Initial check
    handleResize();
    
    // Listen for window resize
    window.addEventListener('resize', handleResize);
});