$('#item_zero').click(function () {
        $('#item_first').show();
});

$('#item_first').click(function () {
        $('#item_second').show();
});

$('#item_second').click(function () {
        $('#item_third').show();
});

$('#item_third').click(function () {
        $('body').attr('style', 'background-image: url("' + ('img/bg.jpeg') +'")');
});








