$(document).ready(function() {
	$('#tableCliente, #tableProduto,#tableMarca,#tableModelo,#tableVenda').DataTable({
		"language": {
	        "url": "/GoldVisionProject/resources/js/Portuguese-Brasil.json"
	    }
	});
	$("#dataNasc").datepicker({
		changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        language: 'pt-BR'
	});
});