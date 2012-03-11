$(document).ready(function() {
	$('#collect-currencies-form').live({
		'ajax:success': function(evt, data, status, xhr) {
			$(this).find(':checkbox[checked="checked"]').attr('disabled', true);
			var pie = $('#collected_currencies_chart').data('pie_chart');
			pie.sets['Collected'] = data.visited;
			pie.sets['Not Collected'] = data.not_visited;
			pie.render();
			$(data.collected).each(function() {
				$('#currency_status_' + this).html('Collected');
			});
		},
		'ajax:error': function(evt, xhr, status, error) {
			alert('Something went wrong!');
		}
	});
	
	$('#visit-countries-form').live({
		'ajax:success': function(evt, data, status, xhr) {
			$.each(data.countries, function(){
				$('#country_code_' + this).attr('disabled', true);
				$('#country_status_' + this).html('Visited');
			});
			$.each(data.uncheck, function(){
				$('#country_code_' + this).attr('checked', false);
			});
			var pie = $('#visited_countries_chart').data('pie_chart');
			pie.sets['Visited'] = data.visited;
			pie.sets['Not Visited'] = data.not_visited;
			pie.render();
		},
		'ajax:error': function(evt, xhr, status, error) {
			alert('Something went wrong!');
		}
	});
	
	$('.filter-form').live({
		'ajax:success': function(evt, data, status, xhr) {
			var container = $(evt.target).data('container');
			$(container).html(data);
		}
	});
	
	$('.select-all').live('click', function() {
		$($(this).data('container')).find(':checkbox').attr('checked', true);
	});
	
});
