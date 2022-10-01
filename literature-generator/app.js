const axios = require('axios');
const jssoup = require('jssoup').default;
const fs = require('fs');
const transliteration = require('transliteration');

function main() {
  (async function async_main() {
    await MyApp();
  })();
}

main();

async function MyApp() {
  try {
    const FILE_CONTENT = fs.readFileSync('input.txt', 'utf8');
    let array_links = FILE_CONTENT.split('\n');
    array_links = array_links.filter((e) => (e === '' ? undefined : e));
    console.log(array_links);

    let array = [];

    for (let i = 0; i < array_links.length; ++i) {
      const e = array_links[i];
      try {
        const RESPONSE = await axios.get(e);

        if (RESPONSE.status === 404) {
          console.log('================================404');
          return;
        }

        const HTML = RESPONSE.data;
        const SOUP = new jssoup(HTML);

        const TAG_HTML = SOUP.find('html');
        const HTML_LANG =
          TAG_HTML?.attrs?.lang === 'ru' ? TAG_HTML.attrs.lang : 'en';

        const TAG_TITLE = SOUP.find('title');
        const TITLE = TAG_TITLE?.text?.trim();

        const TRANS = transliteration
          .slugify(TITLE)
          .replaceAll('-', '_')
          .replaceAll('.', '')
          .replaceAll('__', '_')
          .replaceAll('__', '_');

        array.push({
          HTML_LANG,
          TITLE,
          TRANS,
          URL: e,
        });
      } catch (err) {
        console.log('' + err);
        console.log(e);
        console.log('===');

        array.push({
          HTML_LANG: 'en',
          TITLE: '' + err,
          TRANS: `index${i}`,
          URL: e,
        });
        array.push({
          HTML_LANG: 'ru',
          TITLE: '' + err,
          TRANS: `index${i}`,
          URL: e,
        });
      }
    }

    let tex = `
\\begingroup
    \\phantomsection
    \\addcontentsline{toc}{section}{Список использованных источников}
    \\section*{Список использованных источников}
  
    \\renewcommand{\addcontentsline}[3]{}% Remove functionality of \addcontentsline
    \\renewcommand{\section}[2]{}% Remove functionality of \section
  
    \\begin{thebibliography}{}
`;

    const DATE = new Date();

    const DATE_date = DATE.getDate();
    const DATE_DATE = DATE_date < 10 ? `0${DATE_date}` : `${DATE_date}`;

    const DATE_month = DATE.getMonth() + 1;
    const DATE_MONTH = DATE_month < 10 ? `0${DATE_month}` : `${DATE_month}`;

    const DATE_YEAR = DATE.getFullYear();

    array.forEach((e) => {
      tex += `
    \\bibitem{${e.TRANS}}
    ${e.TITLE}
    ${e.HTML_LANG === 'ru' ? '[Электронный ресурс]' : '[Electronic resource]'}.
    ${e.HTML_LANG === 'ru' ? 'Режим доступа' : 'Mode of access'}: \\url{${
        e.URL
      }}
    ${
      e.HTML_LANG === 'ru' ? 'Дата~доступа' : 'Date of access'
    }: ${DATE_DATE}.${DATE_MONTH}.${DATE_YEAR}.
`;
    });

    tex += `
    \\end{thebibliography}
\\endgroup
    
\\newpage
`;

    console.log(tex);
    fs.writeFileSync('output.txt', tex);
  } catch (error) {
    console.log(error);
  }
}
