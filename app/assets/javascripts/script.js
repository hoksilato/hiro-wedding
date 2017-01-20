$(document).on('turbolinks:load', function() {
	"use strict";

	$.firefly({
		color: '#f00', minPixel: 1, maxPixel: 3, total : 55, on: '.into_firefly'
	});
});
