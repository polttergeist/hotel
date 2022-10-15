const EMAIL_REGEXP = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/iu;

const input = document.querySelector('#review_email');

function onInput() {
    if (!isEmailValid(input.value)) {
        input.style.borderColor = 'red';
        if (!!document.querySelector('#invalid')) {
            document.querySelector('#invalid').remove()
        }
        if (!document.querySelector('#invalid')) {
            input.insertAdjacentHTML("afterend", "<p id='invalid'>Your email is invalid.<p/>")
        }
    } else {
        input.style.borderColor = 'green';
        if (!!document.querySelector('#invalid')) {
            document.querySelector('#invalid').remove()
        }
    }
}

if (!!input) {input.addEventListener('input', onInput);}

function isEmailValid(value) {
    return EMAIL_REGEXP.test(value);
}