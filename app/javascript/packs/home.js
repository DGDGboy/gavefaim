console.log("blabla")

import { loadDynamicBannerText } from '../components/banner';

document.addEventListener('turbolinks:load', () => {
loadDynamicBannerText();
});

