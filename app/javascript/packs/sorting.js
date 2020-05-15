document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')
  //NodeList
  //https://developer.mozilla.org/ru/docs/Web/API/Nodelist
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }


  var sortedTable = document.createElement('table')
  tableClasses = ['table', 'table-hover', 'table-sm', 'table-responsive']
  
  for(i = 0; i < tableClasses.length; i++) {
    sortedTable.classList.add(tableClasses[i])   
  }
  
  var header = sortedTable.createTHead()
  header.classList.add('text-center')
  header.classList.add('thead-dark')

  header.appendChild(rows[0])

  sortedTable.appendChild(header)

  var tbody = document.createElement("TBODY")

  for(var i=0; i < sortedRows.length; i++) {
    tbody.appendChild(sortedRows[i])
  }
  sortedTable.appendChild(tbody)

  table.parentNode.replaceChild(sortedTable, table)

}

function compareRowsAsc(row1, row2){
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2){
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
