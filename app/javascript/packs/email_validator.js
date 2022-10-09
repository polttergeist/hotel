const EMAIL_REGEXP = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/iu;

const input1 = document.querySelector('#email');
const input2 = document.querySelector('#review_email');

function onInput1() {
    if (!isEmailValid(input1.value)) {
        input1.style.borderColor = 'red';
    } else {
        input1.style.borderColor = 'green';
    }
}

function onInput2() {
    if (!isEmailValid(input2.value)) {
        input2.style.borderColor = 'red';
    } else {
        input2.style.borderColor = 'green';
    }
}

input1.addEventListener('input', onInput1);
input2.addEventListener('input', onInput2);

function isEmailValid(value) {
    return EMAIL_REGEXP.test(value);
}