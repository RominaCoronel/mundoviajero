import submenuHeader, { menuMobile, scrollButton, scrollHeader } from "./menu_header.js"
import slider from "./slider.js";

document.addEventListener('DOMContentLoaded', e => {
    submenuHeader('.cta-submenu', '.sub-menu');
    scrollHeader();
    menuMobile('.cta-menu-mobile', '.navbar-mobile', '.navbar-mobile .menu a');
    scrollButton();
    slider();
})