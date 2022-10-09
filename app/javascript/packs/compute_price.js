//add listener

const start_year = document.querySelector('#_start_date_1i').options[document.querySelector('#_start_date_1i').selectedIndex].text;
const start_month = document.querySelector('#_start_date_2i').options[document.querySelector('#_start_date_2i').selectedIndex].text;
const start_day = document.querySelector('#_start_date_3i').options[document.querySelector('#_start_date_3i').selectedIndex].text;
const end_year = document.querySelector('#_end_date_1i').options[document.querySelector('#_end_date_1i').selectedIndex].text;
const end_month = document.querySelector('#_end_date_2i').options[document.querySelector('#_end_date_2i').selectedIndex].text;
const end_day = document.querySelector('#_end_date_3i').options[document.querySelector('#_end_date_3i').selectedIndex].text;

const start = new Date(`${start_year}-${start_month}-${start_day}`);
const end = new Date(`${end_year}-${end_month}-${end_day}`);
const elapsed = end - start;
const computed = elapsed/86400000 * Number(document.querySelector('#cost').value)