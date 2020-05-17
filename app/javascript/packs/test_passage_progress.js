document.addEventListener('turbolinks:load', function(){
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    var questionNumber = progressBar.getAttribute('value')
    var questionsCount = progressBar.getAttribute('max')

    var percent = ((questionNumber * 100) / questionsCount).toFixed(1) + '%'
    progressBar.style.width = percent;
    progressBar.innerHTML = percent;
  }
})
