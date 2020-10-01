import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Deux amoureux de la gastronomie vous présentent leurs découvertes culinaires bordelaises"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
