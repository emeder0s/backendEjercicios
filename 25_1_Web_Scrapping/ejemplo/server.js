// //? 1. Nos traemos la librería puppeteer (Resuelven en promesas)
// const puppeteer = require("puppeteer");

// //? 2. Obtener el navegador que vamos a utilizar.
// (async () => {
//   // Si headless esta en true, se oculta el chromium
//   const browser = await puppeteer.launch({
//     headless: false,
//   });
//   // Es como abrir una nueva página/pestaña en el navegador
//   const page = await browser.newPage();
//   // console.log("Abre el navegador");

//   // Para ir a una página en concreto.
//   await page.goto("http://www.amazon.es");
//   // console.log("Abrió Amazon");

//   // Para hacer click al mensaje de cookies.
//   await page.click("#sp-cc-accept");
//   // console.log("Clickeo");

//   //Hacemos una foto a la página
//   await page.screenshot({ path: "amazon.jpg" });
//   // console.log("Hizo Foto");

//   //Se cierra el navegador
//   await browser.close();
// })();

// const puppeteer = require("puppeteer");

// (async () => {
//   const browser = await puppeteer.launch({
//     headless: false,
//   });
//   const page = await browser.newPage();
//   await page.goto("http://www.amazon.es");

//   // Para hacer click al mensaje de cookies.
//   await page.click("#sp-cc-accept");

//   //Acceder al buscador de amazon por su selector. ('Selector','Búsqueda')
//   await page.type("#twotabsearchtextbox", "juegos");

//   //Click del botón de la búsqueda
//   await page.click(".nav-search-submit input");

//   //Espera (x) segundos
//   // await page.waitForTimeout(1000);

//   await page.screenshot({ path: "amazonJuegos.jpg" });
//   // await browser.close();
// })();