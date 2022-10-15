function computePrice() {
    let start_year = document.querySelector('#_start_date_1i').options[document.querySelector('#_start_date_1i').selectedIndex].text;
    let start_month = document.querySelector('#_start_date_2i').options[document.querySelector('#_start_date_2i').selectedIndex].text;
    let start_day = document.querySelector('#_start_date_3i').options[document.querySelector('#_start_date_3i').selectedIndex].text;
    let end_year = document.querySelector('#_end_date_1i').options[document.querySelector('#_end_date_1i').selectedIndex].text;
    let end_month = document.querySelector('#_end_date_2i').options[document.querySelector('#_end_date_2i').selectedIndex].text;
    let end_day = document.querySelector('#_end_date_3i').options[document.querySelector('#_end_date_3i').selectedIndex].text;

    let start = new Date(`${start_year}-${start_month}-${start_day}`);
    let end = new Date(`${end_year}-${end_month}-${end_day}`);
    let elapsed = end - start;
    let computed = elapsed / 86400000 * Number(document.querySelector('#cost').innerHTML);
    return computed
}

function onChange() {
    if (!!document.querySelector('#computed')) {
        document.querySelector('#computed').remove();
    }
    if (!document.querySelector('#computed')) {
        document.querySelector('#form').insertAdjacentHTML("afterend",
            `<p id="computed" style="background-color: white;" class="text-center col-xs-2 col-xs-offset-5">Computed price of living : ${computePrice()}</p>`)
    }
}

document.querySelector('#_start_date_1i').addEventListener('change', onChange);
document.querySelector('#_start_date_2i').addEventListener('change', onChange);
document.querySelector('#_start_date_3i').addEventListener('change', onChange);
document.querySelector('#_end_date_1i').addEventListener('change', onChange);
document.querySelector('#_end_date_2i').addEventListener('change', onChange);
document.querySelector('#_end_date_3i').addEventListener('change', onChange);