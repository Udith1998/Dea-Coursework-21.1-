
const fnameEl = document.querySelector('#fname');
const lnameEl = document.querySelector('#lname');
const nicEl = document.querySelector('#nic');
const emailEl = document.querySelector('#email');
const usernameEl = document.querySelector('#username');
const passwordEl = document.querySelector('#password');
const confirmPasswordEl = document.querySelector('#confirm-password');

const form = document.querySelector('#main_author_form');

const checkFirstName = () => {

    let valid = false;

    const min = 1,
        max = 30;

    const fname = fnameEl.value.trim();

    if (!isRequired(fname)) {
        showError(fnameEl, 'Please enter your first name.');
    } else if (!isBetween(fname.length, min, max)) {
        showError(fnameEl, 'First name must be between ${min} and ${max} characters.');
    } else {
        showSuccess(fnameEl);
        valid = true;
    }
    return valid;
};

const checkLastName = () => {

    let valid = false;

    const min = 1,
        max = 30;

    const lname = lnameEl.value.trim();

    if (!isRequired(lname)) {
        showError(lnameEl, 'Please enter your last name.');
    } else if (!isBetween(lname.length, min, max)) {
        showError(lnameEl, 'Last name must be between ${min} and ${max} characters.');
    } else {
        showSuccess(lnameEl);
        valid = true;
    }
    return valid;
};

const checkUsername = () => {

    let valid = false;

    const min = 3,
        max = 30;

    const username = usernameEl.value.trim();

    if (!isRequired(username)) {
        showError(usernameEl, 'Username cannot be blank.');
    } else if (!isBetween(username.length, min, max)) {
        showError(usernameEl, 'Username must be between ${min} and ${max} characters.');
    } else {
        showSuccess(usernameEl);
        valid = true;
    }
    return valid;
};

const checkNIC = () => {

    let valid = false;

    const min = 10,
        max = 12;

    const nic = nicEl.value.trim();

    if (!isRequired(nic)) {
        showError(nicEl, 'NIC cannot be blank.');
    } else if (!isBetween(nic.length, min, max)) {
        showError(nicEl, 'Please enter a valid NIC.');
    } else {
        showSuccess(nicEl);
        valid = true;
    }
    return valid;
};


const checkEmail = () => {
    
    let valid = false;
    
    const min = 3,
        max = 30;
    
    const email = emailEl.value.trim();
    
    if (!isRequired(email)) {
        showError(emailEl, 'Email cannot be blank.');
    } else if (!isEmailValid(email)) {
        showError(emailEl, 'Email is not valid.');
    } else {
        showSuccess(emailEl);
        valid = true;
    }
    return valid;
};

const checkPassword = () => {
    let valid = false;
    
    const min = 8,
        max = 30;

    const password = passwordEl.value.trim();

    if (!isRequired(password)) {
        showError(passwordEl, 'Password cannot be blank.');
    } else if (!isPasswordSecure(password)) {
        showError(passwordEl, 'Password must have at least 8 characters that include at least 1 lowercase character, 1 uppercase characters, 1 number, and 1 special character in (!@#$%^&*)');
    } else {
        showSuccess(passwordEl);
        valid = true;
    }

    return valid;
};

const checkConfirmPassword = () => {
    let valid = false;
    // check confirm password
    const confirmPassword = confirmPasswordEl.value.trim();
    const password = passwordEl.value.trim();

    if (!isRequired(confirmPassword)) {
        showError(confirmPasswordEl, 'Please enter the password again');
    } else if (password !== confirmPassword) {
        showError(confirmPasswordEl, 'The password does not match');
    } else {
        showSuccess(confirmPasswordEl);
        valid = true;
    }

    return valid;
};

const isEmailValid = (email) => {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
};

const isPasswordSecure = (password) => {
    const re = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
    return re.test(password);
};

const isRequired = value => value === '' ? false : true;
const isBetween = (length, min, max) => length < min || length > max ? false : true;


const showError = (input, message) => {
    // get the form-field element
    const formField = input.parentElement;
    // add the error class
    formField.classList.remove('success');
    formField.classList.add('error');

    // show the error message
    const error = formField.querySelector('small');
    error.textContent = message;
};

const showSuccess = (input) => {
    // get the form-field element
    const formField = input.parentElement;

    // remove the error class
    formField.classList.remove('error');
    formField.classList.add('success');

    // hide the error message
    const error = formField.querySelector('small');
    error.textContent = '';
};


//form.addEventListener('submit', function (e) {
//    // prevent the form from submitting
//    e.preventDefault();
//
//    // validate fields
//    let isUsernameValid = checkUsername(),
//        isEmailValid = checkEmail(),
//        isPasswordValid = checkPassword(),
//        isConfirmPasswordValid = checkConfirmPassword();
//        isFirstNameValid = checkFirstName();
//        isLastNameValid = checkLastName();
//        isNICValid = checkNIC();
//
//    let isFormValid = isFirstNameValid &&
//        isLastNameValid &&
//        isNICValid &&
//        isUsernameValid &&
//        isEmailValid &&
//        isPasswordValid &&
//        isConfirmPasswordValid;
//
//    // submit to the server if the form is valid
//    if (isFormValid) {
//        <jsp:forward page ="signup.jsp" />;
//    }
//});


const debounce = (fn, delay = 500) => {
    let timeoutId;
    return (...args) => {
        // cancel the previous timer
        if (timeoutId) {
            clearTimeout(timeoutId);
        }
        // setup a new timer
        timeoutId = setTimeout(() => {
            fn.apply(null, args);
        }, delay);
    };
};

form.addEventListener('input', debounce(function (e) {
    switch (e.target.id) {
        case 'fname':
            checkFirstName();
            break;
        case 'lname':
            checkLastName();
            break;
        case 'nic':
            checkNIC();
            break;
        case 'email':
            checkEmail();
            break;
        case 'username':
            checkUsername();
            break;
        case 'password':
            checkPassword();
            break;
        case 'confirm-password':
            checkConfirmPassword();
            break;
    }
}));

