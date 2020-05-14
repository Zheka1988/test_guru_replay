document.addEventListener('turbolinks:load', function() {
  var passwordConfirmation = document.querySelector('.password_confirm')
  if (passwordConfirmation) { 
    passwordConfirmation.addEventListener('input', matchPass) }
})

function matchPass(){
  var password = document.querySelector('.password')
  var passwordConfirmation = document.querySelector('.password_confirm')

  if (passwordConfirmation.value == '') {
    passwordConfirmation.classList.remove('border-success');
    passwordConfirmation.classList.remove('border-danger');
  } else if (password.value == passwordConfirmation.value) {
    passwordConfirmation.classList.add('border-success');
    passwordConfirmation.classList.remove('border-danger');
  } else {
    passwordConfirmation.classList.add('border-danger');
    passwordConfirmation.classList.remove('border-success');
  }

}
