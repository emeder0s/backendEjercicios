const express = require('express')
const puppeteer = require("puppeteer");
const pug = require('pug');
const app = express();

// Se indica el directorio donde se almacenarán las plantillas 
app.set('views', '.');

// Se indica el motor del plantillas a utilizar
app.set('view engine', 'pug');

app.use(express.static(".")); 
            
app.get('/', (req, res) => {
    (async () => {
        // Si headless esta en true, se oculta el chromium
        const browser = await puppeteer.launch({
          headless: false,
        });
        const page = await browser.newPage();
      
        await page.goto("https://moruecoceramicas.com/");
      
        const images = await page.$$eval("div.card__media img.motion-reduce", imgs =>  imgs.map(img => img.src));
        res.render('index.pug', { images: images})

        await browser.close();
      })();
});

app.listen(3000);