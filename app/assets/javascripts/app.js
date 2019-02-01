$(document).ready(function() {
	function abrir(URL) {

		var width = 150;
		var height = 250;

		var left = 99;
		var top = 99;

		window.open(URL, 'janela', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');

	}
	
	$('#contrato').hide();
	$('#carne').hide();
	$('#gerarContrato').click(function() {
		$('#contrato').show();
		$('#showMatricula').hide();
		$('#carne').hide();
	});
	$('#gerarCarne').click(function() {
		$('#carne').show();
		$('#showMatricula').hide();
		$('#contrato').hide();
	});

});

function calcularMensalidade() {
	var desconto = parseFloat(document.getElementById('desconto').value) || 0.0;
	var valor_total = parseFloat(document.getElementById('valor_total').value)  - desconto || 0.0;
	var entrada = parseFloat(document.getElementById('entrada').value) || 0.0;
	var valor_pago = parseFloat(document.getElementById('valor_pago').value);

	document.getElementById('valor_total').value = ((valor_total - entrada).toFixed(2)) || 0.0;
	document.getElementById('valor_pago').value = (valor_pago + entrada).toFixed(2) || 0.0;
	
	$("#salvar").prop('disabled', false);
}
