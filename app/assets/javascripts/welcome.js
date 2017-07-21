{$(document).ready(function() {
$('#chuck').on('click', function() {
$.ajax({
url: 'https://api.chucknorris.io/jokes/random',
method: 'get',

success: function(response) {
console.log(response)
console.log(response.value)
var url = response.value
$('#gif-container').html(url)
},
beforeSend: function() {
$('#gif-container').html('Loading...')
}
})
})
})}