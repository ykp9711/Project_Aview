/*
	Drift by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
*/

(function($) {

	var $window = $(window),
		$body = $('body'),
		$banner = $('#banner'),
		$header = $('#header');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '361px',   '480px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Scrolly links.
		$('.scrolly').scrolly({
			offset: function() { return $header.outerHeight() - 10; }
		});

	// Header.
	// If the header is using "alt" styling and #banner is present, use scrollwatch
	// to revert it back to normal styling once the user scrolls past the banner.
		if ($header.hasClass('alt')
		&&	$banner.length > 0) {

			$window.on('resize', function() { $window.trigger('scroll'); });

			$banner.scrollex({
				bottom:		$header.outerHeight() + 5,
				terminate:	function() { $header.removeClass('alt'); },
				enter:		function() { $header.addClass('alt'); },
				leave:		function() { $header.removeClass('alt'); $header.addClass('reveal'); }
			});

		}

	// Dropdowns.
		$('#nav > ul').dropotron({
			alignment: 'right'
		});

	// Nav Panel.

		// Title Bar.
			$(
				'<div id="navButton">' +
					'<a href="#navPanel" class="toggle"></a>' +
				'</div>'
			)
				.appendTo($body);

		// Panel.
			$(
				'<div id="navPanel">' +
					'<nav>' +
						$('#nav').navList() +
					'</nav>' +
				'</div>'
			)
				.appendTo($body)
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					side: 'left',
					target: $body,
					visibleClass: 'navPanel-visible'
				});

	// Slider.
		var $sliders = $('.slider');

		if ($sliders.length > 0) {

			$sliders.slidertron({
				mode: 'fadeIn',
				seamlessWrap: true,
				viewerSelector: '.viewer',
				reelSelector: '.viewer .reel',
				slidesSelector: '.viewer .reel .slide',
				advanceDelay: 0,
				speed: 400,
				fadeInSpeed: 1000,
				autoFit: true,
				autoFitAspectRatio: (840 / 344),
				navPreviousSelector: '.nav-previous',
				navNextSelector: '.nav-next',
				indicatorSelector: '.indicator ul li',
				slideLinkSelector: '.link'
			});

			$window
				.on('resize load', function() {
					$sliders.trigger('slidertron_reFit');
				})
				.trigger('resize');

		}

})(jQuery);